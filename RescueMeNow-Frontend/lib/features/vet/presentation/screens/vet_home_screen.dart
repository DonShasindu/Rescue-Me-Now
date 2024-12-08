import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/util/assets.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';
import 'package:rescue_me_now/features/vet/presentation/screens/vet_profile_screen.dart';
import 'package:rescue_me_now/features/vet/presentation/screens/vet_verify_verified_screen.dart';

import '../../bloc/vet_event.dart';

class VetHomeScreen extends StatelessWidget {
  const VetHomeScreen({super.key});

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
                      'Hello ${context.read<AuthBloc>().state.vet?.username}',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      context.read<AuthBloc>().state.vet?.address ?? '',
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
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Assets.adoption,
                                  width: 120.w,
                                  height: 120.h,
                                ),
                                Text(
                                  'Verified\nPets',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.read<VetBloc>().add(
                                  GetAllPetsEvent(status: true),
                                );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VetVerifyAndVerifiedScreen(
                                  prop: "VERIFIED",
                                ),
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
                                  Assets.donation,
                                  width: 150.w,
                                  height: 120.h,
                                ),
                                Text(
                                  'Verify\nRequests',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.read<VetBloc>().add(
                                  GetAllPetsEvent(status: false),
                                );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const VetVerifyAndVerifiedScreen(
                                  prop: 'VERIFY',
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
                                builder: (context) => const VetProfileScreen(),
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
