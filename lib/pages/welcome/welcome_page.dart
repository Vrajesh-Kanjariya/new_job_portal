import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color_constant.dart';
import '../../constant/image_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/welcome_controller.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_image_assets.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_form_field.dart';
import '../../widgets/app_theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(),
      builder: (WelcomeController controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 0.0,
          ),
          body: SizedBox(
            width: Device.width,
            height: Device.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Container()),
                const Expanded(
                  child: Center(
                    child: AppImageAsset(
                      image: ImageConstant.loginTwo,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.px),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppText(
                          text: StringConstant.findJobs,
                          fontSize: 26.px,
                          fontWeight: FontWeight.w600,
                        ),
                        SizedBox(height: 20.px),
                        GestureDetector(
                          onTap: () => gotoSignUp(),
                          child: AppElevatedButton(
                            height: 50.px,
                            text: StringConstant.getStarted,
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

}
