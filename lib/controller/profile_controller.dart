import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:new_job_portal/utils/string_extensions.dart';

import '../services/rest_service.dart';
import '../utils/utils.dart';

class ProfileController extends GetxController{
  bool isLoading = false;

  Future<void> deleteAccount() async {
    try {
      showLoader(true);
      final String? response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.deleteAccount,
        body: {
          'farmer_id': signInData!.userdata!.candidateId,
        },
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          responseMap['message'].toString().showSuccess();
          logs("Response save jobs ==> $responseMap");
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception in registerUser --> ${e.message}');
    }
    showLoader(false);
  }

  showLoader(bool value){
    isLoading = value;
    update();
  }
}