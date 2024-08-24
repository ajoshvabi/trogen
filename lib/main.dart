import 'package:demo_app/global/providers/provider_lists.dart';
import 'package:demo_app/global/routes/routes.dart';
import 'package:demo_app/modules/home/view/home.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(const DemoApp());
}

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  State<DemoApp> createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providerList,
      child: ScreenUtilInit(
        builder: (context, child) {
          return MaterialApp(
            routes: routes,
            initialRoute: Home.route,
            title: "Demo App",
            navigatorKey: navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(), // Add this line
          );
        },
        designSize: const Size(390, 1094),
      ),
    );
  }
}
