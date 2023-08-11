import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/pages/favourite/favourite_page.dart';
import 'package:new_job_portal/pages/filter/filter_page.dart';
import 'package:new_job_portal/pages/home/home_page.dart';
import 'package:new_job_portal/pages/profile/profile_page.dart';

class DashboardController extends GetxController {
  int selectedIndex = 0;
  List<Widget> pages = <Widget>[
    const HomePage(),
    const FilterPage(),
    const FavouritePage(),
    const ProfilePage(),
  ];

  void onItemTapped(int index) {
      selectedIndex = index;
      update();
  }
}