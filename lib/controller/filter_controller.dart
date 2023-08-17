import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:new_job_portal/model/category_response.dart';
import 'package:new_job_portal/model/country_response.dart';
import 'package:new_job_portal/model/get_job_response.dart';
import 'package:new_job_portal/routes/app_navigation.dart';
import 'package:new_job_portal/services/rest_service.dart';
import 'package:new_job_portal/utils/string_extensions.dart';
import 'package:new_job_portal/utils/utils.dart';
import 'package:new_job_portal/utils/validation_utils.dart';

class FilterController extends GetxController {
  TextEditingController jobTypeController = TextEditingController();

  String jobTypeError = '';
  String jobFiledError = '';
  String countyError = '';
  String stateError = '';
  String cityError = '';


  List<String> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  List<String> categoryList = [];
  List<Record> allCountryList = [];
  List<Record> allStateList = [];
  List<Record> allCityList = [];
  List<CategoryRecord> allCategoryList = [];

  Record? selectedCountry;
  Record? selectedState;
  Record? selectedCity;
  CategoryRecord? selectedCategory;
  bool isLoading = false;

  GetJobResponse? getJobResponse;

  @override
  void onInit() {
    getCategory();
    getCountry();
    super.onInit();
  }

  void jobFiledChange(String? value) {
    selectedCategory = allCategoryList.firstWhere((element) => element.title == value);
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
            getState();
            // if (element.id == '101') {
            //   selectedCountry = element;
            //   getState();
            // }
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

  Future<void> getCategory() async {
    try {
      final response =
      await RestServices.instance.getRestCall(endpoint: RestConstants.instance.getCategory);
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('message') && responseMap['message'].toString().contains('found')) {
          CategoryResponse categoryResponse = categoryResponseFromJson(response);
          allCategoryList.clear();
          categoryList.clear();
          for (var element in categoryResponse.records!) {
            allCategoryList.add(element);
            categoryList.add(element.title ?? '');
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
    logs('selectedJobFiled --> $selectedCategory');
    /*if (categoryList.isEmpty || selectedCategory == null) {
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
    }*/
    update();
    if (jobTypeError.isEmpty && countyError.isEmpty && stateError.isEmpty && cityError.isEmpty) {
      getJobs();
    }
  }

  Future<void> getJobs() async {
    try {
      showLoader(true);
      final String? response = await RestServices.instance.postRestCall(
        endpoint: RestConstants.instance.getJobs,
        body: {
          'search': jobTypeController.text.trim().toString(),
          'category': selectedCategory != null ? selectedCategory!.title : '',
          'country': selectedCountry != null ? selectedCountry!.name : '',
          'state': selectedState != null ? selectedState!.name : '',
          'city': selectedCity != null ? selectedCity!.name : ''
        },
      );
      if (response != null && response.isNotEmpty) {
        Map<String, dynamic> responseMap = jsonDecode(response);
        if (responseMap.containsKey('status') && responseMap['status']) {
          getJobResponse = getJobResponseFromJson(response);

          if(getJobResponse!.jobs!.isNotEmpty) {
            'Filter apply'.showSuccess();
            // disposeValue();
            gotoFilterList(getJobResponse!.jobs!);
          } else {
            'No records found.'.showError();
          }
        }
      }
    } on SocketException catch (e) {
      logs('Catch exception in registerUser --> ${e.message}');
    }
    showLoader(false);
  }

  disposeValue() {
    jobTypeController.clear();
    allCityList.clear();
    allStateList.clear();
    allCityList.clear();
    selectedState = null;
    selectedCity = null;
    selectedCountry = null;
    selectedCategory = null;
    countryList.clear();
    stateList.clear();
    cityList.clear();
  }

  showLoader(bool value){
    isLoading = value;
    update();
  }

}
