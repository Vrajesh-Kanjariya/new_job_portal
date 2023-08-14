import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/controller/favourite_controller.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouriteController>(
      init: FavouriteController(),
      builder: (FavouriteController controller) {
        return Scaffold(
          body: Container(
            color: Colors.green,
          ),
        );
      },
    );
  }
}
