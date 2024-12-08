import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/textfiled/common_text_field.dart';
import '../../../root/bloc/auth_bloc/auth_bloc.dart';
import '../../../vet/bloc/vet_bloc.dart';
import '../../../vet/bloc/vet_event.dart';
import '../../bloc/donor_bloc.dart';
import '../../bloc/donor_event.dart';
import '../../bloc/donor_state.dart';
import 'pet_profile_screen.dart';

class AvailablePetScreen extends StatefulWidget {
  final bool adoption;
  final bool donation;
  const AvailablePetScreen({
    super.key,
    required this.adoption,
    required this.donation,
  });

  @override
  State<AvailablePetScreen> createState() => _AvailablePetScreenState();
}

class _AvailablePetScreenState extends State<AvailablePetScreen> {
  @override
  Widget build(BuildContext context) {
    context.read<DonorBloc>().add(GetAllPublishedPetsEvent(
          status: true,
          isModel: false,
        ));
    final TextEditingController controller = TextEditingController();

    return WillPopScope(
      onWillPop: () async {
        context.read<DonorBloc>().add(
              GetAllPublishedPetsEvent(
                  status: true,
                  isModel: true,
                  type: context.read<AuthBloc>().state.donor!.donateType),
            );
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBar(
                title: const Text('Available Pets'),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, bottom: 20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: CommonTextField(
                          controller: controller,
                          hintText: 'Search',
                          textColor: Colors.white,
                          cursorColor: Colors.black,
                          onChanged: (value) {
                            context.read<DonorBloc>().add(
                                  FilterPetsEvent(
                                    filter: controller.text,
                                  ),
                                );
                          }),
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
              ),
              SizedBox(height: 10.h),
              Container(
                height: 50.h,
                width: 150.w,
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
                    widget.adoption ? 'Adoption' : 'Donation',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 10.h),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.63,
                        child: SingleChildScrollView(
                          child: Wrap(
                            spacing: 15.h,
                            runSpacing: 15.h,
                            children: [
                              BlocBuilder<DonorBloc, DonorState>(
                                builder: (context, state) {
                                  return Wrap(
                                    children: [
                                      ...state.pets.map(
                                        (pet) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                              right: 10.w,
                                              bottom: 10.h,
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                context.read<VetBloc>().add(
                                                      GetPetOwnerEvent(
                                                          username: pet
                                                              .ownerUsername),
                                                    );
                                                context.read<DonorBloc>().add(
                                                      GetDonationsEvent(
                                                        username:
                                                            pet.ownerUsername,
                                                        donorUsername: context
                                                            .read<AuthBloc>()
                                                            .state
                                                            .donor!
                                                            .username,
                                                      ),
                                                    );
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DonorPetProfileScreen(
                                                      pet: pet,
                                                      donated: widget.donation,
                                                      adopted: widget.adoption,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFFCFFF8D),
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                height: 230.h,
                                                width: 160.w,
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.all(10.sp),
                                                      child: Image(
                                                        height: 100.h,
                                                        image: MemoryImage(
                                                          base64Decode(
                                                              pet.image),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: 15.h),
                                                    Container(
                                                      height: 90.h,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.all(
                                                          color: Colors.black,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                          left: 10.w,
                                                          right: 10.w,
                                                        ),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Text(
                                                                  pet.name,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  pet.gender,
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        17.sp,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                            .grey[
                                                                        700],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            Text(
                                                              pet.breed,
                                                              style: TextStyle(
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
