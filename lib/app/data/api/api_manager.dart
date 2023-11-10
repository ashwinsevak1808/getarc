import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:getarc/app/data/modal/error_modal.dart';
import 'package:http/http.dart' as http;

import '../../utils/widgets_constants.dart';
import 'api_execption.dart';

const String jsonContentType = 'application/json';

class ApiManager {
  // Define Base URL If Any
  static const String baseUrl = 'https://dummyjson.com/';

  Future<dynamic> get(String url, {bool isLoaderShow = true}) async {
    try {
      if (isLoaderShow) {
        EasyLoading.show(maskType: EasyLoadingMaskType.black);

        Map<String, String> header = {
          // "Authorization": "Token token_value",
          'Content-Type': 'application/json',
        };

        Get.printInfo(info: 'Header - ${header.toString()}');
        Get.printInfo(info: 'GET_URL_CALLED - ${baseUrl + url}');

        final response = await http.get(Uri.parse(baseUrl + url), headers: header);

        var responseJson = _returnResponse(response);
        return responseJson;
      }
    } on SocketException catch (e) {
      throw FetchDataException('No Internet connection ${e.message}');
    } finally {
      if (isLoaderShow) EasyLoading.dismiss();
    }
  }

  dynamic _returnResponse(http.Response response, {bool isShow = true}) {
    EasyLoading.dismiss();
    if (kDebugMode) print(response.statusCode);

    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        if (responseJson is! List && responseJson['response'] == "Error") {
          WidgetConstants.errorSnackBar(
            content: responseJson['error_message'],
          );
          throw BadRequestException(responseJson['error_message']);
        }
        return responseJson;

      case 400:
        if (isShow) {
          WidgetConstants.errorSnackBar(
            content: ErrorModel.fromJson(json.decode(response.body.toString())).message!,
          );
        }
        throw BadRequestException(
          ErrorModel.fromJson(json.decode(response.body.toString())).message!,
        );

      case 401:
        if (isShow) {
          WidgetConstants.errorSnackBar(content: ErrorModel.fromJson(json.decode(response.body.toString())).message!);
        }
        throw BadRequestException(
          ErrorModel.fromJson(json.decode(response.body.toString())).message!,
        );

      case 403:
        throw UnauthorisedException(
          ErrorModel.fromJson(json.decode(response.body.toString())).message!,
        );

      case 500:
      default:
        throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}',
        );
    }
  }
}
