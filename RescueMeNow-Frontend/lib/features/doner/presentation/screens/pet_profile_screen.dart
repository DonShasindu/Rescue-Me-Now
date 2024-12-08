import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_bloc.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_state.dart';
import 'package:rescue_me_now/features/doner/data/model/adoption.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/cureent_pet_donation.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_state.dart';
import 'dart:math';

import '../../../../core/util/assets.dart';
import '../../../pet-owner/data/model/pet.dart';
import '../../../vet/bloc/vet_event.dart';
import '../../bloc/donor_event.dart';

class DonorPetProfileScreen extends StatelessWidget {
  final bool donated;
  final bool adopted;
  final Pet pet;
  const DonorPetProfileScreen(
      {super.key,
      required this.donated,
      required this.adopted,
      required this.pet});

  @override
  Widget build(BuildContext context) {
    context.read<VetBloc>().add(
          GetPetOwnerEvent(username: pet.ownerUsername),
        );
    context.read<DonorBloc>().add(
          GetIsAdoptionEvent(
            petId: pet.regId,
            donorUsername: context.read<AuthBloc>().state.donor!.username,
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
                          state.petOwner?.address ?? '',
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
                    pet.regId,
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
                            '${pet.age} months',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            pet.breed,
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
                            '\$${pet.food + pet.medicine + pet.money}',
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
                      height: 160.h,
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
                  Padding(
                    padding: EdgeInsets.only(
                      left: 70.w,
                      right: 70.w,
                    ),
                    child: donated
                        ? PrimaryRoundButton(
                            text: "Donation",
                            color: Colors.grey,
                            textColor: Colors.black,
                            onClicked: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      CurrentPetDonationScreen(
                                    pet: pet,
                                  ),
                                ),
                              );
                            },
                          )
                        : const SizedBox(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 70.w,
                      right: 70.w,
                    ),
                    child: adopted
                        ? BlocBuilder<DonorBloc, DonorState>(
                            builder: (context, state) {
                            return PrimaryRoundButton(
                              text: state.isAdopted == true
                                  ? "Already Adopted"
                                  : "Adopt",
                              color: Colors.grey,
                              textColor: Colors.black,
                              onClicked: state.isAdopted == true
                                  ? null
                                  : () {
                                      context.read<DonorBloc>().add(
                                            AdoptPetEvent(
                                              adoption: Adoption(
                                                petId: pet.regId,
                                                donorUsername: context
                                                    .read<AuthBloc>()
                                                    .state
                                                    .donor!
                                                    .username,
                                                ownerUsername:
                                                    pet.ownerUsername,
                                              ),
                                            ),
                                          );
                                      Navigator.of(context).pop();
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.greenAccent,
                                          content:
                                              Text("Adopted Successfully..!"),
                                          duration: Duration(seconds: 3),
                                        ),
                                      );
                                    },
                            );
                          })
                        : const SizedBox(),
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
