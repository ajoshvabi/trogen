import 'package:demo_app/global/config/config.dart';
import 'package:demo_app/global/constants/asset_constants.dart';
import 'package:demo_app/global/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainSections extends StatelessWidget {
  final Color color1;
  final Color color2;
  final String text;
  const MainSections({
    required this.color1,
    required this.color2,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration:
          BoxDecoration(color: color1, borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.symmetric(horizontal: 25.h),
      height: 90.h,
      child: Column(
        children: [
          Expanded(child: Image.asset(coins)),
          Container(
            width: size.width,
            decoration: BoxDecoration(
                color: color2,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10))),
            child: Center(
              child: Text(
                text,
                style: TextStyle(color: kWhite),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
