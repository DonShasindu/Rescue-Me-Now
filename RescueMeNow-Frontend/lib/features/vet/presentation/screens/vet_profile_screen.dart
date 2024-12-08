import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_event.dart';

import '../../../../core/util/assets.dart';
import '../../../root/bloc/auth_bloc/auth_bloc.dart';
import '../../../root/bloc/auth_bloc/auth_event.dart';
import '../../../root/presentation/screens/signIn_screen.dart';

class VetProfileScreen extends StatelessWidget {
  const VetProfileScreen({super.key});

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
                          'Vererinarian',
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
                height: 250.h,
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
                              context.read<AuthBloc>().state.vet!.address,
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
                              context.read<AuthBloc>().state.vet!.cityName,
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
                                  .vet!
                                  .contactNumber
                                  .toString(),
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
                                Icons.app_registration_rounded,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              context.read<AuthBloc>().state.vet!.regId,
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
              Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 100),
                    child: PrimaryRoundButton(
                      text: 'Sign Out',
                      color: const Color(0xFF5F7464),
                      textColor: Colors.white,
                      onClicked: () {
                        context.read<VetBloc>().add(
                              GetAllPetsEvent(status: true),
                            );
                        context.read<AuthBloc>().add(SignOutEvent());

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
