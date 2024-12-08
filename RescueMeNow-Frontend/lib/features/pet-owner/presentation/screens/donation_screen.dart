import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/core/widgets/textfiled/common_text_field.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_event.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/expense.dart';
import 'package:rescue_me_now/features/pet-owner/presentation/screens/donation_manage_history.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';

import '../../../doner/bloc/donor_event.dart';
import '../../../doner/data/model/donor.dart';

class DonationScreen extends StatefulWidget {
  const DonationScreen({
    super.key,
    required this.donor,
  });

  final Donor donor;

  @override
  State<DonationScreen> createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController foodController = TextEditingController();
  final TextEditingController medicineController = TextEditingController();
  final TextEditingController moneyController = TextEditingController();

  double _total = 0;

  @override
  Widget build(BuildContext context) {
    context.read<DonorBloc>().add(
          GetDonationsEvent(
            username: context.read<AuthBloc>().state.petOwner!.username,
            donorUsername: widget.donor.username,
          ),
        );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text(
                  'Donation',
                  style: TextStyle(
                    fontSize: 20.sp,
                  ),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                ),
                child: Column(
                  children: [
                    Text(
                      'Update the Donation',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 18.h,
                    ),
                    Column(
                      children: [
                        Text(
                          'Donated: ${context.read<DonorBloc>().state.food + context.read<DonorBloc>().state.medicine + context.read<DonorBloc>().state.money}\$',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(Food- ${context.read<DonorBloc>().state.food}\$, Medicine- ${context.read<DonorBloc>().state.medicine}\$, Money- ${context.read<DonorBloc>().state.money}\$)',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Column(
                      children: [
                        Text(
                          'Remaining: ${context.read<DonorBloc>().state.food - context.read<PetOwnerBloc>().state.pet!.food + context.read<DonorBloc>().state.medicine - context.read<PetOwnerBloc>().state.pet!.medicine + context.read<DonorBloc>().state.money - context.read<PetOwnerBloc>().state.pet!.money}\$',
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '(Food- ${context.read<DonorBloc>().state.food - context.read<PetOwnerBloc>().state.pet!.food}\$, Medicine- ${context.read<DonorBloc>().state.medicine - context.read<PetOwnerBloc>().state.pet!.medicine}\$, Money- ${context.read<DonorBloc>().state.money - context.read<PetOwnerBloc>().state.pet!.money}\$)',
                          style: TextStyle(
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    CommonTextField(
                      controller: dateController,
                      hintText: 'Date',
                      cursorColor: Colors.black,
                      textColor: Colors.white,
                    ),
                    CommonTextField(
                      controller: foodController,
                      hintText: 'For Food',
                      cursorColor: Colors.black,
                      textColor: Colors.white,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        setState(() {
                          _total = double.parse(foodController.text == ""
                                  ? "0"
                                  : foodController.text) +
                              double.parse(medicineController.text == ""
                                  ? "0"
                                  : medicineController.text) +
                              double.parse(moneyController.text == ""
                                  ? "0"
                                  : moneyController.text);
                        });
                      },
                    ),
                    CommonTextField(
                      controller: medicineController,
                      hintText: 'For Medicine',
                      cursorColor: Colors.black,
                      textColor: Colors.white,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        setState(() {
                          _total = double.parse(foodController.text == ""
                                  ? "0"
                                  : foodController.text) +
                              double.parse(medicineController.text == ""
                                  ? "0"
                                  : medicineController.text) +
                              double.parse(moneyController.text == ""
                                  ? "0"
                                  : moneyController.text);
                        });
                      },
                    ),
                    CommonTextField(
                      controller: moneyController,
                      hintText: 'For Financial',
                      cursorColor: Colors.black,
                      textColor: Colors.white,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) {
                        setState(() {
                          _total = double.parse(foodController.text == ""
                                  ? "0"
                                  : foodController.text) +
                              double.parse(medicineController.text == ""
                                  ? "0"
                                  : medicineController.text) +
                              double.parse(moneyController.text == ""
                                  ? "0"
                                  : moneyController.text);
                        });
                      },
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Total: ',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        children: [
                          TextSpan(
                            text: '$_total\$',
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 50.0,
                        left: 50.0,
                      ),
                      child: PrimaryRoundButton(
                        onClicked: () {
                          // if (_total >=
                          //     (context.read<DonorBloc>().state.food - context.read<PetOwnerBloc>().state.pet!.food + context.read<DonorBloc>().state.medicine - context.read<PetOwnerBloc>().state.pet!.medicine + context.read<DonorBloc>().state.money - context.read<PetOwnerBloc>().state.pet!.money)) {
                          //   ScaffoldMessenger.of(context).showSnackBar(
                          //     const SnackBar(
                          //       content: Text(
                          //           'You do not have enough money to expense'),
                          //     ),
                          //   );
                          //   return;
                          // }
                          context.read<PetOwnerBloc>().add(
                                AddExpenseEvent(
                                  expense: Expense(
                                    ownerUsername: context
                                        .read<AuthBloc>()
                                        .state
                                        .petOwner!
                                        .username,
                                    petId: context
                                        .read<PetOwnerBloc>()
                                        .state
                                        .pet!
                                        .regId,
                                    donorUsername: widget.donor.username,
                                    date: dateController.text == ""
                                        ? DateFormat('yyyy-MM-dd')
                                            .format(DateTime.now())
                                        : dateController.text,
                                    food: double.parse(foodController.text == ""
                                        ? "0"
                                        : foodController.text),
                                    medicine: double.parse(
                                        medicineController.text == ""
                                            ? "0"
                                            : medicineController.text),
                                    money: double.parse(
                                        moneyController.text == ""
                                            ? "0"
                                            : moneyController.text),
                                  ),
                                ),
                              );
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Donation Updated'),
                            ),
                          );
                        },
                        text: 'Update',
                        color: const Color(0xFF609966),
                        textColor: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 50.0,
                        left: 50.0,
                      ),
                      child: PrimaryRoundButton(
                        onClicked: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  DonationManageHistory(donor: widget.donor),
                            ),
                          );
                        },
                        text: 'View Details',
                        color: Colors.grey[400]!,
                        textColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
