import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/constant/color_constant.dart';
import 'package:new_job_portal/constant/string_constant.dart';
import 'package:new_job_portal/controller/dashboard_controller.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      init: DashboardController(),
      builder: (DashboardController controller) {
        return Scaffold(
          body: Container(
            child: controller.pages.elementAt(controller.selectedIndex),
          ),
          bottomNavigationBar: _bottomNavigationBar(controller),
        );
    },);
  }

  _bottomNavigationBar(DashboardController controller) {
    return BottomNavigationBar(
      currentIndex: controller.selectedIndex,
      onTap: (value) => controller.onItemTapped(value),
      unselectedIconTheme: const IconThemeData(color: Colors.grey),
      unselectedItemColor: Colors.grey,
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showUnselectedLabels: true,
      selectedIconTheme: const IconThemeData(color: ColorConstant.blue),
      selectedItemColor: ColorConstant.blue,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: StringConstant.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.filter_alt_outlined),
          label: StringConstant.filter,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: StringConstant.favourite,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_2_outlined),
          label: StringConstant.profile,
        ),
      ],
    );
  }
}
