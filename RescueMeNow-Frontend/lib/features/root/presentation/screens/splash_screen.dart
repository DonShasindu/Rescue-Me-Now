import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/features/root/presentation/screens/welcome_screen.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';

import '../../../../core/util/assets.dart';
import '../../../vet/bloc/vet_event.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<VetBloc>().add(GetAllPetsEvent(status: true));
    Future.delayed(
      const Duration(seconds: 5),
      () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
          return const WelcomScreen();
        }));
      },
    );
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.splashBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min, // Set mainAxisSize to min
              children: <Widget>[
                SizedBox(
                  height: 170.h,
                ),
                Stack(
                  children: <Widget>[
                    Image.asset(
                      Assets.logo,
                      width: 400.w,
                      height: 200.h,
                    ),
                    Positioned(
                      top: 140.h,
                      left: 30.w,
                      child: Image.asset(
                        Assets.logoText,
                        width: 300.w,
                        height: 80.h,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 250.h),
                Padding(
                  padding: const EdgeInsets.only(left: 90, right: 90),
                  child: Column(
                    children: [
                      Text(
                        'Loading...',
                        style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LinearProgressIndicator(
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.green[800]!,
                        ),
                        minHeight: 10.h,
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
