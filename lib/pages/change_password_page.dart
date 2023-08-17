import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/controller/change_password_controller.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/widgets/app_loader.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/color_constant.dart';
import '../constant/string_constant.dart';
import '../widgets/app_app_bar.dart';
import '../widgets/app_elevated_button.dart';
import '../widgets/app_text.dart';
import '../widgets/app_text_form_field.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    logs('Current screen --> $runtimeType');
    return GetBuilder<ChangePasswordController>(
      init: ChangePasswordController(),
      builder: (ChangePasswordController controller) => Scaffold(
          body: Stack(
        children: [
          _changePasswordBody(context, controller),
          loader(controller.isLoading),
        ],
      )),
    );
  }

  _changePasswordBody(BuildContext context, ChangePasswordController controller) {
    return Stack(
      fit: StackFit.loose,
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ColorConstant.blue, ColorConstant.lightBlueWhite],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 8.px),
              SafeArea(
                child: AppAppBar(
                  appbarTitle: 'Change Password'.toUpperCase(),
                  titleFontSize: 14,
                  leftIconColor: Colors.white,
                  appBarColor: ColorConstant.transparent,
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.16,
                child: AppText(
                  text: StringConstant.appTitle,
                  fontColor: ColorConstant.appWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 30.px,
                ),
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.px),
                  height: MediaQuery.of(context).size.height * 0.012,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25.px), topRight: Radius.circular(25.px)),
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        ColorConstant.lightPurple,
                        ColorConstant.lightPurple,
                      ],
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.688,
                  decoration: BoxDecoration(
                    color: ColorConstant.appWhite,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20.px), topRight: Radius.circular(20.px)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 40.px),
                      Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: StringConstant.newCredential,
                          fontSize: 26.px,
                          fontWeight: FontWeight.w600,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.px),
                      Align(
                        alignment: Alignment.center,
                        child: AppText(
                          text: StringConstant.passString,
                          fontSize: 14.px,
                          fontColor: ColorConstant.textGrey,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height: 8.px),
                      Padding(
                        padding: EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px),
                        child: AppTextFormField(
                          textAlign: TextAlign.start,
                          controller: controller.oldPasswordController,
                          hint: StringConstant.enterOldPassword,
                          fontSize: 15.px,
                          fillColor: ColorConstant.appWhite,
                          borderColor: ColorConstant.appgrey,
                          borderWidth: 2.px,
                          autoFocus: false,
                          isObscureText: controller.isPasswordVisible,
                          hintFontSize: 14.px,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.px),
                            child: GestureDetector(
                              onTap: () => controller.passwordHideShow(),
                              child: Icon(
                                controller.isPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 25.px,
                                color: ColorConstant.appgrey,
                              ),
                            ),
                          ),
                          fontColor: ColorConstant.appBlack,
                          inputFormatters: [LengthLimitingTextInputFormatter(15)],
                          keyboardType: TextInputType.text,
                          errorText: controller.passwordError,
                        ),
                      ),
                      SizedBox(height: 16.px),
                      Padding(
                        padding: EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px),
                        child: AppTextFormField(
                          textAlign: TextAlign.start,
                          controller: controller.newPasswordController,
                          hint: StringConstant.enterNewPassword,
                          fontSize: 15.px,
                          fillColor: ColorConstant.appWhite,
                          borderColor: ColorConstant.appgrey,
                          borderWidth: 2.px,
                          autoFocus: false,
                          isObscureText: controller.isPasswordVisible,
                          hintFontSize: 14.px,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.px),
                            child: GestureDetector(
                              onTap: () => controller.newPasswordHideShow(),
                              child: Icon(
                                controller.isNewPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 25.px,
                                color: ColorConstant.appgrey,
                              ),
                            ),
                          ),
                          fontColor: ColorConstant.appBlack,
                          inputFormatters: [LengthLimitingTextInputFormatter(15)],
                          keyboardType: TextInputType.text,
                          errorText: controller.newPasswordError,
                        ),
                      ),
                      SizedBox(height: 16.px),
                      Padding(
                        padding: EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px),
                        child: AppTextFormField(
                          textAlign: TextAlign.start,
                          controller: controller.cPasswordController,
                          hint: StringConstant.enterCPassword,
                          fontSize: 15.px,
                          fillColor: ColorConstant.appWhite,
                          borderColor: ColorConstant.appgrey,
                          borderWidth: 2.px,
                          autoFocus: false,
                          isObscureText: controller.isPasswordVisible,
                          hintFontSize: 14.px,
                          suffixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16.px),
                            child: GestureDetector(
                              onTap: () => controller.cPasswordHideShow(),
                              child: Icon(
                                controller.isCPasswordVisible
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 25.px,
                                color: ColorConstant.appgrey,
                              ),
                            ),
                          ),
                          fontColor: ColorConstant.appBlack,
                          inputFormatters: [LengthLimitingTextInputFormatter(15)],
                          keyboardType: TextInputType.text,
                          errorText: controller.cPasswordError,
                        ),
                      ),
                      SizedBox(height: 36.px),
                      InkWell(
                        onTap: () => controller.checkValidation(),
                        child: AppElevatedButton(
                          height: 50.px,
                          text: StringConstant.update,
                          margin: 20.px,
                        ),
                      ),
                      SizedBox(height: 20.px),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget loader(bool isLoading) => isLoading ? const AppLoader() : const SizedBox();
}
