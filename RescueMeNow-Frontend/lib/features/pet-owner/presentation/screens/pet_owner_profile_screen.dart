import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/pet-owner/presentation/screens/pet_profile_screen.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';

import '../../../../core/util/assets.dart';
import '../../../root/bloc/auth_bloc/auth_event.dart';
import '../../../root/presentation/screens/signIn_screen.dart';

class PetOwnerProfileScreen extends StatelessWidget {
  const PetOwnerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.petOwnerProfileBackground),
              fit: BoxFit.cover,
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
                          'Pet Owner',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                        const Text(
                          'Verified',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
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
                height: 370.h,
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
                          child: Text(
                            context.read<AuthBloc>().state.username,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
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
                            child: Text(
                              context.read<AuthBloc>().state.petOwner!.address,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
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
                            child: Text(
                              context.read<AuthBloc>().state.petOwner!.cityName,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
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
                            child: Text(
                              context
                                  .read<AuthBloc>()
                                  .state
                                  .petOwner!
                                  .contactNumber,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 30),
                            child: Text(
                              ' Age',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 70),
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.transparent,
                              child: Icon(
                                Icons.account_balance_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              context.read<AuthBloc>().state.petOwner!.account,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25.h,
              ),
              Column(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const PetProfileScreen(
                            published: false,
                          ),
                        ),
                      );
                    },
                    child: const Text(
                      'Pet Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.11,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: PrimaryRoundButton(
                      text: 'Sign Out',
                      color: const Color(0xFF5F7464),
                      textColor: Colors.white,
                      onClicked: () {
                        context.read<AuthBloc>().add(SignOutEvent());
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const SignInScreen(),
                          ),
                        );
                      },
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
