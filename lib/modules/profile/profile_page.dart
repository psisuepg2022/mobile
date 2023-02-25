import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';
import 'package:mobile/shared/widgets/label_button/label_button.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  void handleSignOut() {
    if (!mounted) return;
    ref.read(authProvider).clearUser();
    Navigator.of(context).pushReplacementNamed("/splash");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("profile"),
        LabelButtonWidget(
            label: "SAIR",
            reversed: true,
            style: TextStyles.primaryLabel,
            onPressed: handleSignOut)
      ],
    );
  }
}
