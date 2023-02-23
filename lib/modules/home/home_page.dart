import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ref.read(authProvider).user?.name ?? '',
              style: TextStyles.welcome),
          backgroundColor: AppColors.primary,
          actions: [
            TextButton(
                child: const Text("sair"),
                onPressed: () => ref.watch(authProvider).clearUser())
          ],
        ),
      ),
    );
  }
}
