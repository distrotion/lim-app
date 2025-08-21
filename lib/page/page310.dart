// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import 'P310BP12BALANCE01CAL/P310BP12BALANCE01CALMAIN.dart';

//---------------------------------------------------------

class Page310 extends StatelessWidget {
  const Page310({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page310blockget();
  }
}

class Page310blockget extends StatelessWidget {
  const Page310blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P310BP12BALANCECALDATA_Bloc(),
        child: BlocBuilder<P310BP12BALANCECALDATA_Bloc,
            List<P310BP12BALANCECALDATAclass>>(
          builder: (context, data) {
            return Page310Body(
              data: data,
            );
          },
        ));
  }
}

class Page310Body extends StatelessWidget {
  Page310Body({
    super.key,
    this.data,
  });
  List<P310BP12BALANCECALDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P310BP12BALANCE01CALMAIN(
      data: data,
      onClose: () {},
    );
  }
}
