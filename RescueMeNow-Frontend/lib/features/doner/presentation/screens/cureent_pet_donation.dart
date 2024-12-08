import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/core/widgets/textfiled/common_text_field.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_bloc.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_event.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_event.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';

import '../../../../core/widgets/textfiled/credit_card_form_wrapper.dart';
import '../../../pet-owner/bloc/pet_owner_bloc.dart';
import '../../../pet-owner/bloc/pet_owner_state.dart';
import '../../../root/bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/donor_state.dart';
import '../../data/model/donation.dart';

class CurrentPetDonationScreen extends StatefulWidget {
  const CurrentPetDonationScreen({super.key, required this.pet});

  final Pet pet;

  @override
  State<CurrentPetDonationScreen> createState() =>
      _CurrentPetDonationScreenState();
}

class _CurrentPetDonationScreenState extends State<CurrentPetDonationScreen> {
  final int totalAmount = 0;
  double total = 0;
  @override
  Widget build(BuildContext context) {
    context.read<DonorBloc>().add(GetDonationsEvent(
          username: widget.pet.ownerUsername,
          donorUsername: context.read<AuthBloc>().state.donor!.username,
        ));
    context.read<DonorBloc>().add(GetTotalDonationsEvent(
          username: widget.pet.ownerUsername,
        ));

    context.read<PetOwnerBloc>().add(
          GetExpensesEvent(
            ownerUsername: widget.pet.ownerUsername,
            donorUsername: context.read<AuthBloc>().state.donor!.username,
          ),
        );
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<DonorBloc, DonorState>(
          builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                AppBar(
                  title: const Text('Pet Donation Profile'),
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
                const SizedBox(height: 2),
                SizedBox(
                  height: 180.h,
                  width: 180.w,
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: MemoryImage(
                      base64Decode(widget.pet.image),
                    ),
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
                        context.read<VetBloc>().state.petOwner!.username,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.read<VetBloc>().state.petOwner!.address,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        context.read<VetBloc>().state.petOwner!.contactNumber,
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
                      SizedBox(
                        height: 10.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
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
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(height: 10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'You have donated : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Text(
                                    '${context.read<DonorBloc>().state.food + context.read<DonorBloc>().state.medicine + context.read<DonorBloc>().state.money}\$',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '(Food- ${context.read<DonorBloc>().state.food}\$, Medicine- ${context.read<DonorBloc>().state.medicine}\$) Money- ${context.read<DonorBloc>().state.money}\$',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(
                                height: 8.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Remaining : ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                  Text(
                                    '${(widget.pet.food - context.read<DonorBloc>().state.totFood) + (widget.pet.medicine - context.read<DonorBloc>().state.totMedicine) + (widget.pet.money - context.read<DonorBloc>().state.totMoney)}\$',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                '(Food- ${widget.pet.food - context.read<DonorBloc>().state.food}\$, Medicine- ${widget.pet.medicine - context.read<DonorBloc>().state.medicine}\$) Money- ${widget.pet.money - context.read<DonorBloc>().state.money}\$',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.sp,
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              TextButton(
                                onPressed: () {
                                  showDonateMorePop(context);
                                },
                                child: Text(
                                  'Donate More',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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

  void showDonateMorePop(BuildContext context) {
    final TextEditingController foodController = TextEditingController();
    final TextEditingController medicineController = TextEditingController();
    final TextEditingController financialController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.sp,
              top: 30.sp,
              right: 20.sp,
              bottom: 20.sp,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "How much do you want to donate ?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                CommonTextField(
                  controller: foodController,
                  textColor: Colors.white,
                  cursorColor: Colors.black,
                  hintText: 'For Food',
                  onChanged: (p0) => {
                    setState(
                      () {
                        total = double.parse(
                              foodController.text == ""
                                  ? "0"
                                  : foodController.text,
                            ) +
                            double.parse(
                              medicineController.text == ""
                                  ? "0"
                                  : medicineController.text,
                            ) +
                            double.parse(
                              financialController.text == ""
                                  ? "0"
                                  : financialController.text,
                            );
                      },
                    ),
                  },
                ),
                CommonTextField(
                  controller: medicineController,
                  textColor: Colors.white,
                  cursorColor: Colors.black,
                  hintText: 'For Medicine',
                  onChanged: (p0) => {
                    setState(
                      () {
                        total = double.parse(
                              foodController.text == ""
                                  ? "0"
                                  : foodController.text,
                            ) +
                            double.parse(
                              medicineController.text == ""
                                  ? "0"
                                  : medicineController.text,
                            ) +
                            double.parse(
                              financialController.text == ""
                                  ? "0"
                                  : financialController.text,
                            );
                      },
                    ),
                  },
                ),
                CommonTextField(
                  controller: financialController,
                  textColor: Colors.white,
                  cursorColor: Colors.black,
                  hintText: 'For Financial ',
                  onChanged: (p0) => {
                    setState(
                      () {
                        total = double.parse(
                              foodController.text == ""
                                  ? "0"
                                  : foodController.text,
                            ) +
                            double.parse(
                              medicineController.text == ""
                                  ? "0"
                                  : medicineController.text,
                            ) +
                            double.parse(
                              financialController.text == ""
                                  ? "0"
                                  : financialController.text,
                            );
                      },
                    ),
                  },
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Total : ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: '$total\$',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryRoundButton(
                    text: "Yes,Donate",
                    color: const Color(
                      0xffCFFF8D,
                    ),
                    textColor: Colors.black,
                    onClicked: () {
                      showCardPaymentPop(context);
                      // Navigator.pop(context);
                      context.read<DonorBloc>().add(
                            DonationEvent(
                              donation: Donation(
                                ownerUsername: widget.pet.ownerUsername,
                                food: double.parse(
                                  foodController.text == ""
                                      ? "0"
                                      : foodController.text,
                                ),
                                medicine: double.parse(
                                  medicineController.text == ""
                                      ? "0"
                                      : medicineController.text,
                                ),
                                money: double.parse(
                                  financialController.text == ""
                                      ? "0"
                                      : financialController.text,
                                ),
                                donorUsername: context
                                    .read<AuthBloc>()
                                    .state
                                    .donor!
                                    .username,
                                regId: widget.pet.ownerUsername,
                                status: 'pending',
                                date: DateFormat('yyyy-MM-dd').format(
                                  DateTime.now(),
                                ),
                                isDismissed: false,
                              ),
                            ),
                          );
                      context.read<DonorBloc>().add(
                            GetDonationsEvent(
                              username: widget.pet.ownerUsername,
                              donorUsername: context
                                  .read<AuthBloc>()
                                  .state
                                  .donor!
                                  .username,
                            ),
                          );
                    }),
                SizedBox(
                  height: 10.h,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showCardPaymentPop(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      enableDrag: false,
      isScrollControlled: true,
      useSafeArea: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 20.sp,
              top: 30.sp,
              right: 20.sp,
              bottom: 20.sp,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  "Enter Card Details",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20.h),
                const CreditCardFormWrapper(),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryRoundButton(
                  text: 'Proceed',
                  textColor: Colors.white,
                  color: Colors.green,
                  onClicked: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Payment Successful',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
