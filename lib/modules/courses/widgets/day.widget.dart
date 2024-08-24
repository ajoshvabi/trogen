
import 'package:demo_app/global/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class Days extends StatelessWidget {
  final int index;
  const Days({
    required this.index,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10.w),
      height: 100.h,
      width: 62.w,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(30), color: kDayBg),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Gap(2),
          Text(
            "Day",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: kButton),
          ),
          Text(
            index.toString(),
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: kButton),
          ),
          Text(
            "02/04",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: kButton),
          ),
          const Gap(2),
        ],
      ),
    );
  }
}
