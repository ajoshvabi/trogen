import 'dart:convert';
import 'dart:developer';

import 'package:demo_app/global/config/config.dart';
import 'package:demo_app/global/constants/api_url.constants.dart';
import 'package:demo_app/global/interceptor/network.interceptor.dart';
import 'package:demo_app/modules/class/model/video.model.dart';
import 'package:flutter/material.dart';

class ClassController extends ChangeNotifier {
  List<Video> _class = [];

  List<Video> get classData => _class;

  onInt(String id) async {
    await getClass(id);
  }

  Future<void> getClass(String id) async {
    try {
      final response = await httpRequests(
        url: '$baseUrl${ApiUrls.video}?lesson_id=$id&auth_token=$authToken',
        httpType: HttpMethods.get,
      );

      if (response.statusCode == 200) {
        final jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null &&
            jsonData['data']['video_list'] != null) {
          _class = (jsonData['data']['video_list'] as List)
              .map((videoJson) => Video.fromJson(videoJson))
              .toList();
          log('Success: Courses fetched successfully!');
          log('Number of courses: ${_class.length}');
          notifyListeners();
        } else {
          log('Error: video_list is null or empty');
        }
      } else {
        log('Error: Failed to fetch courses. Status code: ${response.statusCode}');
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
// import 'dart:convert';
// import 'dart:developer';

// import 'package:demo_app/global/config/config.dart';
// import 'package:demo_app/global/constants/api_url.constants.dart';
// import 'package:demo_app/global/interceptor/network.interceptor.dart';
// import 'package:demo_app/modules/class/model/class.model.dart';
// import 'package:flutter/material.dart';

// class ClassController with ChangeNotifier {
//   List<Data> _class = [];

//   List<Data> get classData => _class;

//   onInt(String id) async {
//     await getClass(id);
//   }

//   getClass(String id) async {
//     try {
//       final response = await httpRequests(
//         url:
//             '$baseUrl${ApiUrls.level}?course_id=$id&section_id=&auth_token=$authToken',
//         httpType: HttpMethods.get,
//       );

//       if (response.statusCode == 200) {
//         final jsonData = jsonDecode(response.body);
//         _class = (jsonData['data'] as List)
//             .map((subjectJson) => Data.fromJson(subjectJson))
//             .toList();
//         log("${response.statusCode}   123");
//         log('Success: Courses fetched successfully!');
//         log(_class.length.toString(), name: "number");
//         notifyListeners();
//       } else {
//         log('Error: Failed to fetch courses. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       log('Errosfvkr: $e');
//     }
//   }
// }
