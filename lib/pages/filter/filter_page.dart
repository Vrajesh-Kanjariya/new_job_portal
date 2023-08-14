import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/controller/filter_controller.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
      init: FilterController(),
      builder: (FilterController controller) {
        return Scaffold(
          body: Container(
            color: Colors.red,
          ),
        );
      },
    );
  }
}
