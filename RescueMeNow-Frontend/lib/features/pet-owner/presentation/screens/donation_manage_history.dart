import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/util/assets.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_state.dart';

import '../../bloc/pet_owner_event.dart';

class DonationManageHistory extends StatelessWidget {
  const DonationManageHistory({super.key, required this.donor});

  final Donor donor;

  @override
  Widget build(BuildContext context) {
    context.read<PetOwnerBloc>().add(
          GetExpensesEvent(
            ownerUsername: context.read<PetOwnerBloc>().state.username,
            donorUsername: donor.username,
          ),
        );
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<PetOwnerBloc, PetOwnerState>(
          builder: (context, state) {
            return Column(
              children: [
                AppBar(
                  title: Text(
                    'Donation History',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 180.h,
                  width: 180.w,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage(Assets.profile),
                    radius: 50,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Padding(
                  padding: EdgeInsets.all(8.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        donor.username,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        donor.address,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        donor.contactNumber,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          color: Colors.black,
                          thickness: 1,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 100.w,
                              ),
                              Text(
                                'Food',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Medicine',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Money',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.3,
                            child: BlocBuilder<PetOwnerBloc, PetOwnerState>(
                              builder: (context1, state1) {
                                return ListView.builder(
                                  itemCount: state1.expenses.length,
                                  itemBuilder: (context, index) {
                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          state1.expenses[index].date,
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          '${state1.expenses[index].food}',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          '${state1.expenses[index].medicine}',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          '${state1.expenses[index].money}',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                        Text(
                                          '${state1.expenses[index].food + state1.expenses[index].medicine + state1.expenses[index].money}',
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                          ),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(
                              color: Colors.black,
                              thickness: 1,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${context.read<PetOwnerBloc>().state.expenses.fold(0.0, (previousValue, element) => previousValue + element.food)}',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${context.read<PetOwnerBloc>().state.expenses.fold(0.0, (previousValue, element) => previousValue + element.medicine)}',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${context.read<PetOwnerBloc>().state.expenses.fold(0.0, (previousValue, element) => previousValue + element.money)}',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${context.read<PetOwnerBloc>().state.expenses.fold(0.0, (previousValue, element) => previousValue + element.food + element.medicine + element.money)}',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
