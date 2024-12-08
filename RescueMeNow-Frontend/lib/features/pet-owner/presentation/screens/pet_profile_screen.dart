import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_event.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_state.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';
import 'dart:math';

import '../../../../core/util/assets.dart';

class PetProfileScreen extends StatelessWidget {
  final bool published;
  const PetProfileScreen({super.key, required this.published});

  @override
  Widget build(BuildContext context) {
    context.read<PetOwnerBloc>().add(
          GetPetEvent(
            username: context.read<AuthBloc>().state.petOwner!.username,
          ),
        );
    return Material(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.petProfileBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              AppBar(
                title: const Text('Pet Profile'),
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 180.h,
                width: 180.w,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: MemoryImage(
                    base64Decode(context.read<PetOwnerBloc>().state.pet!.image),
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.read<PetOwnerBloc>().state.pet!.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    context.read<PetOwnerBloc>().state.pet!.breed,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: Colors.black,
                        size: 25.sp,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        context.read<AuthBloc>().state.petOwner!.address,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    context.read<AuthBloc>().state.petOwner!.contactNumber,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30.h,
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Transform.rotate(
                            angle: pi / 4,
                            child: Icon(
                              Icons.pets,
                              color: Colors.black,
                              size: 30.sp,
                            ),
                          ),
                          Text(
                            '${context.read<PetOwnerBloc>().state.pet!.age} Year',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            context.read<PetOwnerBloc>().state.pet!.breed,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.monitor_weight_rounded,
                            color: Colors.black,
                            size: 30.sp,
                          ),
                          Text(
                            '${context.read<PetOwnerBloc>().state.pet!.weight} Kg',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Weight',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Icon(
                            Icons.money_rounded,
                            color: Colors.black,
                            size: 30.sp,
                          ),
                          Text(
                            '\$${context.read<PetOwnerBloc>().state.pet!.food + context.read<PetOwnerBloc>().state.pet!.medicine + context.read<PetOwnerBloc>().state.pet!.money}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Per Day',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'About ${context.read<PetOwnerBloc>().state.pet!.name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: SizedBox(
                      height: 160.h,
                      child: SingleChildScrollView(
                        child: Text(
                          context.read<PetOwnerBloc>().state.pet!.description,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<PetOwnerBloc, PetOwnerState>(
                    builder: (_, state) {
                      return Padding(
                        padding: EdgeInsets.only(
                          left: 70.w,
                          right: 70.w,
                        ),
                        child: !context
                                .read<PetOwnerBloc>()
                                .state
                                .pet!
                                .isPublished
                            ? PrimaryRoundButton(
                                text: "Publish Post",
                                color: Colors.grey,
                                textColor: Colors.black,
                                onClicked: () {
                                  Pet pet =
                                      context.read<PetOwnerBloc>().state.pet!;
                                  context.read<PetOwnerBloc>().add(
                                        UpdatePetEvent(
                                          pet: Pet(
                                            ownerUsername: pet.ownerUsername,
                                            name: pet.name,
                                            breed: pet.breed,
                                            age: pet.age,
                                            weight: pet.weight,
                                            food: pet.food,
                                            medicine: pet.medicine,
                                            money: pet.money,
                                            description: pet.description,
                                            image: pet.image,
                                            isPublished: true,
                                            gender: pet.gender,
                                            isVerified: pet.isVerified,
                                            regId: pet.regId,
                                            category: pet.category,
                                            vaccined: pet.vaccined,
                                            label: pet.label,
                                            foodPercentage: pet.foodPercentage,
                                            medicinePercentage:
                                                pet.medicinePercentage,
                                            moneyPercentage:
                                                pet.moneyPercentage,
                                          ),
                                        ),
                                      );
                                  ScaffoldMessenger.of(_).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.greenAccent,
                                      content: Text(
                                        "Post Published..!",
                                        style: TextStyle(
                                          fontSize: 18.sp,
                                        ),
                                      ),
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                  Navigator.of(context).pop();
                                },
                              )
                            : PrimaryRoundButton(
                                text: "View Adopters",
                                color: Colors.grey,
                                textColor: Colors.black,
                                onClicked: () {
                                  AdoptersAlertDialog(context);
                                },
                              ),
                      );
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void AdoptersAlertDialog(BuildContext context) {
    context.read<PetOwnerBloc>().add(
          GetAdopterEvent(petId: context.read<PetOwnerBloc>().state.pet!.regId),
        );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("New Adopter"),
          content: BlocBuilder<PetOwnerBloc, PetOwnerState>(
              builder: (context, state) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "This is the new owner of your pet.",
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Icon(
                  Icons.person,
                  size: 50.sp,
                ),
                SizedBox(
                  height: 10.h,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      state.adopter?.username ?? "",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.adopter?.contactNumber ?? "",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      state.adopter?.address ?? "",
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            );
          }),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
