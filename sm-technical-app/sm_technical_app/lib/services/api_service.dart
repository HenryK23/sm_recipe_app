import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:sprintf/sprintf.dart';

import '../domain/models/api/api_response.dart';
import '../domain/models/utility/environment.dart';

class ApiService {
  bool _isSuccessStatusCode(int code) => (code >= 200 && code < 300);
  final String _baseUrl = Environment.apiUrl;

  Future<ApiResponse> postRequest(String contentJson, String endpoint,
      [Map<String, String>? headers, List<String>? routeParameters]) async {
    try {
      headers ??= getHeaders();
      if (routeParameters != null && routeParameters.isNotEmpty) {
        endpoint = sprintf(endpoint, routeParameters);
      }

      var response = await http
          .post(Uri.https(_baseUrl, endpoint),
              body: contentJson, headers: headers)
          .timeout(const Duration(seconds: 20));

      if (_isSuccessStatusCode(response.statusCode)) {
        var responseJson = json.decode(response.body);
        return ApiResponse(response.statusCode,
            content: responseJson["content"], message: '');
      } else {
        return ApiResponse(response.statusCode, message: response.body);
      }
    } on TimeoutException {
      return ApiResponse(408, message: "Call timed out");
    } on SocketException {
      return ApiResponse(0,
          message: "Socket Exception, check your connection to the internet");
    } catch (error) {
      return ApiResponse(0,
          message:
              "Something has gone wrong attempting to post data to the api");
    }
  }

  Future<ApiResponse> putRequest(String contentJson, String endpoint,
      [Map<String, String>? headers, List<String>? routeParameters]) async {
    try {
      headers ??= getHeaders();
      if (routeParameters != null && routeParameters.isNotEmpty) {
        endpoint = sprintf(endpoint, routeParameters);
      }

      var response = await http
          .put(Uri.https(_baseUrl, endpoint),
              body: contentJson, headers: headers)
          .timeout(const Duration(seconds: 20));

      if (_isSuccessStatusCode(response.statusCode)) {
        var responseJson = json.decode(response.body);
        return ApiResponse(response.statusCode,
            content: responseJson["content"], message: '');
      } else {
        return ApiResponse(response.statusCode, message: response.body);
      }
    } on TimeoutException {
      return ApiResponse(408, message: "Call timed out");
    } on SocketException {
      return ApiResponse(0,
          message: "Socket Exception, check your connection to the internet");
    } catch (error) {
      return ApiResponse(0,
          message:
              "Something has gone wrong attempting to put data to the api");
    }
  }

  Future<ApiResponse> getRequest(String endpoint,
      [Map<String, String>? headers,
      Map<String, String>? queryParameters,
      List<String>? routeParameters,
      String? overridenUrl]) async {
    try {
      headers ??= getHeaders();
      if (routeParameters != null && routeParameters.isNotEmpty) {
        endpoint = sprintf(endpoint, routeParameters);
      }
      http.Response response;
      if (overridenUrl != null) {
        response = await http.get(Uri.parse('https://$_baseUrl$overridenUrl'),
            headers: headers);
      } else {
        response = await http.get(
            Uri.https(_baseUrl, endpoint, queryParameters),
            headers: headers);
      }

      if (_isSuccessStatusCode(response.statusCode)) {
        var responseJson = json.decode(response.body);
        return ApiResponse(response.statusCode,
            content: responseJson, message: '');
      } else {
        return ApiResponse(response.statusCode, message: response.body);
      }
    } on SocketException {
      return ApiResponse(0,
          message: "Socket Exception, check your connection to the internet");
    } catch (error) {
      return ApiResponse(0,
          message:
              "Something has gone wrong attempting to get data from the api");
    }
  }

  Future<ApiResponse> patchRequest(String contentJson, String endpoint,
      [Map<String, String>? headers]) async {
    try {
      headers ??= getHeaders();

      var response = await http.patch(Uri.https(_baseUrl, endpoint),
          body: contentJson, headers: headers);

      if (_isSuccessStatusCode(response.statusCode)) {
        var responseJson = json.decode(response.body);
        return ApiResponse(response.statusCode,
            content: responseJson["content"], message: '');
      } else {
        return ApiResponse(response.statusCode, message: response.body);
      }
    } on SocketException {
      return ApiResponse(0,
          message: "Socket Exception, check your connection to the internet");
    } catch (error) {
      return ApiResponse(0,
          message:
              "Something has gone wrong attempting to patch data from the api");
    }
  }

  Future<ApiResponse> deleteRequest(String endpoint,
      [Map<String, String>? headers, List<String>? routeParameters]) async {
    try {
      headers ??= getHeaders();
      if (routeParameters != null && routeParameters.isNotEmpty) {
        endpoint = sprintf(endpoint, routeParameters);
      }
      var response =
          await http.delete(Uri.https(_baseUrl, endpoint), headers: headers);

      if (_isSuccessStatusCode(response.statusCode)) {
        var responseJson = json.decode(response.body);
        return ApiResponse(response.statusCode,
            content: responseJson["content"], message: '');
      } else {
        return ApiResponse(response.statusCode, message: response.body);
      }
    } on SocketException {
      return ApiResponse(0,
          message: "Socket Exception, check your connection to the internet");
    } catch (error) {
      return ApiResponse(0,
          message:
              "Something has gone wrong attempting to get data from the api");
    }
  }

  Map<String, String> getHeadersWithToken(String? token) {
    return {
      'Authorization': 'Bearer $token',
      'Content-type': 'application/json; charset=UTF-8'
    };
  }

  Map<String, String> getHeaders() {
    return {'Content-type': 'application/json; charset=UTF-8'};
  }
}
