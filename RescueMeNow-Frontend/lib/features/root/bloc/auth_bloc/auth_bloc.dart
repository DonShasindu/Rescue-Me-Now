import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rescue_me_now/features/pet-owner/data/model/pet_owner.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_event.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_state.dart';
import 'package:rescue_me_now/features/root/data/repository/auth_repository.dart';
import 'package:rescue_me_now/features/vet/data/model/vet.dart';

import '../../../doner/data/model/donor.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthRepository authRepository = AuthRepository();
  AuthBloc() : super(AuthState.initial()) {
    on<AuthEvent>(
      (event, emit) async => switch (event) {
        SignInEvent() => _signIn(event, emit),
        SignUpEvent() => _signUp(event, emit),
        SignOutEvent() => _signOut(event, emit),
        ForgetPasswordEvent() => _forgetPassword(event, emit),
        ChangeDonorEvent() => _changeDonor(event, emit),
      },
    );
  }

  FutureOr<void> _signIn(SignInEvent event, Emitter<AuthState> emit) async {
    final response = await authRepository.signInWithEmailAndPassword(
      event.username,
      event.password,
    );
    if (response['username'] != null && response['username'] != "") {
      emit(
        state.clone(
          currentRole: RoleType.values.firstWhere(
            (e) => e.toString().split('.').last == response['role'],
          ),
          username: response['username'],
          petOwner: response['role'] == "petOwner"
              ? PetOwner(
                  username: response['username'],
                  address: response['address'],
                  cityName: response['cityName'],
                  contactNumber: response['contactNumber'],
                  password: response['password'] ?? '',
                  account: response['account'],
                  role: response['role'],
                )
              : null,
          vet: response['role'] == "vet"
              ? Vet(
                  username: response['username'],
                  address: response['address'],
                  cityName: response['cityName'],
                  contactNumber: response['contactNumber'],
                  role: response['role'],
                  regId: response['regId'],
                )
              : null,
          donor: response['role'] == "donor"
              ? Donor(
                  username: response['username'],
                  address: response['address'],
                  cityName: response['cityName'],
                  contactNumber: response['contactNumber'],
                  password: response['password'] ?? '',
                  donateType: response['donateType'],
                  role: response['role'],
                )
              : null,
        ),
      );
    }
  }

  FutureOr<void> _signUp(SignUpEvent event, Emitter<AuthState> emit) async {
    final response = await authRepository.signUp(
      event.petOwner,
      event.donor,
    );
    emit(
      state.clone(
        // currentRole: RoleType.values.firstWhere(
        //   (e) => e.toString().split('.').last == response['role'],
        // ),
        username: response['username'],
      ),
    );
  }

  FutureOr<void> _signOut(SignOutEvent event, Emitter<AuthState> emit) async {
    emit(
      AuthState.initial(),
    );
  }

  Future<FutureOr<void>> _forgetPassword(
      ForgetPasswordEvent event, Emitter<AuthState> emit) async {
    final response = await authRepository.forgetPassword(event.contactNumber);
    if (response['password'] == null ||
        response['password'] == "" ||
        response['password'] == "User not found") {
      return null;
    }
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
    );
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Your Password',
      response['password'],
      platformChannelSpecifics,
    );
  }

  _changeDonor(ChangeDonorEvent event, Emitter<AuthState> emit) {
    emit(
      state.clone(
        donor: event.donor,
      ),
    );
  }
}
