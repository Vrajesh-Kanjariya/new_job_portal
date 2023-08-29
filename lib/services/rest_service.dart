import 'dart:convert';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:new_job_portal/services/share_preference.dart';
import 'package:new_job_portal/utils/string_extensions.dart';

import '../../services/connectivity_service.dart';
import '../../utils/shared_preference.dart';
import '../../utils/utils.dart';

class RestConstants {
  RestConstants._privateConstructor();

  static final RestConstants instance = RestConstants._privateConstructor();

  //     ======================= Tokens & Others =======================     //
  String razorPayKey = '';

  //     ======================= Baseurl =======================     //
  String apiBaseUrl = 'https://nishantthummar.in/extra_web/job_portal_2023/api';

  //     ======================= API EndPoints =======================     //
  final String login = 'login';
  final String register = 'register';
  final String getJobs = 'getJobs';
  final String getCountry = 'getcountry';
  final String getState = 'getstate';
  final String getCity = 'getcity';
  final String getCategory = 'getcategory';
  final String saveUnSaveJob = 'saveJob';
  final String getSavedJobs = 'getSavedJobs';
  final String changePassword = 'change_password';
  final String deleteAccount = 'delete_account';
}

class RestServices {
  RestServices._privateConstructor();

  static final RestServices instance = RestServices._privateConstructor();

  Map<String, String> headers = {'Content-Type': 'application/json'};

  Future<Map<String, String>> getHeaders() async {
    String? token = await getPrefStringValue(SharedPrefService.instance.authenticationToken);
    return {
      // 'accessStatus': Global.getAccessStatus(),
      // 'Content-Type': 'application/json',
      // 'Accept': 'application/json',
      if (token != null) 'Authorization': token,
    };
  }

  void showRequestAndResponseLogs(http.Response? response, Map<String, Object> requestData) {
    logs('•••••••••• Network logs ••••••••••');
    logs('Request url --> ${response!.request!.url}');
    log('Request headers --> $requestData');
    logs('Status code --> ${response.statusCode}');
    logs('Response headers --> ${response.headers}');
    log('Response body --> ${response.body}');
    logs('••••••••••••••••••••••••••••••••••');
  }

  Future<String?>? getRestCall({required String? endpoint, String? addOns}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = addOns != null
          ? '${RestConstants.instance.apiBaseUrl}/$endpoint$addOns'
          : '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      Map<String, String> headers = await getHeaders();
      Response response = await http.get(requestedUri!, headers: headers);

      showRequestAndResponseLogs(response, headers);

      switch (response.statusCode) {
        case 200:
        case 201:
        case 400:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.containsKey('status') && responseMap['status'] == true) {
            responseData = response.body;
          } else {
            errorToast('${responseMap['msg']}');
            responseData = null;
          }
          break;
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          manageExpiredToken(response.body);
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in getRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? postRestCall({required String? endpoint, required Map<String, dynamic>? body}) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) return responseData;

    try {
      String requestUrl = '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      logs('Body map --> $body');
      Map<String, String> headers = await getHeaders();

      Response response = await http.post(requestedUri!, body: body, headers: headers);
      showRequestAndResponseLogs(response, headers);
      switch (response.statusCode) {
        case 200:
        case 201:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.isNotEmpty) {
            if (responseMap.containsKey('status') && responseMap['status'] == true) {
              responseData = response.body;
            } else {
              responseMap['message'].toString().showError();
            }
          }
          break;
        case 400:
        case 404:
        case 500:
        case 502:
          logs('${response.statusCode}${response.headers}');
          break;
        case 401:
          logs('401 : ${response.body}');
          manageExpiredToken(response.body);
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in postRestCall --> ${e.message}');
    }
    return responseData;
  }

  Future<String?>? multiPartRestCall({
    required String? endpoint,
    required Map<String, String>? body,
    required String keyName,
    required String fileName,
  }) async {
    String? responseData;
    bool connected = await ConnectivityService.instance.isConnectNetworkWithMessage();
    if (!connected) {
      return responseData;
    }
    try {
      String requestUrl = '${RestConstants.instance.apiBaseUrl}/$endpoint';
      Uri? requestedUri = Uri.tryParse(requestUrl);
      MultipartRequest request = http.MultipartRequest('POST', requestedUri!);
      Map<String, String> header = await getHeaders();
      header.remove('Content-Type');
      header['Content-Type'] = 'multipart/form-data';
      // request.headers.addAll({'Content-Type':'multipart/form-data'});
      request.headers.addAll(header);

      if (body!.isNotEmpty) {
        request.fields.addAll(body);
      }

      if (keyName.isNotEmpty && fileName.isNotEmpty) {
        request.files.add(await http.MultipartFile.fromPath(
          keyName,
          fileName,
          // contentType: MediaType.parse('image/jpeg'),
        ));
      }

      StreamedResponse responseStream = await request.send();
      final response = await http.Response.fromStream(responseStream);
      logs("response $response");

      showRequestAndResponseLogs(response, request.headers);
      logs("request.headers ${request.headers}");

      switch (response.statusCode) {
        case 200:
        case 201:
          Map<String, dynamic> responseMap = jsonDecode(response.body);
          if (responseMap.containsKey('status') && responseMap['status'] == true) {
            responseData = response.body;
          } else {
            errorToast('${responseMap['msg']}');
            responseData = null;
          }
          break;
        case 500:
        case 502:
        case 400:
        case 404:
          logs('${response.statusCode}');
          break;
        case 401:
          logs('401 : ${response.body}');
          manageExpiredToken(response.body);
          break;
        default:
          logs('${response.statusCode} : ${response.body}');
          break;
      }
    } on PlatformException catch (e) {
      logs('PlatformException in multiPartRestCall --> ${e.message}');
    }
    return responseData;
  }

  void manageExpiredToken(String body) {
    Map<String, dynamic> responseMap = jsonDecode(body);
    if (responseMap['message'].toString().toLowerCase().contains('token')) {}
  }
}
