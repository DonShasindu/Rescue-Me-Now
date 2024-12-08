import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/avalible_pet_screen.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/donar_profile_screen.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/doner_home_page_screen.dart';

import '../../../../core/util/assets.dart';
import '../../../root/bloc/auth_bloc/auth_bloc.dart';

class DonerHomeScreen extends StatelessWidget {
  const DonerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25.h),
              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello ${context.read<AuthBloc>().state.username}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Colombo',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 180.h,
                            width: 140.w,
                            child: Column(
                              children: [
                                Icon(
                                  Icons.home,
                                  size: 130.sp,
                                  color: Colors.black,
                                ),
                                Text(
                                  'Home',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DonerHomePageScreen(),
                              ),
                            );
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 180.h,
                            width: 140.w,
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.adoption,
                                  width: 150.w,
                                  height: 140.h,
                                ),
                                Text(
                                  'Adoption',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AvailablePetScreen(
                                  donation: false,
                                  adoption: true,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            height: 180.h,
                            width: 140.w,
                            child: Column(
                              children: [
                                Image.asset(
                                  Assets.profile,
                                  width: 100.w,
                                  height: 130.h,
                                ),
                                Text(
                                  'Profile',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DonarProfileScreen(),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: 180.h,
                          width: 140.w,
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
