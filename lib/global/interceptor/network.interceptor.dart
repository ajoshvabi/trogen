import 'dart:convert';
import 'dart:developer';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

//!---------------------------------------------------------------- ( New API call methods )

enum HttpMethods { post, get, delete, patch, multipart, put }

final Connectivity _connectivity =
    Connectivity(); //?--------------- (network connectivity)

Future<Response> httpApiCall({
  required HttpMethods tHttp,
  Object? body,
  Map<String, String>? headers,
  required Uri url,
}) async {
  var connectionResult = await _connectivity.checkConnectivity();
  if (connectionResult.contains(ConnectivityResult.mobile) ||
      connectionResult.contains(ConnectivityResult.wifi)) {
    try {
      switch (tHttp) {
        case HttpMethods.post:
          return await https.post(url, body: body, headers: headers);
        case HttpMethods.get:
          return await https.get(url, headers: headers);
        case HttpMethods.delete:
          return await https.delete(url, headers: headers);
        case HttpMethods.patch:
          return await https.patch(url, body: body, headers: headers);
        case HttpMethods.put:
          return await https.put(url, body: body, headers: headers);
        default:
          return await https.post(url, body: body, headers: headers);
      }
    } on FormatException catch (e) {
      log(e.toString(), name: "FormatException");
      return Response('{"code":"120001"}', 120);
    } on PlatformException catch (e) {
      log(e.toString(), name: "PlatformException");
      return Response('{"code":"140001"}', 140);
    } catch (e) {
      log(e.toString(), name: "API Error");
      return Response('{"code":"150001"}', 150);
    }
  } else {
    Fluttertoast.showToast(msg: 'please check network');
    return Response('', 303);
  }
}

Future<Response> httpRequests(
    {required String url,
    required HttpMethods httpType,
    Object? body,
    Map<String, String>? headers,
    int timeout = 30,
    bool setAppLoading = true}) async {
  log("---------------------------------------------------------------- ( API request data logs)\n");
  log("${headers.toString()} ", name: "TOKEN");
  log(url, name: "API URL");
  log(body.toString(), name: "Request body");
  log("---------------------------------------------------------------- ( API request data logs)");

  final response = await httpApiCall(
    tHttp: httpType,
    url: Uri.parse(url),
    body: body,
    headers: headers,
  ).timeout(Duration(seconds: timeout), onTimeout: () {
    return Response('{"code":"408000"}', 408);
  });

  if (response.statusCode.toString()[0] == "5") {
    //Todo:-------------------------------------------- ( Internal server error handling )
    apiLogs("5", response);
    return response;
  } else if (response.statusCode.toString()[0] == "4") {
    //Todo:-------------------------------------------- ( UnAuthorized user handling )
    apiLogs("4", response);
    return response;
  } else {
    //Todo:-------------------------------------------- ( Other responses )
    log("---------------------------------------------------------------- ( API Response data logs )\n");
    log(response.body.toString(), name: "API Response body--->");
    log(response.statusCode.toString(), name: "API Response status code");
    log("---------------------------------------------------------------- ( API Response data logs )");
    return response;
  }
}

//? ---------------------------------------------------------------- ( API resource logs )
apiLogs(String errorCode, Response response) {
  try {
    log("------------------------------------------- ( $errorCode )");
    log(response.statusCode.toString(), name: "API status code");
    String statusCode = json.decode(response.body)["message"].toString();
    log(statusCode, name: "API status code");
    log(json.decode(response.body).toString(), name: "Error body");
    log("------------------------------------------- ( $errorCode )");
  } catch (e) {
    log(e.toString());
  }
}
