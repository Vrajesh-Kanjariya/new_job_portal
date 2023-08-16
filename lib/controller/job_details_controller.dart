import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:get/get.dart';

import '../model/get_job_response.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class JobDetailsController extends GetxController {
  int selectedIndex = 0;
  bool isReadMore = false;
  bool isLoading = false;
  Job? job;
  List<Map<String, dynamic>> jobDetailsList = [
    {'title': 'Description'},
    // {'title': 'Map'},
    {'title': 'Company'},
    // {'title': 'Review'},
  ];

  @override
  Future<void> onInit() async {
    super.onInit();
    getArguments();
  }

  getArguments() async {
    job = Get.arguments['Job'];
    logs("job-- > ${job!.jobType}");
  }

  readMore() {
    isReadMore = !isReadMore;
    update();
  }

  selectJobDetails(int index) {
    selectedIndex = index;
    update();
  }

  Future<void> saveUnSaveJobs(String? jobId) async {
    logs("Job Id --> $jobId");
    try {
      showLoader(true);
      final String? response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.saveUnSaveJob,
        body: {
          'candidate_id': userdata!.candidateId,
          'job_id':jobId
        },
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
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
