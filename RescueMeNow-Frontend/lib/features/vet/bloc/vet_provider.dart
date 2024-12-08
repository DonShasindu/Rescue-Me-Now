import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rescue_me_now/features/vet/bloc/vet_bloc.dart';

class VetProvider extends BlocProvider<VetBloc> {
  VetProvider({
    super.key,
  }) : super(
          create: (context) => VetBloc(),
        );
}
