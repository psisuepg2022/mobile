import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/modules/patients/patients_controller.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/shared/models/Patient/patient_model.dart';
import 'package:mobile/shared/widgets/patient_card/patient_card_widget.dart';

import '../../service/index.dart';
import '../../shared/models/Error/error_response_model.dart';
import '../../shared/themes/app_colors.dart';
import '../../shared/widgets/snackbar/snackbar_widget.dart';
import '../../shared/widgets/text_input/text_input.dart';

class PatientsPage extends ConsumerStatefulWidget {
  const PatientsPage({super.key});

  @override
  ConsumerState<PatientsPage> createState() => _PatientsPageState();
}

class _PatientsPageState extends ConsumerState<PatientsPage> {
  final patientsController = PatientsController();
  bool loading = false;
  bool inputLoading = false;
  List<PatientModel> patients = [];
  int totalItems = 0;
  Timer? _debounce;
  bool _hasMore = true;
  int _pageNumber = 0;
  final int _size = 10;
  String search = '';
  String lastSearch = '';
  final scrollController = ScrollController();
  final textController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      getPatients('');
      scrollController.addListener(() {
        if (scrollController.position.maxScrollExtent ==
            scrollController.offset) {
          getPatients(search);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _debounce?.cancel();
    scrollController.dispose();
    textController.dispose();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        inputLoading = true;
        search = query;
        _pageNumber = 0;
      });
      getPatients(query);
    });
  }

  Future refresh() async {
    setState(() {
      loading = false;
      _hasMore = true;
      _pageNumber = 0;
      search = '';
      lastSearch = '';
      patients.clear();
    });
    textController.clear();

    getPatients('');
  }

  Future<void> getPatients(String? composed) async {
    try {
      if (!mounted || loading) return;
      setState(() {
        loading = true;
      });
      final hasUser = await ref.read(authProvider).getUserData();
      if (hasUser) {
        final accessToken = ref.read(authProvider).accessToken;
        dio.options.headers[HttpHeaders.authorizationHeader] =
            "bearer $accessToken";
      }
      final res =
          await patientsController.getPatients(_pageNumber, _size, composed);
      setState(() {
        if (search == lastSearch) {
          patients.addAll(res.content.items);
        } else {
          patients = res.content.items;
        }
        if (res.content.items.length < _size) {
          _hasMore = false;
        }
        totalItems = res.content.totalItems;
        inputLoading = false;
        _pageNumber++;
        lastSearch = search;
      });
    } catch (e) {
      if (e is DioError) {
        ErrorResponseModel response =
            ErrorResponseModel.fromJson(e.response?.data);

        GlobalSnackBar.show(
            context,
            response.message != ""
                ? response.message
                : "Ocorreu um erro ao recuperar os pacientes.");
      } else {
        GlobalSnackBar.show(
            context, "Ocorreu um erro ao recuperar os pacientes.");
      }
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        TextInputWidget(
            label: "Nome, CPF ou e-mail",
            loading: inputLoading,
            controller: textController,
            onChanged: (value) {
              _onSearchChanged(value);
            }),
        const SizedBox(
          height: 20,
        ),
        Expanded(
            child: RefreshIndicator(
          onRefresh: refresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: patients.length + 1,
            itemBuilder: (context, index) {
              if (index < patients.length) {
                final patient = patients[index];
                return PatientCardWidget(patient: patient);
              } else {
                return _hasMore
                    ? const Center(
                        child: SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: AppColors.primary,
                          ),
                        ),
                      )
                    : const Center();
              }
            },
          ),
        )),
      ]),
    );
  }
}
