import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/services/rest_service.dart';
import 'package:new_job_portal/services/share_preference.dart';
import 'package:new_job_portal/utils/string_extensions.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/utils/validation_utils.dart';

class SignUpController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  String nameError = '';
  String emailError = '';
  String phoneError = '';
  String passwordError = '';
  String confirmPasswordError = '';
  bool isPasswordVisible = true;
  bool isCPasswordVisible = true;
  bool isLoading = false;

  void passwordHideShow() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void cPasswordHideShow() {
    isCPasswordVisible = !isCPasswordVisible;
    update();
  }

  Future<void> registerUser() async {
    try {
      isLoading = true;
      update();
      final Map<String, dynamic> bodyMap = {
        'name': nameController.text,
        'email': emailController.text,
        'phone': phoneController.text,
        'password': passwordController.text,
        'tokenid': '23324SDJKFH34SDFDSF453'
      };
      final String? response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.register,
        body: bodyMap,
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          SharedPrefService.instance.setPrefBoolValue(SharedPrefService.instance.isAuthenticateUser, true);
          SharedPrefService.instance.setPrefStringValue(SharedPrefService.instance.authenticationToken, responseMap['token']);
          responseMap['message'].toString().showSuccess();
          nameController.clear();
          emailController.clear();
          phoneController.clear();
          passwordController.clear();
          cPasswordController.clear();
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception in registerUser --> ${e.message}');
    }
    isLoading = false;
    update();
  }

  void validateRegisterUser() {
    if (ValidationUtils.validateEmptyController(nameController)) {
      nameError = 'Please enter name';
    } else if (!ValidationUtils.regexValidator(nameController, ValidationUtils.nameRegExp)) {
      nameError = 'Please enter valid name';
    } else {
      nameError = '';
    }
    if (ValidationUtils.validateEmptyController(emailController)) {
      emailError = 'Please enter email';
    } else if (!ValidationUtils.regexValidator(emailController, ValidationUtils.emailRegExp)) {
      emailError = 'Please enter valid email';
    } else {
      emailError = '';
    }
    if (ValidationUtils.validateEmptyController(phoneController)) {
      phoneError = 'Please enter phone number';
    } else if (ValidationUtils.lengthValidator(phoneController, 10)) {
      phoneError = 'Please enter valid phone number';
    } else {
      phoneError = '';
    }
    if (ValidationUtils.validateEmptyController(passwordController)) {
      passwordError = 'Please enter password';
    } else if (ValidationUtils.lengthValidator(passwordController, 8)) {
      passwordError = 'Please enter at-least 8 character';
    } else if (!ValidationUtils.regexValidator(passwordController, ValidationUtils.passwordRegexp)) {
      passwordError = 'Please enter alpha numeric character password';
    } else {
      passwordError = '';
    }
    if (ValidationUtils.validateEmptyController(passwordController)) {
      confirmPasswordError = 'Please enter confirm password';
    } else if (ValidationUtils.lengthValidator(passwordController, 8)) {
      confirmPasswordError = 'Please enter at-least 8 character confirm password';
    } else if (ValidationUtils.compareValidator(passwordController, cPasswordController)) {
      confirmPasswordError = 'Both password not matching';
    } else {
      confirmPasswordError = '';
    }
    update();
    if (nameError.isEmpty && emailError.isEmpty && phoneError.isEmpty && passwordError.isEmpty && confirmPasswordError.isEmpty) {
      registerUser();
    }
  }
}
