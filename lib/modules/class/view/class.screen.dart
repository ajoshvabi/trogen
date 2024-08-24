import 'dart:developer';

import 'package:demo_app/global/config/config.dart';
import 'package:demo_app/global/constants/asset_constants.dart';
import 'package:demo_app/global/styles/colors.dart';
import 'package:demo_app/modules/class/controller/class.controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Class extends StatefulWidget {
  static const route = '/video';
  final String id;

  const Class({
    required this.id,
    super.key,
  });

  @override
  State<Class> createState() => _ClassState();
}

class _ClassState extends State<Class> {
  @override
  void initState() {
    log("hi courser");
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ctrl = Provider.of<ClassController>(context, listen: false);
      ctrl.onInt(widget.id);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child:
          Consumer<ClassController>(builder: (context, classCtrl, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: 260.h,
                    width: size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://s3-alpha-sig.figma.com/img/52ee/6b62/fc3bd284e526321591016a13bb8781d5?Expires=1725235200&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=CLj1BCmj4oMfKeuiC5bfLOz1uSHNIUosGbNBevVzcE5r62~1GRCegjXHhUUkxYp2K56Pcbec8ToMd3fDoBdxPVoUeX2xH5Yo6psylv4Hw2A7FAP75KrSq~zn8iH7Goeo93AhuC9-LqTg1FYyZNTCqhHxCaN0OMKc68BC7twatBDflVCn57nIn1NdGsOJaj4TKZyMGknN8FHERMm2N4BbqPHtkVQLt4VAcL6kyz8XtG~V7g3PwKiayNSvWNhHJBadbQxhIiNvXXjy5vJIGZySR9ccE0um7IDUZFMCesCj8KMpL~Lo93kp3c6MqyJQgg9q-~~TFSYb8Qb0TpjLaekWGg__'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        Icons.play_circle,
                        color: kWhite,
                        size: 70,
                      ),
                      onPressed: () {
                        // Play button pressed
                      },
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: SizedBox(
                      width: size.width,
                      child: Column(
                        children: [
                          LinearProgressIndicator(
                            value: 0.5, // Initial progress value (0.0 to 1.0)
                            backgroundColor: Colors.grey,
                            valueColor: AlwaysStoppedAnimation(kWhite),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                '8.12',
                                style: TextStyle(color: kWhite),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Subject Nmae',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: kBlack),
                    ),
                    Text(
                      'Part p00',
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: kGray),
                    ),
                    Text(
                      'Topic Coverd',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kBlack),
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Image.asset(white)),
                        Expanded(flex: 1, child: Image.asset(white1))
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Icon(Icons.copy),
                                Text(
                                  "Document",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: kBlack),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Icon(Icons.download),
                                Text(
                                  "Download",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: kBlack),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Icon(Icons.share_sharp),
                                Text(
                                  "Share",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: kBlack),
                                )
                              ],
                            )),
                        Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                const Icon(Icons.message),
                                Text(
                                  "Doubts",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      color: kBlack),
                                )
                              ],
                            )),
                      ],
                    ),
                    const Gap(10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: classCtrl.classData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 0.w, vertical: 5.h),
                          padding: EdgeInsets.all(5.w),
                          height: 107.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: kContainer,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => Class(
                              //           id: classCtrl.classData[index].data.videoList[0].videoUrl)),
                              // );
                            },
                            child: Row(
                              children: [
                                Container(
                                  height: 90.h,
                                  width: 86.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.r),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          classCtrl.classData[index].thumbnail),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Gap(5.w),
                                SizedBox(
                                  width: size.width * 0.5,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          classCtrl.classData[index].title,
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: kButton,
                                          ),
                                        ),
                                        Gap(5.w),
                                        // Text(
                                        //   classCtrl.classData[index].data
                                        //       .videoList[0].title,
                                        //   style: TextStyle(
                                        //     fontWeight: FontWeight.w600,
                                        //     fontSize: 14,
                                        //     color: kBlack,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      })),
    );
  }
}
