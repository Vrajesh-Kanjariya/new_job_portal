import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/model/sign_in_response.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/services/rest_service.dart';
import 'package:new_job_portal/services/share_preference.dart';
import 'package:new_job_portal/utils/string_extensions.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/utils/validation_utils.dart';

class SignInController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isLoading = false;
  String emailError = '';
  String passwordError = '';

  void passwordHideShow() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  checkValidation() {
    if (ValidationUtils.validateEmptyController(emailController)) {
      emailError = 'Please enter email';
    } else if (!ValidationUtils.regexValidator(emailController, ValidationUtils.emailRegExp)) {
      emailError = 'Please enter valid email';
    } else {
      emailError = '';
    }
    if (ValidationUtils.validateEmptyController(passwordController)) {
      passwordError = 'Please enter password';
    } else {
      passwordError = '';
    }
    update();
    if (emailError.isEmpty && passwordError.isEmpty) {
      validateUserCredentialls();
    }
  }

  Future<void> validateUserCredentialls() async {
    try {
      showLoader(true);
      Map<String, dynamic> bodyMap = {
        'email': emailController.text,
        'password': passwordController.text,
        'tokenid': ''
      };
      final response = await RestServices.instance.postRestCall(endpoint: RestConstants.instance.login, body: bodyMap);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          var signInResponse = signInResponseFromJson(response);
          SharedPrefService.instance.setPrefBoolValue(SharedPrefService.instance.isAuthenticateUser, true);
          SharedPrefService.instance.setPrefStringValue(SharedPrefService.instance.authenticationToken, responseMap['token']);
          SharedPrefService.instance.setPrefStringValue(SharedPrefService.instance.userDataKey, jsonEncode(response));
          signInData = signInResponse;
          responseMap['message'].toString().showSuccess();
          emailController.clear();
          passwordController.clear();
          gotoDashboard();
        }
      }
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
