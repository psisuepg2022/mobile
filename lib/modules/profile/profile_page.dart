import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/modules/profile/profile_controller.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/shared/models/Professional/professional_model.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';
import 'package:mobile/shared/widgets/label_button/label_button.dart';

import '../../service/index.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  final profileController = ProfileController();
  ProfessionalModel? professional;
  bool loading = true;

  Future<void> getProfile() async {
    try {
      final hasUser = await ref.read(authProvider).getUserData();

      if (hasUser) {
        final accessToken = ref.read(authProvider).accessToken;
        dio.options.headers[HttpHeaders.authorizationHeader] =
            "bearer $accessToken";
        final value = await profileController.getProfile();
        setState(() {
          professional = value.content;
        });
      }
    } catch (e) {
      print(e);
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  void handleSignOut() {
    if (!mounted) return;
    ref.read(authProvider).clearUser();
    Navigator.of(context).pushReplacementNamed("/splash");
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(60)),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 80,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          professional != null
              ? Center(
                  child:
                      Text(professional!.name, style: TextStyles.profileName))
              : const SizedBox(),
          const SizedBox(
            height: 30,
          ),
          professional != null
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Dados profissionais",
                          style: TextStyles.profileTitle,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Expanded(
                          child: Divider(
                            color: AppColors.primary,
                            thickness: 1,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Ocupação: ",
                          style: TextStyles.profileOcupationBold),
                      TextSpan(
                          text: professional!.profession,
                          style: TextStyles.profileOcupation)
                    ])),
                    Text.rich(TextSpan(children: [
                      TextSpan(
                          text: "Registro: ",
                          style: TextStyles.profileOcupationBold),
                      TextSpan(
                          text: professional!.registry,
                          style: TextStyles.profileOcupation)
                    ])),
                    professional != null && professional?.specialization != ""
                        ? Text.rich(TextSpan(children: [
                            TextSpan(
                                text: "Especialização: ",
                                style: TextStyles.profileOcupationBold),
                            TextSpan(
                                text: professional!.specialization,
                                style: TextStyles.profileOcupation)
                          ]))
                        : const SizedBox()
                  ],
                )
              : Column(),
          Expanded(child: Container()),
          LabelButtonWidget(
              label: "SAIR",
              reversed: true,
              style: TextStyles.primaryLabel,
              onPressed: handleSignOut),
        ],
      ),
    );
  }
}
