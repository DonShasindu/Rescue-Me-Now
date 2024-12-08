import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_state.dart';
import 'dart:math';

import '../../../../core/util/assets.dart';
import '../../../pet-owner/data/model/pet.dart';
import '../../bloc/vet_bloc.dart';
import '../../bloc/vet_event.dart';

class PetProfileVetScreen extends StatelessWidget {
  final Pet pet;
  const PetProfileVetScreen({super.key, required this.pet});

  @override
  Widget build(BuildContext context) {
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
                    base64Decode(pet.image),
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
                    pet.name,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    pet.breed,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  BlocBuilder<VetBloc, VetState>(builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.location_on,
                          color: Colors.black,
                          size: 25.sp,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          context.read<VetBloc>().state.petOwner?.address ?? "",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    );
                  }),
                  Text(
                    context.read<VetBloc>().state.petOwner?.contactNumber ?? "",
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
                            '${pet.age} Year',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            pet.name,
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
                            '${pet.weight} Kg',
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
                            '\$ ${pet.money + pet.food + pet.medicine}',
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
                  Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Food: ${pet.food} \$',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Medicine: ${pet.medicine} \$',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Money: ${pet.money} \$',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    'About ${pet.name}',
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
                      height: 140.h,
                      child: SingleChildScrollView(
                        child: Text(
                          pet.description,
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
                  SizedBox(
                    height: 5.h,
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<VetBloc>().add(
                            UpdatePetEvent(
                              pet: Pet(
                                regId: pet.regId,
                                name: pet.name,
                                breed: pet.breed,
                                age: pet.age,
                                weight: pet.weight,
                                description: pet.description,
                                money: pet.money,
                                isVerified: !pet.isVerified,
                                ownerUsername: pet.ownerUsername,
                                gender: pet.gender,
                                food: pet.food,
                                medicine: pet.medicine,
                                image: pet.image,
                                isPublished: pet.isPublished,
                                vaccined: pet.vaccined,
                                category: pet.category,
                                label: pet.label,
                                foodPercentage: pet.foodPercentage,
                                medicinePercentage: pet.medicinePercentage,
                                moneyPercentage: pet.moneyPercentage,
                              ),
                            ),
                          );
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: Text(
                      pet.isVerified ? 'Verified' : 'Not Verified',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
