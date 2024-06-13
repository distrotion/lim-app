import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cubit/00-01-TESTINGOCR_cubit.dart';
import 'P200LIMX/P200LIMX.dart';

class Page200 extends StatelessWidget {
  const Page200({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page200BlocTableBody();
  }
}

class Page200BlocTableBody extends StatelessWidget {
  /// {@macro counter_page}
  const Page200BlocTableBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => TESTINGOCR_Cubit(),
        child: BlocBuilder<TESTINGOCR_Cubit, TESTINGdataout>(
          builder: (context, Qdata) {
            return Page200Body();
          },
        ));
  }
}

class Page200Body extends StatelessWidget {
  const Page200Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P200LIMXUPDATE(),
    );
  }
}
