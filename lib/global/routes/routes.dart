import 'package:demo_app/modules/class/view/class.screen.dart';
import 'package:demo_app/modules/courses/view/courses.screen.dart';
import 'package:demo_app/modules/home/view/home.screen.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  Home.route: (BuildContext context) => const Home(),
  MyCourses.route: (BuildContext context) => const MyCourses(),
  Class.route: (BuildContext context) => const Class(
        id: "",
      ),
};
