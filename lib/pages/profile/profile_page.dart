import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/controller/profile_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: ProfileController(),
      builder: (ProfileController controller) {
        return Scaffold(
          body: Container(
            color: Colors.blue,
          ),
        );
      },
    );
  }
}
