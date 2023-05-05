import 'dart:convert';
import 'dart:io';

import 'package:bloc_mvvm_poc_app/services/app_exception.dart';
import 'package:http/http.dart' as http;

import 'base_api_service.dart';

/// Created by Sachin kumar on 20-Jan-2023
/// For CropData Technology Pvt. Ltd.
class NetworkApiServices extends BaseApiServices {
  //This method is used for get request of API
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      //final response = await http.get(Uri.parse(url));
      var response = await http.get(
        Uri.parse(url),
        headers: headers,
        // use jsonEncode()
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  //This method is used for post request of API
  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      var headers = {
        'Content-Type': 'application/json',
        //'authorization':'Basic c3R1ZHlkb3RlOnN0dWR5ZG90ZTEyMw=='
      };

      var response = await http.post(
        Uri.parse(url),
        headers: headers,
        body: jsonEncode(data), // use jsonEncode()
      );

      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

// This method is used to manage received response
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 415:
        throw UnSupportedMediaException(response.body.toString());
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException('Error occured while communication with server'
            ' with status code : ${response.statusCode}');
    }
  }
}
