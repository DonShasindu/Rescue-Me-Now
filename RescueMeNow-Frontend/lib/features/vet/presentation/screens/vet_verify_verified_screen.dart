import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_event.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_state.dart';
import 'package:rescue_me_now/features/vet/presentation/screens/pet_profile_screen.dart';

class VetVerifyAndVerifiedScreen extends StatelessWidget {
  final String prop;
  const VetVerifyAndVerifiedScreen({super.key, required this.prop});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppBar(
            elevation: 0,
          ),
          SizedBox(height: 20.h),
          Container(
            height: 50.h,
            width: 180.w,
            decoration: const BoxDecoration(
              color: Color(0xFFCFFF8D),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, top: 15.0),
              child: Text(
                "$prop PETS",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 200.h,
              child: BlocBuilder<VetBloc, VetState>(
                builder: (context, state) {
                  return ListView.builder(
                    itemCount: state.pets.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 15.h),
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
                            padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
                            child: Row(
                              children: [
                                SizedBox(width: 20.w),
                                SizedBox(
                                  height: 50.h,
                                  width: 50.w,
                                  child: CircleAvatar(
                                    radius: 50,
                                    backgroundImage: MemoryImage(
                                      base64Decode(state.pets[index].image),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 30.w),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.pets[index].name,
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      state.pets[index].breed.length <= 7
                                          ? state.pets[index].breed
                                          : '${state.pets[index].breed.substring(0, 4)}...',
                                      style: TextStyle(
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 30.w),
                                Text(
                                  state.pets[index].gender.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(width: 30.w),
                                GestureDetector(
                                  onTap: () {
                                    context.read<VetBloc>().add(
                                          GetPetOwnerEvent(
                                            username:
                                                state.pets[index].ownerUsername,
                                          ),
                                        );
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            PetProfileVetScreen(
                                          pet: state.pets[index],
                                        ),
                                      ),
                                    );
                                  },
                                  child: Transform.rotate(
                                    angle: 180 * 3.1415926535 / 180,
                                    child: Icon(
                                      Icons.arrow_back_ios_new_rounded,
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
