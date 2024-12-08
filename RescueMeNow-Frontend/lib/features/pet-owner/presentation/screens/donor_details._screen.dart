import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rescue_me_now/core/util/assets.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_state.dart';
import 'package:rescue_me_now/features/pet-owner/presentation/screens/donation_screen.dart';

class DonorDetailsScreen extends StatelessWidget {
  const DonorDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          AppBar(
            title: Text(
              'Donors',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.sp,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.sp),
            child: SizedBox(
              child: BlocBuilder<PetOwnerBloc, PetOwnerState>(
                buildWhen: (previous, current) =>
                    previous.donors != current.donors,
                builder: (context, state) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.8,
                    child: state.donors.isEmpty
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            itemCount: state.donors.length,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => DonationScreen(
                                        donor: context
                                            .read<PetOwnerBloc>()
                                            .state
                                            .donors[index],
                                      ),
                                    ),
                                  );
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    left: 20.w,
                                    right: 20.w,
                                    top: 20.h,
                                    bottom: 20.h,
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 80.w,
                                          height: 80.h,
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(Assets.profile),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              context
                                                  .read<PetOwnerBloc>()
                                                  .state
                                                  .donors[index]
                                                  .username,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            Text(
                                              state.donors[index].address,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                            Text(
                                              state.donors[index].contactNumber,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20.sp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
