import 'package:demo_app/modules/class/controller/class.controller.dart';
import 'package:demo_app/modules/courses/controller/courses.controller.dart';
import 'package:demo_app/modules/home/controller/home.controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> providerList = [
  // ChangeNotifierProvider(create: (_) => DataLayerInterceptor()),
  ChangeNotifierProvider(create: (_) => HomeController()),
  ChangeNotifierProvider(create: (_) => CourserController()),
  ChangeNotifierProvider(create: (_) => ClassController()),
];
