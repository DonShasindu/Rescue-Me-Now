import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/util/assets.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_state.dart';
import 'package:rescue_me_now/features/pet-owner/presentation/screens/donor_details._screen.dart';
import 'package:rescue_me_now/features/pet-owner/presentation/screens/pet_profile_screen.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';

import '../../bloc/pet_owner_bloc.dart';
import '../../bloc/pet_owner_event.dart';
import 'pet_owner_profile_screen.dart';
import 'package:intl/intl.dart';

class PetOwnerHomeScreen extends StatelessWidget {
  const PetOwnerHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PetOwnerBloc>().add(
          GetPetEvent(
            username: context.read<AuthBloc>().state.username,
          ),
        );
    context.read<PetOwnerBloc>().add(
          GetDonationsBannerEvent(
            username: context.read<AuthBloc>().state.username,
          ),
        );
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
                      context.read<AuthBloc>().state.petOwner?.address ?? '',
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: BlocBuilder<PetOwnerBloc, PetOwnerState>(
                    builder: (context, state) {
                  return SizedBox(
                    height: state.donations.isNotEmpty ? 190.h : 0.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.donations.length,
                      itemBuilder: ((context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 10.h),
                          decoration: BoxDecoration(
                            color: const Color(0xffCFFF8D),
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: state.pet != null
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 30.w,
                                      right: 30.w,
                                      top: 10.h,
                                      bottom: 10.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Someone Donated : ${state.donations[index].food + state.donations[index].medicine + state.donations[index].money}\$',
                                        style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '(Food - ${state.donations[index].food}\$ , Medicine - ${state.donations[index].food}\$ , Money - ${state.donations[index].money}\$)',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(height: 10.h),
                                      Text(
                                        'Remaining Donations : ${state.donations[index].food + state.donations[index].medicine + state.donations[index].money - state.pet!.food - state.pet!.medicine - state.pet!.money}\$',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        '(Food - ${state.pet!.food}\$ , Medicine - ${state.pet!.medicine}\$ , Money - ${state.pet!.money}\$)',
                                        style: TextStyle(
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Date : ',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            DateFormat('yyyy-MM-dd').format(
                                              DateTime.now(),
                                            ),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 190.w),
                                        child: Row(
                                          children: [
                                            TextButton(
                                              onPressed: () {
                                                context
                                                    .read<PetOwnerBloc>()
                                                    .add(
                                                      DismissDonationBannerEvent(
                                                        donorUsername: state
                                                            .donations[index]
                                                            .donorUsername,
                                                        ownerUsername: state
                                                            .donations[index]
                                                            .ownerUsername,
                                                      ),
                                                    );
                                                context
                                                    .read<PetOwnerBloc>()
                                                    .add(
                                                      GetDonationsBannerEvent(
                                                        username: state
                                                            .donations[index]
                                                            .donorUsername,
                                                      ),
                                                    );
                                              },
                                              child: const Text('Dismiss'),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : const SizedBox(),
                        );
                      }),
                    ),
                  );
                }),
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
                                Image.asset(
                                  Assets.adoption,
                                  width: 120.w,
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
                                builder: (context) =>
                                    const PetProfileScreen(published: true),
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
                                  height: 140.h,
                                ),
                                Text(
                                  'Donation',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            context.read<PetOwnerBloc>().add(
                                  GetDonorsEvent(
                                    username:
                                        context.read<AuthBloc>().state.username,
                                  ),
                                );
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DonorDetailsScreen(),
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
                                    const PetOwnerProfileScreen(),
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
