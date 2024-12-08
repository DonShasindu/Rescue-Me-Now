import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue_me_now/features/root/bloc/auth_bloc/auth_bloc.dart';

class AuthProvider extends BlocProvider<AuthBloc> {
  AuthProvider({
    super.key,
  }) : super(
          create: (context) => AuthBloc(),
        );
}
