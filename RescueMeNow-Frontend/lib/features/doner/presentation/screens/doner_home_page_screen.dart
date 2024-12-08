import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/textfiled/common_text_field.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_bloc.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_state.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/avalible_pet_screen.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/pet_profile_screen.dart';

import '../../../../core/util/assets.dart';
import '../../../root/bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/donor_event.dart';

class DonerHomePageScreen extends StatelessWidget {
  const DonerHomePageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<DonorBloc>().add(
          GetAllPublishedPetsEvent(
              status: true,
              isModel: true,
              type: context.read<AuthBloc>().state.donor!.donateType),
        );

    final TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 10.h),
              AppBar(
                title: const Text('Doner Home Page'),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                  top: 5.h,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      context.read<AuthBloc>().state.username,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      context.read<AuthBloc>().state.donor!.address,
                      style: TextStyle(
                        fontSize: 18.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: CommonTextField(
                            controller: searchController,
                            hintText: 'Search',
                            textColor: Colors.white,
                            cursorColor: Colors.black,
                            onChanged: (p0) => context.read<DonorBloc>().add(
                                  FilterPetsEvent(
                                      filter: searchController.text),
                                ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Container(
                          height: 50.h,
                          width: 50.w,
                          decoration: BoxDecoration(
                            color: const Color(0xffCFFF8D),
                            borderRadius: BorderRadius.circular(15.sp),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Icon(
                            Icons.search,
                            color: Colors.black,
                            size: 28.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Text(
                      'Categories',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<DonorBloc>().add(
                                    FilterPetsCategoryEvent(category: 'cat'),
                                  );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Assets.catPng,
                                        width: 45.w,
                                        height: 45.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Cats',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<DonorBloc>().add(
                                    FilterPetsCategoryEvent(category: 'dog'),
                                  );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Assets.dogPng,
                                        width: 45.w,
                                        height: 45.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Dogs',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<DonorBloc>().add(
                                    FilterPetsOrgEvent(org: 'org'),
                                  );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        Assets.birdPng,
                                        width: 45.w,
                                        height: 45.h,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Organizations',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              context.read<DonorBloc>().add(
                                    FilterPetsCategoryEvent(category: ''),
                                  );
                            },
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(10.sp),
                                  ),
                                  child: Column(
                                    children: [
                                      Transform.rotate(
                                        angle: 45,
                                        child: Padding(
                                          padding: EdgeInsets.only(
                                              top: 5.h, left: 8.w, right: 8.w),
                                          child: const Icon(
                                            Icons.pets,
                                            size: 45,
                                            color: Colors.black,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5.h),
                                Text(
                                  'Others',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.w),
                    child: Text(
                      'Recommended',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.w),
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const AvailablePetScreen(
                              donation: true,
                              adoption: false,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'View All',
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: Colors.grey[700],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: 15.h,
                    left: 15.w,
                    right: 15.w,
                    top: 5.h,
                  ),
                  child: SizedBox(
                    height: 300.h,
                    child: BlocBuilder<DonorBloc, DonorState>(
                        builder: (context, state) {
                      return state.pets.isEmpty
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              itemCount: state.pets.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Container(
                                    height: 80.h,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFCFFF8D),
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.black,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          top: 10.h, bottom: 10.h),
                                      child: Row(
                                        children: [
                                          SizedBox(width: 20.w),
                                          SizedBox(
                                            height: 50.h,
                                            width: 50.w,
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundImage: MemoryImage(
                                                base64Decode(
                                                    state.pets[index].image),
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 20.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.pets[index].name,
                                                style: TextStyle(
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Text(
                                                  state.pets[index].breed
                                                              .length <=
                                                          7
                                                      ? state.pets[index].breed
                                                      : '${state.pets[index].breed.substring(0, 4)}...',
                                                  style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(width: 30.w),
                                          Text(
                                            state.pets[index].age
                                                .toString()
                                                .toUpperCase(),
                                            style: TextStyle(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          SizedBox(width: 30.w),
                                          GestureDetector(
                                            onTap: () {
                                              if (state.pets[index].category ==
                                                  'org') {
                                                return;
                                              }
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DonorPetProfileScreen(
                                                    donated: true,
                                                    adopted: false,
                                                    pet: state.pets[index],
                                                  ),
                                                ),
                                              );
                                            },
                                            child: Transform.rotate(
                                              angle: 180 * 3.1415926535 / 180,
                                              child: Icon(
                                                Icons
                                                    .arrow_back_ios_new_rounded,
                                                size: 30.sp,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
