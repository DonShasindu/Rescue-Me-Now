import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';
import 'package:rescue_me_now/features/root/presentation/screens/signIn_screen.dart';

import '../../../../core/widgets/textfiled/common_text_field.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_event.dart';

class DonorSignUpScreen extends StatefulWidget {
  const DonorSignUpScreen({super.key});

  @override
  State<DonorSignUpScreen> createState() => _DonorSignUpScreenState();
}

final usernameController = TextEditingController();
final addressController = TextEditingController();
final cityNameController = TextEditingController();
final contactNumberController = TextEditingController();
final passwordController = TextEditingController();

class _DonorSignUpScreenState extends State<DonorSignUpScreen> {
  bool _isSelectedFood = false;
  bool _isSelectedMedicine = false;
  bool _isSelectedFinancial = false;
  bool _isSelectedAdaptPet = false;

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
                    'A small contribution today can make',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xFF272424),
                    ),
                  ),
                  Text(
                    'a world of difference tomorrow',
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
                        Column(
                          children: [
                            SizedBox(height: 15.h),
                            Text(
                              "What can you donate?",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF272424),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 90.w, top: 0.h),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 30.h,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'Food',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF272424),
                                        ),
                                      ),
                                      value: _isSelectedFood,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          _isSelectedFood = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'Medicine',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF272424),
                                        ),
                                      ),
                                      value: _isSelectedMedicine,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          _isSelectedMedicine = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'Financial',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF272424),
                                        ),
                                      ),
                                      value: _isSelectedFinancial,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          _isSelectedFinancial = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height: 30.h,
                                    child: CheckboxListTile(
                                      controlAffinity:
                                          ListTileControlAffinity.leading,
                                      contentPadding: EdgeInsets.zero,
                                      title: Text(
                                        'Adopt a Pet',
                                        style: TextStyle(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w500,
                                          color: const Color(0xFF272424),
                                        ),
                                      ),
                                      value: _isSelectedAdaptPet,
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          _isSelectedAdaptPet = newValue!;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(60.w, 25.h, 60.w, 0),
                    child: PrimaryRoundButton(
                      text: "Sign Up",
                      color: const Color(0xFF609966),
                      textColor: Colors.white,
                      onClicked: () {
                        final Donor donor = Donor(
                          username: usernameController.text,
                          address: addressController.text,
                          cityName: cityNameController.text,
                          contactNumber: contactNumberController.text,
                          password: passwordController.text,
                          donateType: _isSelectedFood
                              ? 'food'
                              : _isSelectedMedicine
                                  ? 'medicine'
                                  : _isSelectedFinancial
                                      ? 'financial'
                                      : _isSelectedAdaptPet
                                          ? 'adopt'
                                          : 'food',
                        );
                        context.read<AuthBloc>().add(
                              SignUpEvent(donor: donor),
                            );
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
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
