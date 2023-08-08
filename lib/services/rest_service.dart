// ignore_for_file: unnecessary_null_comparison, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constant/color_constant.dart';
import '../utils/shared_preference.dart';
import '../widgets/app_logs.dart';

class RestConstants {
  /// Define all endpoints and base url(s) here
  /// DO NOT USE STATIC STRING ANYWHERE IN "rest_api" call.

  static const baseUrl = 'https://yojob.in/api';
  static const register = 'doRegister';
  static const login = 'doLogin';
  static const changePassword = 'changepassword';
  static const password = 'getPassword';
  static const getAllCandidate = 'getAllCandidate';
  static const getCandidateById = 'getCandidateById';
  static const getAllRecruiter = 'getAllRecruiter';
  static const getRecruiterById = 'getRecruiterById';
  static const getAboutUs = 'getAboutUs';
  static const changeEmail = 'changeEmail';
  static const changePhone = 'changePhone';
  static const updateCandidateProfile = 'updateCandidateProfile';
  static const updateCandidateOtherInfo = 'updateCandidateOtherInfo';
  static const country = 'getCountry';
  static const state = 'getState';
  static const city = 'getCity';
  static const uploadResume = 'uploadResume';
  static const getAllSkill = 'getAllSkill';
  static const getAllQualification = 'getAllQualification';
  static const getAllExperience = 'getAllExperience';
  static const getAllIndustries = 'getAllIndustries';
  static const getSkillByIndustries = 'getSkillByIndustries';
  static const postJobs = 'postJobs';
  static const postJobsUpdate = 'postJobsUpdate';
  static const getPostJobs = 'getPostJobs';
  static const removePostJob = 'removePostJobs';
  static const addTicket = 'addTicket';
  static const getTicket = 'getTicket';
  static const getAppliedJob = 'getAppliedJob';
  static const getAllJobs = 'getAllJobs';
  static const favouriteJobs = 'saveJob';
  static const applyJobs = 'applyJob';
  static const getAppliedJobs = 'getAppliedJob';
  static const removeApplyJobs = 'removeAppliedJob';
  static const updateRecruiterProfile = 'updateRecruiterProfile';
}

class RestServices {
  Map<String, String> headers = {'content-type': 'application/json'};

  void showRequestLogs(Uri url, {Map<String, String>? headers}) {
    logs('<----------------- Requested server data Logs ----------------->');
    logs('Requested url --> $url');
    logs('Header --> $headers');
    logs('<----------------- Requested server data Logs ----------------->');
  }

  void showResponseLogs({@required Response? response}) {
    logs('<----------------- Requested server data Logs ----------------->');
    logs('Response --> ${response!.statusCode} : ${response.request!.url}');
    logs('RHeader --> ${response.request!.headers}');
    logs('Response body --> ${response.body}');
    logs('<----------------- Requested server data Logs ----------------->');
  }

  dynamic getRestCall(BuildContext context,
      {@required String? endpoint}) async {
    String? responseData;
    try {
      String requestUrl = '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      showRequestLogs(requestedUri!);

      String? userToken = await getPrefStringValue(token);
      headers['Authorization'] = userToken!;
      Response response = await http.get(requestedUri, headers: headers);

      if (response != null) {
        showResponseLogs(response: response);
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          showMessage(
            context,
            message: '${response.statusCode} : Something went wrong.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          break;
        case 401:
          showMessage(
            context,
            message:
                '${response.statusCode} : Something went wrong with authorization.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in Get --> ${e.message}');
      showMessage(
        context,
        message: e.message,
        backgroundColor: ColorConstant.red,
        textColor: ColorConstant.themeScaffold,
      );
    }
    return responseData;
  }

  dynamic postRestCall(BuildContext context,
      {@required String? endpoint,
      @required Map<String, dynamic>? body,
      String? addOns}) async {
    logs('Body --> $body');
    String? responseData;
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint/$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      showRequestLogs(requestedUri!);
      Map<String, String> headers = {};
      String? userToken = await getPrefStringValue(token);
      if (userToken != null) {
        headers['Authorization'] = userToken;
      }
      Response response = await http.post(
        requestedUri,
        body: body,
        headers: headers,
      );

      if (response != null) {
        showResponseLogs(response: response);
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          showMessage(
            context,
            message: '${response.statusCode} : Something went wrong.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          break;
        case 401:
          showMessage(
            context,
            message:
                '${response.statusCode} : Something went wrong with authorization.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in Post --> ${e.message}');
      showMessage(
        context,
        message: e.message,
        backgroundColor: ColorConstant.red,
        textColor: ColorConstant.themeScaffold,
      );
    }
    return responseData;
  }

  dynamic multiPartRestCall(
    BuildContext context, {
    @required String? endpoint,
    @required Map<String, String>? body,
    @required String? keyName,
    @required String? fileName,
  }) async {
    String? responseData;
    try {
      String requestUrl = '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      showRequestLogs(requestedUri!);

      Map<String, String> headers = {
        'Content-Type': 'multipart/form-data',
      };

      String? userToken = await getPrefStringValue(token);
      headers['Authorization'] = userToken!;
      MultipartRequest request = http.MultipartRequest('POST', requestedUri);
      request.fields.addAll(body!);
      request.headers.addAll(headers);
      if (fileName!.isNotEmpty) {
        request.files
            .add(await http.MultipartFile.fromPath(keyName!, fileName));
      }
      StreamedResponse responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      if (response != null) {
        showResponseLogs(response: response);
      }

      logs('sc : ${response.statusCode}');
      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in Post --> ${e.message}');
      showMessage(
        context,
        message: e.message,
        backgroundColor: ColorConstant.red,
        textColor: ColorConstant.themeScaffold,
      );
    }
    return responseData;
  }

  dynamic deleteRestCall(BuildContext context,
      {@required String? endpoint,
      @required Map<String, dynamic>? body,
      String? addOns}) async {
    String? responseData;
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint/$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      showRequestLogs(requestedUri!);

      Response response =
          await http.delete(requestedUri, headers: headers, body: body);

      if (response != null) {
        showResponseLogs(response: response);
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          showMessage(
            context,
            message: '${response.statusCode} : Something went wrong.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          break;
        case 401:
          showMessage(
            context,
            message:
                '${response.statusCode} : Something went wrong with authorization.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in Delete --> ${e.message}');
      showMessage(
        context,
        message: e.message,
        backgroundColor: ColorConstant.red,
        textColor: ColorConstant.themeScaffold,
      );
    }
    return responseData;
  }

  dynamic patchRestCall(BuildContext context,
      {@required String? endpoint,
      @required Map<String, dynamic>? body,
      String? addOns}) async {
    String? responseData;
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.baseUrl}/$endpoint/$addOns'
          : '${RestConstants.baseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      showRequestLogs(requestedUri!);

      Response response =
          await http.patch(requestedUri, headers: headers, body: body);

      if (response != null) {
        showResponseLogs(response: response);
      }

      switch (response.statusCode) {
        case 200:
        case 201:
          responseData = response.body;
          break;
        case 500:
        case 400:
        case 404:
          logs('${response.statusCode}');
          showMessage(
            context,
            message: '${response.statusCode} : Something went wrong.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          break;
        case 401:
          showMessage(
            context,
            message:
                '${response.statusCode} : Something went wrong with authorization.',
            backgroundColor: ColorConstant.red,
            textColor: ColorConstant.themeScaffold,
          );
          logs('401 : ${response.body}');
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in patch --> ${e.message}');
      showMessage(
        context,
        message: e.message,
        backgroundColor: ColorConstant.red,
        textColor: ColorConstant.themeScaffold,
      );
    }
    return responseData;
  }
}
