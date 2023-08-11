import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/controller/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (HomeController controller) {
      return Scaffold(
        body: Container(
          color: Colors.red,
        ),
      );
    },);
  }
}
