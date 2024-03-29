import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/modules/splash/splash_controller.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/service/index.dart';
import 'package:mobile/shared/models/Clinic/clinic_list.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  final splashController = SplashController();
  ClinicListModel clinics = ClinicListModel(items: [], totalItems: 0);
  bool loading = true;

  Future<void> getClinics() async {
    try {
      final hasUser = await ref.read(authProvider).getUserData();

      if (hasUser) {
        final accessToken = ref.read(authProvider).accessToken;
        dio.options.headers[HttpHeaders.authorizationHeader] =
            "bearer $accessToken";
        Navigator.of(context).pushReplacementNamed("/home");
        return;
      }

      final value = await splashController.fetchClinics();
      setState(() {
        clinics = value.content;
      });
      Navigator.of(context)
          .pushReplacementNamed("/login", arguments: value.content);
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getClinics();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[AppColors.secondary, AppColors.primary])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/PSIS-Logo-Transparente.png',
                height: 100,
              ),
              Center(child: Text('PSIS', style: TextStyles.titleBig)),
              const CircularProgressIndicator(
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
