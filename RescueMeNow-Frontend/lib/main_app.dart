import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/features/doner/bloc/donor_provider.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_provider.dart';
import 'package:rescue_me_now/features/root/presentation/screens/splash_screen.dart';
import 'features/root/bloc/auth_bloc/auth_provider.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_provider.dart';

class PetCareApp extends StatelessWidget {
  const PetCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 760),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            AuthProvider(),
            PetOwnerProvider(),
            VetProvider(),
            DonorProvider(),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: child,
          ),
        );
      },
      child: const SplashScreen(),
    );
  }
}
