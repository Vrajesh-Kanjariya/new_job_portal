import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:new_job_portal/model/save_job_list_response.dart';

import '../services/rest_service.dart';
import '../utils/utils.dart';

class FavouriteController extends GetxController{
  bool isLoading = false;
  SaveJobListResponse? saveJobListResponse;

  Future<void> getSavedJobs() async {
    try {
      showLoader(true);
      final String? response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.getSavedJobs,
        body: {'candidate_id': signInData!.userdata!.candidateId},
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          saveJobListResponse = saveJobListResponseFromJson(response);
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