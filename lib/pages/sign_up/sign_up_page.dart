import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constant/color_constant.dart';
import '../../constant/image_constant.dart';
import '../../constant/string_constant.dart';
import '../../controller/sign_up_controller.dart';
import '../../routes/app_navigation.dart';
import '../../widgets/app_elevated_button.dart';
import '../../widgets/app_image_assets.dart';
import '../../widgets/app_text.dart';
import '../../widgets/app_text_form_field.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpController>(
      init: SignUpController(),
      builder: (SignUpController controller) {
        return Scaffold(
          body: _signUpBody(context, controller),
        );
      },
    );
  }

  _signUpBody(BuildContext context, SignUpController controller) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                ColorConstant.blue,
                ColorConstant.lightBlueWhite,
              ],
            ),
          ),
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 16.px),
                  padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 10.px),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => gotoWelcome(),
                        child: Padding(
                          padding: EdgeInsets.all(8.px),
                          child: AppImageAsset(
                              image: ImageConstant.backIcon,
                              height: 20.px,
                              width: 20.px,
                              color: ColorConstant.white),
                        ),
                      ),
                      const Spacer(),
                      AppText(
                        text: StringConstant.alreadyAccount,
                        fontColor: ColorConstant.white,
                        fontSize: 12.px,
                        fontWeight: FontWeight.w300,
                      ),
                      SizedBox(
                        width: 10.px,
                      ),
                      GestureDetector(
                        onTap: () => gotoSignIn(),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 8.px),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.px),
                            color: ColorConstant.lightBlue,
                          ),
                          child: AppText(
                            text: StringConstant.signIn,
                            fontColor: ColorConstant.white,
                            fontSize: 12.px,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10.px,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * 0.16,
                child: AppText(
                  text: StringConstant.appTitle,
                  fontColor: ColorConstant.white,
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.px),
                  height: MediaQuery.of(context).size.height * 0.012,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        ColorConstant.lightBlue,
                        ColorConstant.lightBlue,
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.px),
                      topRight: Radius.circular(25.px),
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.688,
                  decoration: BoxDecoration(
                    color: ColorConstant.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.px),
                      topRight: Radius.circular(20.px),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.688,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 40.px,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AppText(
                            text: StringConstant.getStartedFree,
                            fontSize: 26.px,
                            fontWeight: FontWeight.w600,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 8.px,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: AppText(
                            text: StringConstant.enterBelowDetails,
                            fontSize: 14.px,
                            fontColor: ColorConstant.textGrey,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          height: 8.px,
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px, bottom: 16.px),
                          child: AppTextFormField(
                            textAlign: TextAlign.start,
                            controller: controller.nameController,
                            hint: StringConstant.enterName,
                            fontSize: 15.px,
                            fillColor: ColorConstant.white,
                            borderColor: ColorConstant.grey,
                            borderWidth: 2.px,
                            autoFocus: false,
                            hintFontSize: 14.px,
                            fontColor: ColorConstant.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                            ],
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px, bottom: 16.px),
                          child: AppTextFormField(
                            textAlign: TextAlign.start,
                            controller: controller.emailController,
                            hint: StringConstant.enterEmail,
                            fontSize: 15.px,
                            fillColor: ColorConstant.white,
                            borderColor: ColorConstant.grey,
                            borderWidth: 2.px,
                            autoFocus: false,
                            hintFontSize: 14.px,
                            fontColor: ColorConstant.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                            ],
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px, bottom: 16.px),
                          child: AppTextFormField(
                            textAlign: TextAlign.start,
                            controller: controller.passwordController,
                            hint: StringConstant.enterPassword,
                            fontSize: 15.px,
                            fillColor: ColorConstant.white,
                            borderColor: ColorConstant.grey,
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
                                  color: ColorConstant.grey,
                                ),
                              ),
                            ),
                            fontColor: ColorConstant.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                            ],
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Padding(
                          padding:
                          EdgeInsets.only(top: 6.px, left: 20.px, right: 20.px, bottom: 16.px),
                          child: AppTextFormField(
                            textAlign: TextAlign.start,
                            controller: controller.cPasswordController,
                            hint: StringConstant.enterCPassword,
                            fontSize: 15.px,
                            fillColor: ColorConstant.white,
                            borderColor: ColorConstant.grey,
                            borderWidth: 2.px,
                            autoFocus: false,
                            isObscureText: controller.isCPasswordVisible,
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
                                  color: ColorConstant.grey,
                                ),
                              ),
                            ),
                            fontColor: ColorConstant.black,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(15),
                              FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
                            ],
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(
                          height: 20.px,
                        ),
                        GestureDetector(
                          onTap: () => gotoSignUp(),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.px),
                            child: AppElevatedButton(
                              height: 50.px,
                              text: StringConstant.signUp,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.px,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}