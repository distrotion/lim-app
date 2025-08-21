// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import 'P300CAL/P300CALMAIN.dart';

//---------------------------------------------------------

class Page300 extends StatelessWidget {
  const Page300({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page300blockget();
  }
}

class Page300blockget extends StatelessWidget {
  const Page300blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P300BP12BALANCEGETCALDATA_Bloc(),
        child: BlocBuilder<P300BP12BALANCEGETCALDATA_Bloc,
            List<P300BP12BALANCEGETCALDATAclass>>(
          builder: (context, data) {
            return Page300Body(
              data: data,
            );
          },
        ));
  }
}

class Page300Body extends StatelessWidget {
  Page300Body({
    super.key,
    this.data,
  });
  List<P300BP12BALANCEGETCALDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P300CALMAIN(
      data: data,
    );
  }
}
