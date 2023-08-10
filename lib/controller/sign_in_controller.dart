import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../model/sign_in_response.dart';
import '../constant/string_constant.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';
import '../utils/validation_utils.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  SignInResponse? signInResponse;
  bool isPasswordVisible = true;
  bool isLoading = false;
  String emailError = '', passwordError = '';

  void passwordHideShow() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  checkValidation() {
    if (emailController.text.isNotEmpty &&
        !ValidationUtils.regexValidator(emailController, ValidationUtils.emailRegExp)) {
      emailError = StringConstant.validEmail.tr;
    } else {
      emailError = '';
    }
    // if (passwordController.text.isNotEmpty &&
    //     !ValidationUtils.regexValidator(passwordController, ValidationUtils.passwordRegexp)) {
    //   passwordError = StringConstant.validEmail.tr;
    //   logs("hello 123");
    // } else {
    //   logs("hello");
    //   passwordError = '';
    // }
    if(emailError.isEmpty && passwordError.isEmpty){
      login();
    }
    update();
  }

  Future<void> login() async {
    try {
      showLoader(true);
      final response =
          await RestServices.instance.postRestCall(endpoint: RestConstants.instance.login, body: {
        "email": emailController.text.trim().toString(),
        "password": passwordController.text.trim().toString(),
      });
      if (response != null && response.isNotEmpty) {
        signInResponse = signInResponseFromJson(response);

        logs("Login response --> ${signInResponse!.userdata!.email}");

        successToast(signInResponse!.message.toString());
        // await setPrefBoolValue(isUserLoginKey, true);
        // await setPrefBoolValue(profileStatusKey, otpVerifyResponse!.info.isProfileStatus);
        // await setPrefBoolValue(addMemberStatusKey, otpVerifyResponse!.info.isAddMemeberStatus);
        // await setPrefBoolValue(userSelectedStatusKey, otpVerifyResponse!.info.isUserSelectedStatus);
        // await setPrefStringValue(memberIdKey, otpVerifyResponse!.info.memberId);
        // await setPrefStringValue(registerIdKey, otpVerifyResponse!.info.registerId);
        // await setPrefStringValue(accessTokenKey, otpVerifyResponse!.info.token);
      } else {}
    } on SocketException catch (e) {
      logs('Socket exception in userLogin --> ${e.message}');
    }
    showLoader(false);
  }

  showLoader(bool val) {
    isLoading = val;
    update();
  }
}
