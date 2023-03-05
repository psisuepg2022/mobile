import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile/modules/appointments/appointments_page.dart';
import 'package:mobile/modules/home/home_controller.dart';
import 'package:mobile/modules/patients/patients_page.dart';
import 'package:mobile/modules/profile/profile_page.dart';
import 'package:mobile/providers/auth/auth_provider.dart';
import 'package:mobile/providers/home/home_provider.dart';
import 'package:mobile/shared/themes/app_colors.dart';
import 'package:mobile/shared/themes/app_text_styles.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final homeController = HomeController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bem-vindo, ${ref.read(authProvider).user?.name ?? ''}",
              style: TextStyles.welcome),
          flexibleSpace: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                AppColors.primary,
                AppColors.secondary
              ]))),
        ),
        body: [
          AppointmentsPage(key: UniqueKey()),
          PatientsPage(key: UniqueKey()),
          ProfilePage(key: UniqueKey())
        ][homeController.currentPage],
        bottomNavigationBar: Container(
            height: 60,
            decoration: const BoxDecoration(
                color: AppColors.backgrey,
                border: Border(
                    top: BorderSide(width: 1, color: AppColors.primary))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      if (ref.read(homeProvider).loading) return;
                      homeController.setPage(0);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.calendar_month,
                      color: homeController.currentPage == 0
                          ? AppColors.primary
                          : AppColors.text,
                    )),
                IconButton(
                    onPressed: () {
                      if (ref.read(homeProvider).loading) return;
                      homeController.setPage(1);
                      setState(() {});
                    },
                    icon: Icon(
                      Icons.people,
                      color: homeController.currentPage == 1
                          ? AppColors.primary
                          : AppColors.text,
                    )),
                IconButton(
                    onPressed: () {
                      if (ref.read(homeProvider).loading) return;
                      homeController.setPage(2);
                      setState(() {});
                    },
                    icon: Icon(Icons.person,
                        color: homeController.currentPage == 2
                            ? AppColors.primary
                            : AppColors.text)),
              ],
            )),
      ),
    );
  }
}
