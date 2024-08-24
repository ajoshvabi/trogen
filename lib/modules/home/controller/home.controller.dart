import 'package:demo_app/global/interceptor/network.interceptor.dart';
import 'package:demo_app/modules/home/service/home.service.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class HomeController extends ChangeNotifier {
  HomeApiService service = HomeApiService();

  Future<Response> homeButtonClick() async {
    return await httpRequests(
        url: 'https://fakestoreapi.com/products', httpType: HttpMethods.get);
  }
}
