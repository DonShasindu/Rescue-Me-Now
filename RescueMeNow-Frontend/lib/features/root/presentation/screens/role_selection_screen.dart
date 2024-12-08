import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/features/root/presentation/screens/donor_signUp_screen.dart';
import 'package:rescue_me_now/features/root/presentation/screens/pet_owner_signUp_screen.dart';

import '../../../../core/widgets/buttons/primary_round_button.dart';

class RoleSelactionScreen extends StatelessWidget {
  const RoleSelactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFFCFFF8D),
      ),
      body: SafeArea(
        child: Material(
          color: const Color(0xFFCFFF8D),
          child: Column(
            children: [
              SizedBox(height: 289.h),
              Text(
                'Who are you?',
                style: TextStyle(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF0E0202),
                ),
              ),
              SizedBox(height: 78.h),
              Padding(
                padding: EdgeInsets.fromLTRB(60.w, 0, 60.w, 0),
                child: Column(
                  children: [
                    PrimaryRoundButton(
                      text: "Pet Owner",
                      color: const Color(0xFFFDFFAE),
                      textColor: const Color(0xFF609966),
                      onClicked: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => PetOwerSignUpScreen(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 45.h),
                    PrimaryRoundButton(
                      text: "Donor",
                      color: const Color(0xFFFDFFAE),
                      textColor: const Color(0xFF609966),
                      onClicked: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const DonorSignUpScreen(),
                          ),
                        );
                      },
                    ),
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
