import 'package:flutter_bloc/flutter_bloc.dart';

import 'donor_bloc.dart';

class DonorProvider extends BlocProvider<DonorBloc> {
  DonorProvider({
    super.key,
  }) : super(
          create: (context) => DonorBloc(),
        );
}
