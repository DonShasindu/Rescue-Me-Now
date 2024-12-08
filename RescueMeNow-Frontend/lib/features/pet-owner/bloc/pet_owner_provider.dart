import 'package:flutter_bloc/flutter_bloc.dart';

import 'pet_owner_bloc.dart';

class PetOwnerProvider extends BlocProvider<PetOwnerBloc> {
  PetOwnerProvider({
    super.key,
  }) : super(
          create: (context) => PetOwnerBloc(),
        );
}
