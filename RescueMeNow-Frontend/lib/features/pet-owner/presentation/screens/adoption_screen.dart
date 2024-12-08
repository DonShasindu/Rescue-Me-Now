import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rescue_me_now/core/widgets/buttons/primary_round_button.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_bloc.dart';
import 'package:rescue_me_now/features/pet-owner/bloc/pet_owner_event.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet.dart';

import '../../../../core/widgets/textfiled/common_text_field.dart';
import '../../bloc/pet_owner_state.dart';

class PetAdoptionScreen extends StatefulWidget {
  const PetAdoptionScreen({super.key, required this.ownerUsername});

  final String ownerUsername;

  @override
  State<PetAdoptionScreen> createState() => _PetAdoptionScreenState();
}

class _PetAdoptionScreenState extends State<PetAdoptionScreen> {
  File? _image;
  String? _selectedGender;
  String? _base64Image;
  String? _selectedState;

  Future<void> _getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        List<int> imageBytes = _image!.readAsBytesSync();
        _base64Image = base64Encode(imageBytes);

        print('Base64 Image: $_base64Image');
      } else {
        log('No image selected.');
      }
    });
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _breedController = TextEditingController();
  final TextEditingController _registrationNoController =
      TextEditingController();
  final TextEditingController _foodController = TextEditingController();
  final TextEditingController _medicineController = TextEditingController();
  final TextEditingController _moneyController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _foodPracentageController =
      TextEditingController();
  final TextEditingController _medicinePracentageController =
      TextEditingController();
  final TextEditingController _moneyPracentageController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          children: [
            BlocListener<PetOwnerBloc, PetOwnerState>(
              listenWhen: (previous, current) => previous.pet != current.pet,
              listener: (context, state) {
                if (state.pet != null && state.pet?.regId != "") {
                  _nameController.text = state.pet!.name;
                  _ageController.text = state.pet!.age.toString();
                  _weightController.text = state.pet!.weight.toString();
                  _breedController.text = state.pet!.breed;
                  _registrationNoController.text = state.pet!.regId;
                  _foodController.text = state.pet!.food.toString();
                  _medicineController.text = state.pet!.medicine.toString();
                  _moneyController.text = state.pet!.money.toString();
                  _descriptionController.text = state.pet!.description;
                  _categoryController.text = state.pet!.category;
                  _foodPracentageController.text =
                      state.pet!.foodPercentage.toString();
                  _medicinePracentageController.text =
                      state.pet!.medicinePercentage.toString();
                  _moneyPracentageController.text =
                      state.pet!.moneyPercentage.toString();
                  setState(() {
                    _selectedGender = state.pet!.gender;
                    _base64Image = state.pet!.image;
                    _selectedState = state.pet!.vaccined;
                  });
                }
              },
              child: SizedBox.fromSize(
                size: const Size(0, 0),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppBar(
              title: const Text('Pet Details'),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.86,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      CommonTextField(
                        fieldName: 'Name',
                        isRequired: true,
                        hintText: 'Name',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _nameController,
                      ),
                      CommonTextField(
                        fieldName: 'Age',
                        isRequired: true,
                        hintText: 'Age',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _ageController,
                      ),
                      CommonTextField(
                        fieldName: 'Weight',
                        isRequired: true,
                        hintText: 'Weight',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _weightController,
                      ),
                      CommonTextField(
                        fieldName: 'Breed',
                        isRequired: true,
                        hintText: 'Breed',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _breedController,
                      ),
                      CommonTextField(
                        fieldName: 'Category',
                        isRequired: true,
                        hintText: 'Category',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _categoryController,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Gender :',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Radio<String>(
                              value: 'male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              'Male',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Radio<String>(
                              value: 'female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value;
                                });
                              },
                            ),
                            Text(
                              'Female',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.h, left: 20.w),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Vaccined :',
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Radio<String>(
                              value: 'yes',
                              groupValue: _selectedState,
                              onChanged: (value) {
                                setState(() {
                                  _selectedState = value;
                                });
                              },
                            ),
                            Text(
                              'Yes',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                            Radio<String>(
                              value: 'no',
                              groupValue: _selectedState,
                              onChanged: (value) {
                                setState(() {
                                  _selectedState = value;
                                });
                              },
                            ),
                            Text(
                              'No',
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ],
                        ),
                      ),
                      CommonTextField(
                        fieldName: 'Registration No.',
                        isRequired: true,
                        hintText: 'Registration No.',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _registrationNoController,
                      ),
                      CommonTextField(
                        fieldName: 'Food',
                        isRequired: true,
                        hintText: 'How Much Money Need for Food per Day',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _foodController,
                      ),
                      CommonTextField(
                        fieldName: 'Food Percentage',
                        hintText: 'Percentage of Food Need',
                        isRequired: true,
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _foodPracentageController,
                      ),
                      CommonTextField(
                        fieldName: 'Medicine',
                        isRequired: true,
                        hintText: 'How Much Money Need for Medicine per Day',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _medicineController,
                      ),
                      CommonTextField(
                        fieldName: 'Medicine Percentage',
                        hintText: 'Percentage of Medicine Need',
                        isRequired: true,
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _medicinePracentageController,
                      ),
                      CommonTextField(
                        fieldName: 'Money',
                        isRequired: true,
                        hintText: 'How Much Money Need for per Day',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _moneyController,
                      ),
                      CommonTextField(
                        fieldName: 'Money Percentage',
                        isRequired: true,
                        hintText: 'Percentage of Money Need',
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _moneyPracentageController,
                      ),
                      CommonTextField(
                        fieldName: 'Description',
                        isRequired: true,
                        hintText: 'Description about Pet',
                        maxLines: 5,
                        keyboardType: TextInputType.multiline,
                        textColor: Colors.white,
                        cursorColor: Colors.black,
                        fontSize: 16.sp,
                        controller: _descriptionController,
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: 20.h,
                            bottom: 20.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              _base64Image == null || _base64Image == ''
                                  ? Text(
                                      'No image selected.',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  : Image.memory(
                                      base64Decode(_base64Image!),
                                      width: 100.w,
                                      height: 100.h,
                                    ),
                              const SizedBox(width: 10),
                              FloatingActionButton(
                                onPressed: _getImageFromGallery,
                                tooltip: 'Pick Image',
                                child: const Icon(Icons.add_a_photo),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      PrimaryRoundButton(
                        text: 'Submit',
                        textColor: Colors.white,
                        color: const Color(0xFF609966),
                        onClicked: () {
                          context.read<PetOwnerBloc>().add(
                                UpdatePetEvent(
                                  pet: Pet(
                                    ownerUsername: widget.ownerUsername,
                                    name: _nameController.text,
                                    age: int.parse(_ageController.text),
                                    weight: int.parse(_weightController.text),
                                    breed: _breedController.text,
                                    gender: _selectedGender ?? 'Male',
                                    regId: _registrationNoController.text,
                                    food: int.parse(_foodController.text),
                                    medicine:
                                        int.parse(_medicineController.text),
                                    money: int.parse(_moneyController.text),
                                    description: _descriptionController.text,
                                    image: _base64Image ?? '',
                                    isVerified: false,
                                    isPublished: false,
                                    vaccined: _selectedState ?? 'yes',
                                    category: _categoryController.text,
                                    label: '',
                                    foodPercentage: int.parse(
                                        _foodPracentageController.text),
                                    medicinePercentage: int.parse(
                                        _medicinePracentageController.text),
                                    moneyPercentage: int.parse(
                                        _moneyPracentageController.text),
                                  ),
                                ),
                              );
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.greenAccent,
                              content: Text(
                                "Your Changes Saved..!",
                                style: TextStyle(
                                  fontSize: 18.sp,
                                ),
                              ),
                              duration: const Duration(seconds: 3),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
