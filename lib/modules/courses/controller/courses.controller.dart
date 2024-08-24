import 'dart:convert';
import 'dart:developer';

import 'package:demo_app/global/config/config.dart';
import 'package:demo_app/global/constants/api_url.constants.dart';
import 'package:demo_app/global/interceptor/network.interceptor.dart';
import 'package:demo_app/modules/courses/model/courses.model.dart';
import 'package:flutter/material.dart';

class CourserController with ChangeNotifier {
  List<Subject> _subjects = [];

  List<Subject> get subjects => _subjects;

  onInt() async {
    await getCourses();
  }

  getCourses() async {
    try {
      final response = await httpRequests(
        url: '$baseUrl${ApiUrls.mycourses}?auth_token=$authToken',
        httpType: HttpMethods.get,
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        _subjects = (jsonData['data']['subjects'] as List)
            .map((subjectJson) => Subject.fromJson(subjectJson))
            .toList();
        log("${response.statusCode}   123");
        log('Success: Courses fetched successfully!');
        log(_subjects.length.toString(), name: "number");
        notifyListeners();
      } else {
        log('Error: Failed to fetch courses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Errosfvkr: $e');
    }
  }
}
