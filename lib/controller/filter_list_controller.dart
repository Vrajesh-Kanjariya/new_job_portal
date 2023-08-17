import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:new_job_portal/model/save_job_list_response.dart';

import '../model/get_job_response.dart';
import '../services/rest_service.dart';
import '../utils/utils.dart';

class FilterListController extends GetxController{
  bool isLoading = false;
  List<Job>? job;


  @override
  void onInit() {
    getArguments();
  }

  getArguments() {
    job = Get.arguments['Job'];
  }

  showLoader(bool value){
    isLoading = value;
    update();
  }
}