import 'package:demo_app/global/constants/asset_constants.dart';
import 'package:demo_app/global/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Courses extends StatelessWidget {
  const Courses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(course1),
        Gap(12.w),
        Text(
          "KTET",
          style: TextStyle(
              fontWeight: FontWeight.w500, fontSize: 16, color: kBlack),
        ),
      ],
    );
  }
}