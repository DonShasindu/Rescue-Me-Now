import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_bloc.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_event.dart';
import 'package:rescue_me_now/features/doner/data/model/donor.dart';

import '../../../../core/util/assets.dart';
import '../../../../core/widgets/textfiled/common_text_field.dart';
import '../../../root/bloc/auth_bloc/auth_bloc.dart';
import '../../../root/bloc/auth_bloc/auth_event.dart';
import '../../../root/bloc/auth_bloc/auth_state.dart';
import '../../../root/presentation/screens/signIn_screen.dart';

class DonarProfileScreen extends StatefulWidget {
  const DonarProfileScreen({super.key});

  @override
  State<DonarProfileScreen> createState() => _DonarProfileScreenState();
}

class _DonarProfileScreenState extends State<DonarProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _addressController = TextEditingController();
    final TextEditingController _cityNameController = TextEditingController();
    final TextEditingController _contactNumberController =
        TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              return Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(Assets.petOwnerProfileBackground),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 60.w),
                              child: Container(
                                height: 70.h,
                                width: 70.w,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(Assets.userProfile),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.read<AuthBloc>().state.username,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Donor',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    SizedBox(
                      height: 430.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 60.w),
                                child: Container(
                                  height: 30.h,
                                  width: 30.w,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      image: AssetImage(Assets.profile),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: 200.w,
                                  height: 85.h,
                                  child: CommonTextField(
                                    controller: _addressController,
                                    hintText: context
                                            .read<AuthBloc>()
                                            .state
                                            .donor
                                            ?.username ??
                                        'Default Username',
                                    isPassword: false,
                                    textColor: Colors.white,
                                    cursorColor: Colors.black,
                                    fontSize: 20,
                                    enabled: false,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.location_on,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: 200.w,
                                  height: 85.h,
                                  child: CommonTextField(
                                    controller: _addressController,
                                    hintText: context
                                            .read<AuthBloc>()
                                            .state
                                            .donor
                                            ?.address ??
                                        'Default Address',
                                    isPassword: false,
                                    textColor: Colors.white,
                                    cursorColor: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.location_city_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: 200.w,
                                  height: 85.h,
                                  child: CommonTextField(
                                    controller: _cityNameController,
                                    hintText: context
                                            .read<AuthBloc>()
                                            .state
                                            .donor
                                            ?.cityName
                                            .toString() ??
                                        'Default City',
                                    isPassword: false,
                                    textColor: Colors.white,
                                    cursorColor: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.phone_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: 200.w,
                                  height: 85.h,
                                  child: CommonTextField(
                                    controller: _contactNumberController,
                                    hintText: context
                                            .read<AuthBloc>()
                                            .state
                                            .donor
                                            ?.contactNumber
                                            .toString() ??
                                        'Default Contact Number',
                                    isPassword: false,
                                    textColor: Colors.white,
                                    cursorColor: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 70),
                                child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.transparent,
                                  child: Icon(
                                    Icons.password_rounded,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: SizedBox(
                                  width: 200.w,
                                  height: 85.h,
                                  child: CommonTextField(
                                    controller: _passwordController,
                                    hintText: context
                                            .read<AuthBloc>()
                                            .state
                                            .donor
                                            ?.password
                                            .toString() ??
                                        'Default Password',
                                    isPassword: false,
                                    textColor: Colors.white,
                                    cursorColor: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: PrimaryRoundButton(
                            text: 'Edit Profile',
                            color: Color.fromARGB(255, 20, 36, 24),
                            textColor: Colors.white,
                            onClicked: () {
                              final Donor donor = Donor(
                                username: _usernameController.text == ""
                                    ? context.read<AuthBloc>().state.username
                                    : _usernameController.text,
                                address: _addressController.text == ""
                                    ? context
                                        .read<AuthBloc>()
                                        .state
                                        .donor!
                                        .address
                                    : _addressController.text,
                                cityName: _cityNameController.text == ""
                                    ? context
                                        .read<AuthBloc>()
                                        .state
                                        .donor!
                                        .cityName
                                    : _cityNameController.text,
                                contactNumber:
                                    _contactNumberController.text == ""
                                        ? context
                                            .read<AuthBloc>()
                                            .state
                                            .donor!
                                            .contactNumber
                                        : _contactNumberController.text,
                                password: _passwordController.text == ""
                                    ? context
                                        .read<AuthBloc>()
                                        .state
                                        .donor!
                                        .password
                                    : _passwordController.text,
                                donateType: context
                                    .read<AuthBloc>()
                                    .state
                                    .donor!
                                    .donateType,
                              );

                              context.read<DonorBloc>().add(
                                    EditProfileEvent(donor: donor),
                                  );
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Profile Updated!'),
                                ),
                              );
                              Navigator.of(context).pop();
                              context
                                  .read<AuthBloc>()
                                  .add(ChangeDonorEvent(donor: donor));
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 100),
                          child: PrimaryRoundButton(
                            text: 'Sign Out',
                            color: const Color(0xFF5F7464),
                            textColor: Colors.white,
                            onClicked: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const SignInScreen(),
                                ),
                              );
                              context.read<AuthBloc>().add(SignOutEvent());
                            },
                          ),
                        ),
                        SizedBox(
                          height: 40.h,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
