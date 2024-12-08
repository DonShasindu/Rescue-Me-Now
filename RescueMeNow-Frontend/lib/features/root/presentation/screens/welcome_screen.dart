import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/util/assets.dart'; // Assuming you have a file named assets.dart where you define asset paths
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/root/presentation/screens/role_selection_screen.dart';
import 'package:rescue_me_now/features/root/presentation/screens/signIn_screen.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.welcomeBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                SizedBox(height: 150.h),
                Text(
                  'Welcome',
                  style: TextStyle(
                    fontSize: 40.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 270.h),
                Padding(
                  padding: EdgeInsets.fromLTRB(60.w, 0, 60.w, 0),
                  child: PrimaryRoundButton(
                    text: "Sign In",
                    color: Colors.white,
                    textColor: const Color(0xFF609966),
                    onClicked: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(60.w, 30.h, 60.w, 0),
                  child: PrimaryRoundButton(
                      text: "Sign Up",
                      color: Color(0xFF609966),
                      textColor: Colors.white,
                      onClicked: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const RoleSelactionScreen(),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
