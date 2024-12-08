import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/util/assets.dart';
import 'package:rescue_me_now/features/doner/presentation/screens/doner_home_screen.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_event.dart';
import 'package:rescue_me_now/features/pet-owner/presentation/screens/pet_owner_home_screen.dart';
import 'package:rescue_me_now/features/root/presentation/screens/role_selection_screen.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';
import 'package:rescue_me_now/features/vet/presentation/screens/vet_home_screen.dart';
import '../../../../core/widgets/buttons/primary_round_button.dart';
import '../../../../core/widgets/textfiled/common_text_field.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../bloc/auth_bloc/auth_event.dart';
import '../../bloc/auth_bloc/auth_state.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

final usernameController = TextEditingController();
final passwordController = TextEditingController();

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.signInBackground),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                BlocListener<AuthBloc, AuthState>(
                  // listenWhen: (previous, current) =>
                  //     previous.currentRole != current.currentRole || onTap,
                  listener: (context, state) {
                    print('Current Role: ${state.currentRole}');
                    if (state.currentRole != RoleType.undefined) {
                      switch (state.currentRole) {
                        case RoleType.donor:
                          context.read<PetOwnerBloc>().add(
                                SetUsernameEvent(username: state.username),
                              );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const DonerHomeScreen(),
                            ),
                          );
                          break;
                        case RoleType.petOwner:
                          final pets = context.read<VetBloc>().state.pets;
                          if (pets.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                backgroundColor: Colors.redAccent,
                                content:
                                    Text("Your pet is not verified yet..!"),
                                duration: Duration(seconds: 3),
                              ),
                            );
                            return;
                          }
                          for (int i = 0; i < pets.length; i++) {
                            if (pets[i].ownerUsername ==
                                    context.read<AuthBloc>().state.username &&
                                pets[i].isVerified == true) {
                              break;
                            } else if (i == pets.length - 1) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content:
                                      Text("Your pet is not verified yet..!"),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                              return;
                            }
                          }
                          context.read<PetOwnerBloc>().add(
                                SetUsernameEvent(username: state.username),
                              );
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const PetOwnerHomeScreen(),
                            ),
                          );
                          break;
                        case RoleType.vet:
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const VetHomeScreen(),
                            ),
                          );
                          break;
                        case RoleType.undefined:
                          break;
                      }
                    }
                  },
                  child: SizedBox.fromSize(
                    size: const Size(0, 0),
                  ),
                ),
                SizedBox(height: 150.h),
                Column(
                  children: [
                    Text(
                      'Change starts',
                      style: TextStyle(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF304D30),
                      ),
                    ),
                    Text(
                      'with you!',
                      style: TextStyle(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF304D30),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                Text(
                  'Sign in to continue',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFFAAAAAA),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.w, right: 30.w),
                  child: Column(
                    children: [
                      CommonTextField(
                        controller: usernameController,
                        hintText: 'User Name',
                        textColor: const Color(0xFFA5D58A),
                        isPassword: false,
                        cursorColor: Colors.white,
                      ),
                      CommonTextField(
                        controller: passwordController,
                        hintText: 'Password',
                        textColor: const Color(0xFFA5D58A),
                        isPassword: true,
                        cursorColor: Colors.white,
                      ),
                      SizedBox(height: 20.h),
                      Builder(builder: (context) {
                        return PrimaryRoundButton(
                          text: 'Sign In',
                          textColor: const Color(0xFF609966),
                          color: Colors.white,
                          onClicked: () async {
                            context.read<AuthBloc>().add(
                                  SignInEvent(
                                    username: usernameController.text,
                                    password: passwordController.text,
                                  ),
                                );
                            await Future.delayed(
                              const Duration(seconds: 4),
                            );
                            clearAllControllers();
                            // ignore: use_build_context_synchronously
                            if (context.read<AuthBloc>().state.username == '') {
                              // ignore: use_build_context_synchronously
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content: Text("Wrong Credentials..!"),
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                        );
                      }),
                      SizedBox(height: 2.h),
                      TextButton(
                        onPressed: () {
                          forgetPassword(context);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF5BA156),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 90.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF8D8D8D),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RoleSelactionScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF609966),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void clearAllControllers() {
    usernameController.clear();
    passwordController.clear();
  }

  void forgetPassword(BuildContext context) {
    final TextEditingController contactNumberController =
        TextEditingController();
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
                  "Getting your Password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                CommonTextField(
                  controller: contactNumberController,
                  textColor: Colors.white,
                  cursorColor: Colors.black,
                  hintText: 'Enter Contact Number',
                  isPassword: false,
                ),
                SizedBox(
                  height: 20.h,
                ),
                PrimaryRoundButton(
                  text: 'Get Password',
                  textColor: Colors.white,
                  color: Colors.green,
                  onClicked: () {
                    context.read<AuthBloc>().add(
                          ForgetPasswordEvent(
                            contactNumber: contactNumberController.text,
                          ),
                        );
                    Navigator.of(context).pop();
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
