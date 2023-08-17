import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/services/rest_service.dart';
import 'package:new_job_portal/utils/string_extensions.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/utils/validation_utils.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isNewPasswordVisible = true;
  bool isCPasswordVisible = true;
  bool isLoading = false;
  String emailError = '';
  String passwordError = '';
  String newPasswordError = '';
  String cPasswordError = '';

  void passwordHideShow() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  void newPasswordHideShow() {
    isNewPasswordVisible = !isNewPasswordVisible;
    update();
  }

  void cPasswordHideShow() {
    isCPasswordVisible = !isCPasswordVisible;
    update();
  }

  checkValidation() {
    if (ValidationUtils.validateEmptyController(oldPasswordController)) {
      passwordError = 'Please enter password';
    } else {
      passwordError = '';
    }
    if (ValidationUtils.validateEmptyController(newPasswordController)) {
      newPasswordError = 'Please enter new password';
    } else {
      newPasswordError = '';
    }
    if (ValidationUtils.validateEmptyController(cPasswordController)) {
      cPasswordError = 'Please enter confirm password';
    } else {
      cPasswordError = '';
    }
    if (cPasswordError.isEmpty &&
        newPasswordController.text.trim().toString() !=
            cPasswordController.text.trim().toString()) {
      cPasswordError = "Confirm password does not match";
    } else {
      cPasswordError = '';
    }
    update();
    if (passwordError.isEmpty && newPasswordError.isEmpty && cPasswordError.isEmpty) {
      validateUserCredentials();
    }
  }

  Future<void> validateUserCredentials() async {
    try {
      showLoader(true);
      Map<String, dynamic> bodyMap = {
        'candidate_id': signInData!.userdata!.candidateId,
        'current_password': oldPasswordController.text.trim().toString(),
        'newpassword': newPasswordController.text.trim().toString(),
      };
      final response = await RestServices.instance
          .postRestCall(endpoint: RestConstants.instance.changePassword, body: bodyMap);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          responseMap['message'].toString().showSuccess();
          oldPasswordController.clear();
          newPasswordController.clear();
          cPasswordController.clear();
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
