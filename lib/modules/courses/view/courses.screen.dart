import 'dart:developer';

import 'package:demo_app/global/config/config.dart';
import 'package:demo_app/global/constants/asset_constants.dart';
import 'package:demo_app/global/styles/colors.dart';
import 'package:demo_app/modules/class/view/class.screen.dart';
import 'package:demo_app/modules/courses/controller/courses.controller.dart';
import 'package:demo_app/modules/courses/widgets/day.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class MyCourses extends StatefulWidget {
  static const route = '/courses';

  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  @override
  void initState() {
    log("hi courser");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl = Provider.of<CourserController>(context, listen: false);
      ctrl.onInt();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CourserController>(builder: (context, coursesCtrl, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                width: size.width,
                height: 240.h,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 21.w, vertical: 20.h),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [kGradient1, kGradient2],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      height: 194.h,
                      width: size.width,
                      child: Column(
                        children: [
                          SafeArea(
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new,
                                    color: kWhite,
                                  ),
                                ),
                                Expanded(
                                    child: Center(
                                        child: Text(
                                  "Courser Name",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 18,
                                      color: kWhite),
                                )))
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: SizedBox(
                        width: size.width,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(7, (index) {
                              return Days(index: index + 1);
                            }),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(40.h),
              Image.asset(upgrade),
              const Gap(25),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.w),
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                width: size.width,
                height: 144.h,
                decoration: BoxDecoration(
                    color: kQuestion,
                    borderRadius: BorderRadius.circular(15.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Gap(15.w),
                    Text(
                      ' WhatsApp ലെ സഹായത്തിനായി',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: kBlack),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          ' 80957379373',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: kBlack),
                        ),
                        Image.asset(whatsapp)
                      ],
                    ),
                    Gap(1.w),
                  ],
                ),
              ),
              const Gap(10),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: coursesCtrl.subjects.length,
                  itemBuilder: (context, index) {
                    coursesCtrl.subjects;
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Class(id: coursesCtrl.subjects[index].id)),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        padding: EdgeInsets.all(5.w),
                        height: 107.h,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kContainer,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          children: [
                            Container(
                              height: 90.h,
                              width: 86.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                image: DecorationImage(
                                  image: NetworkImage(coursesCtrl
                                              .subjects[index].icon ==
                                          ""
                                      ? "https://trogon.info/tutorpro/edspark/uploads/thumbnails/section_thumbnails/a48411c8f2bb97d0862967425ef9eee0.jpg"
                                      : coursesCtrl.subjects[index].icon),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Gap(5.w),
                            Column(
                              children: [
                                Text(
                                  'Day 3 Lesson 1',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: kButton),
                                ),
                                Text(
                                  coursesCtrl.subjects[index].id,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 12,
                                      color: kButton),
                                ),
                                Gap(5.w),
                                Text(
                                  coursesCtrl.subjects[index].title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      color: kBlack),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ],
          ),
        );
      }),
    );
  }
}
