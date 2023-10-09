
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:test_endpoint/data/base_service.dart';

import 'app_exception.dart';

class AlbumService implements BaseService{

  final String _baseUrl = "https://fetch-hiring.s3.amazonaws.com/hiring.json";

  @override
  Future getResponse() async {
    dynamic responseJson;

    try {
      final response = await http.get(Uri.parse(_baseUrl));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException("No Internet Connection");
    }
    return responseJson;
  }

  @visibleForTesting
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server' +
                ' with status code : ${response.statusCode}');
    }
  }

}