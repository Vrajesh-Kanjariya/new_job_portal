import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/model/country_response.dart';
import 'package:new_job_portal/services/rest_service.dart';
import 'package:new_job_portal/utils/string_extensions.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/utils/validation_utils.dart';

class FilterController extends GetxController {
  @override
  void onInit() {
    getCountry();
    super.onInit();
  }

  TextEditingController jobTypeController = TextEditingController();

  String jobTypeError = '';
  String jobFiledError = '';
  String countyError = '';
  String stateError = '';
  String cityError = '';

  List<String> jobFiled = ['other', 'IT & Networking'];
  List<String> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<Record> allCountryList = [];
  List<Record> allStateList = [];
  List<Record> allCityList = [];

  String? selectedJobFiled;
  Record? selectedCountry;
  Record? selectedState;
  Record? selectedCity;

  void jobFiledChange(String? value) {
    selectedJobFiled = value!;
    update();
  }

  void selectCountry(String? value) {
    selectedState = null;
    selectedCity = null;
    selectedCountry = allCountryList.firstWhere((element) => element.name == value);
    getState();
    update();
  }

  void selectState(String? value) {
    selectedCity = null;
    selectedState = allStateList.firstWhere((element) => element.name == value);
    getCity();
    update();
  }

  void selectCity(String? value) {
    selectedCity = allCityList.firstWhere((element) => element.name == value);
    update();
  }

  Future<void> getCountry() async {
    try {
      final response = await RestServices.instance.getRestCall(endpoint: RestConstants.instance.getCountry);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('message') && responseMap['message'].toString().contains('found')) {
          CountryResponse countryResponse = countryResponseFromJson(response);
          allCountryList.clear();
          countryList.clear();
          for (var element in countryResponse.records) {
            allCountryList.add(element);
            countryList.add(element.name ?? '');
            if (element.id == '101') {
              selectedCountry = element;
              getState();
            }
          }
        }
      }
    } on SocketException catch (e) {
      logs('Socket exception in getCountry --> ${e.message}');
    }
    update();
  }

  Future<void> getState() async {
    try {
      Map<String, dynamic> bodyMap = {'country': selectedCountry!.id};
      final response =
          await RestServices.instance.postRestCall(endpoint: RestConstants.instance.getState, body: bodyMap);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('message') && responseMap['message'].toString().contains('found')) {
          CountryResponse countryResponse = countryResponseFromJson(response);
          allStateList.clear();
          stateList.clear();
          for (var element in countryResponse.records) {
            allStateList.add(element);
            stateList.add(element.name ?? '');
          }
        }
      }
    } on SocketException catch (e) {
      logs('Socket exception in getState --> ${e.message}');
    }
    update();
  }

  Future<void> getCity() async {
    try {
      Map<String, dynamic> bodyMap = {'state': selectedState!.id};
      final response =
          await RestServices.instance.postRestCall(endpoint: RestConstants.instance.getCity, body: bodyMap);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('message') && responseMap['message'].toString().contains('found')) {
          CountryResponse countryResponse = countryResponseFromJson(response);
          allCityList.clear();
          cityList.clear();
          for (var element in countryResponse.records) {
            allCityList.add(element);
            cityList.add(element.name ?? '');
          }
        }
      }
    } on SocketException catch (e) {
      logs('Socket exception in getState --> ${e.message}');
    }
    update();
  }

  void applyFilter() {
    if (ValidationUtils.validateEmptyController(jobTypeController)) {
      jobTypeError = 'Please enter job type';
    } else {
      jobTypeError = '';
    }
    logs('selectedJobFiled --> $selectedJobFiled');
    if (selectedJobFiled == null) {
      jobFiledError = 'Please select job filled';
    } else {
      jobFiledError = '';
    }
    if (countryList.isEmpty || selectedCountry == null) {
      countyError = 'Please select country';
    } else {
      countyError = '';
    }
    if (stateList.isEmpty || selectedState == null) {
      stateError = 'Please select state';
    } else {
      stateError = '';
    }
    if (cityList.isEmpty || selectedCity == null) {
      cityError = 'Please select city';
    } else {
      cityError = '';
    }
    update();
    if (jobTypeError.isEmpty && countyError.isEmpty && stateError.isEmpty && cityError.isEmpty) {
      'Filter apply'.showSuccess();
      disposeValue();
    }
  }

  disposeValue() {
    jobTypeController.clear();
    allCityList.clear();
    allStateList.clear();
    allCityList.clear();
    selectedState = null;
    selectedCity = null;
    selectedCountry = null;
    selectedJobFiled = null;
    countryList.clear();
    stateList.clear();
    cityList.clear();
  }
}
