import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:demo_app/global/config/config.dart';
import 'package:demo_app/global/constants/asset_constants.dart';
import 'package:demo_app/global/styles/colors.dart';
import 'package:demo_app/modules/courses/view/courses.screen.dart';
import 'package:demo_app/modules/home/controller/home.controller.dart';
import 'package:demo_app/modules/home/widgets/courses.widget.dart';
import 'package:demo_app/modules/home/widgets/mainSections.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  static const route = '/';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  @override
  void dispose() {
    _selectedIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        items: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  _selectedIndex == 0
                      ? Icons.home_outlined
                      : Icons.home_outlined,
                  size: 30,
                  color: _selectedIndex == 0 ? kButton : Colors.grey),
              Text('Home',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 0 ? kButton : Colors.grey,
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  _selectedIndex == 1
                      ? Icons.book_outlined
                      : Icons.book_outlined,
                  size: 30,
                  color: _selectedIndex == 1 ? kButton : Colors.grey),
              Text('My Courses',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 1 ? kButton : Colors.grey,
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  _selectedIndex == 2
                      ? Icons.analytics_outlined
                      : Icons.analytics_outlined,
                  size: 30,
                  color: _selectedIndex == 2 ? kButton : Colors.grey),
              Text('Analytics',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 2 ? kButton : Colors.grey,
                  )),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                  _selectedIndex == 3
                      ? Icons.person_outline
                      : Icons.person_outline,
                  size: 30,
                  color: _selectedIndex == 3 ? kButton : Colors.grey),
              Text('Profile',
                  style: TextStyle(
                    fontSize: 12,
                    color: _selectedIndex == 3 ? kButton : Colors.grey,
                  )),
            ],
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
            if (index == 0) {
            } else if (index == 1) {
              _selectedIndex = 0;

              Navigator.pushNamed(context, MyCourses.route);
            } else if (index == 2) {
            } else if (index == 3) {}
          });
        },
      ),
      body: Consumer<HomeController>(builder: (context, homeCtrl, child) {
        return SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 21.w, vertical: 20.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30.h),
                      right: Radius.circular(30.h)),
                  gradient: LinearGradient(
                    colors: [kGradient1, kGradient2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                height: 239.h,
                width: size.width,
                child: SafeArea(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Hi Good  Morning",
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kWhite),
                              ),
                              Text(
                                "John",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: kWhite),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 49.w,
                                height: 25.h,
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: kWhite,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Text(
                                      "10",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 10,
                                          color: Colors.amber),
                                    ),
                                    Image.asset(
                                      coins,
                                    )
                                  ],
                                ),
                              ),
                              const Gap(10),
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: AssetImage(profile),
                              )
                            ],
                          )
                        ],
                      ),
                      Gap(30.h),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        height: 60.h,
                        width: size.width,
                        decoration: BoxDecoration(
                            color: kWhite,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Selectd Course",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 12,
                                      color: kGray),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 100,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  foregroundColor: kWhite,
                                  backgroundColor: kButton,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Change'),
                                    SizedBox(width: 2),
                                    Icon(Icons.add),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Gap(40.h),
              const Row(
                children: [
                  MainSections(
                    color1: Color.fromARGB(255, 217, 86, 86),
                    color2: Color.fromARGB(255, 149, 45, 45),
                    text: "Exam",
                  ),
                  MainSections(
                    color1: Color.fromARGB(255, 214, 231, 104),
                    color2: Color.fromARGB(255, 157, 184, 58),
                    text: "Practice",
                  ),
                  MainSections(
                    color1: Color.fromARGB(255, 85, 229, 131),
                    color2: Color.fromARGB(255, 58, 144, 46),
                    text: "Materials",
                  ),
                ],
              ),
              Gap(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Courses",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: kBlack),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                          color: kButton),
                    )
                  ],
                ),
              ),
              Gap(20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Courses(),
                        Courses(),
                        Courses(),
                      ],
                    ),
                    Gap(18.h),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Courses(),
                        Courses(),
                        Courses(),
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20.w),
                    height: 220.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
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
                            children: [
                              Gap(20.w),
                              Text(
                                'Practice With Previous Year\n Question Papers',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: kBlack),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                          Icons.arrow_forward,
                          size: 20,
                          color: kWhite,
                        ),
                        onPressed: () {},
                        style: ButtonStyle(
                          shape:
                              WidgetStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          backgroundColor:
                              WidgetStateProperty.all<Color>(kButton),
                        ),
                      ),
                    ),
                  ),
                  Positioned(top: 20, right: 20, child: Image.asset(person))
                ],
              ),
              Gap(40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Test Series",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 16,
                          color: kBlack),
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [kGradient3, kGradient4],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        height: 130.h,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Gap(1),
                            Text(
                              "Exam 102-Biology",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: kWhite),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "10 Questions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12,
                                      color: kWhite),
                                ),
                                Text(
                                  "120 min",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12,
                                      color: kWhite),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 27.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  foregroundColor: kButton,
                                  backgroundColor: kWhite,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Attempt Now'),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(1),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [kGradient5, kGradient6],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                            borderRadius: BorderRadius.circular(10.r)),
                        height: 130.h,
                        width: size.width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            const Gap(1),
                            Text(
                              "Exam 102-Biology",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: kWhite),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "10 Questions",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12,
                                      color: kWhite),
                                ),
                                Text(
                                  "120 min",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w200,
                                      fontSize: 12,
                                      color: kWhite),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 27.h,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  foregroundColor: kButton,
                                  backgroundColor: kWhite,
                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5)),
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text('Attempt Now'),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(1),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Gap(30)
            ],
          ),
        );
      }),
    );
  }
}
