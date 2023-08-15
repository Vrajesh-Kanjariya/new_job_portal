import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:new_job_portal/model/get_job_response.dart';

import '../services/rest_service.dart';
import '../utils/utils.dart';

class HomeController extends GetxController{
  bool isLoading = false;
  GetJobResponse getJobResponse = GetJobResponse();

  Future<void> getJobs() async {
    try {
      showLoader(true);
      final String? response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.getJobs,
        body: {},
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          getJobResponse = getJobResponseFromJson(response);
          logs("Response ==> $responseMap");
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