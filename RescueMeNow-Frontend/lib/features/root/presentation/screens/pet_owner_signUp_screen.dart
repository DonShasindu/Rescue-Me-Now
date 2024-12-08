import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_event.dart';

import '../../../../core/widgets/textfiled/common_text_field.dart';
import '../../../pet-owner/presentation/screens/adoption_screen.dart';
import '../../bloc/auth_bloc/auth_event.dart';

class PetOwerSignUpScreen extends StatefulWidget {
  const PetOwerSignUpScreen({super.key});

  @override
  State<PetOwerSignUpScreen> createState() => _PetOwerSignUpScreenState();
}

final TextEditingController usernameController = TextEditingController();
final TextEditingController addressController = TextEditingController();
final TextEditingController cityNameController = TextEditingController();
final TextEditingController contactNumberController = TextEditingController();
final TextEditingController accountNumberController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _PetOwerSignUpScreenState extends State<PetOwerSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(top: 25.h),
          child: Text(
            'Create  Account',
            style: TextStyle(
              fontSize: 30.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFF272424),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        backgroundColor: const Color(0xFFCFFF8D),
      ),
      body: SafeArea(
        child: Material(
          color: const Color(0xFFCFFF8D),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10.h),
                  Text(
                    'Open your heart and let kindness flow',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272424),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Padding(
                    padding: EdgeInsets.only(left: 35.w, right: 35.w),
                    child: Column(
                      children: [
                        CommonTextField(
                          controller: usernameController,
                          cursorColor: Colors.black54,
                          textColor: Colors.white,
                          hintText: 'User Name',
                          prefixIcon: Icon(
                            Icons.person_rounded,
                            size: 20.r,
                          ),
                        ),
                        CommonTextField(
                          controller: addressController,
                          cursorColor: Colors.black54,
                          textColor: Colors.white,
                          hintText: 'Address',
                          prefixIcon: Icon(
                            Icons.location_on_rounded,
                            size: 20.r,
                          ),
                        ),
                        CommonTextField(
                          controller: cityNameController,
                          cursorColor: Colors.black54,
                          textColor: Colors.white,
                          hintText: 'City Name',
                          prefixIcon: Icon(
                            Icons.location_city_rounded,
                            size: 20.r,
                          ),
                        ),
                        CommonTextField(
                          controller: contactNumberController,
                          cursorColor: Colors.black54,
                          textColor: Colors.white,
                          hintText: 'Contact Number',
                          prefixIcon: Icon(
                            Icons.phone_rounded,
                            size: 20.r,
                          ),
                        ),
                        CommonTextField(
                          controller: accountNumberController,
                          cursorColor: Colors.black54,
                          textColor: Colors.white,
                          hintText: 'Account Number',
                          prefixIcon: Icon(
                            Icons.calendar_month_rounded,
                            size: 20.r,
                          ),
                        ),
                        CommonTextField(
                          controller: passwordController,
                          cursorColor: Colors.black54,
                          textColor: Colors.white,
                          hintText: 'Password',
                          isPassword: true,
                          prefixIcon: Icon(
                            Icons.password_rounded,
                            size: 20.r,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.w, 20.h, 60.w, 0),
                    child: PrimaryRoundButton(
                      text: "Sign Up",
                      color: const Color(0xFF609966),
                      textColor: Colors.white,
                      onClicked: () {
                        context.read<AuthBloc>().add(
                              SignUpEvent(
                                petOwner: PetOwner(
                                  username: usernameController.text,
                                  password: passwordController.text,
                                  address: addressController.text,
                                  cityName: cityNameController.text,
                                  contactNumber: contactNumberController.text,
                                  account: accountNumberController.text,
                                ),
                              ),
                            );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PetAdoptionScreen(
                              ownerUsername: usernameController.text,
                            ),
                          ),
                        );
                        context
                            .read<VetBloc>()
                            .add(GetAllPetsEvent(status: true));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
