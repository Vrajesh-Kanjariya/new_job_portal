import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/color_constant.dart';
import '../constant/string_constant.dart';
import '../controller/splash_controller.dart';
import '../widgets/app_text.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        controller.timer();
        return Scaffold(
          body: Center(
            child: AppText(text: StringConstant.appTitle, fontColor: ColorConstant.primary, fontSize: 26.px),
          ),
        );
      },
    );
  }
}
