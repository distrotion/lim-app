// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import '../bloc/BlocEvent/400-01-P400GETDATA.dart';
import 'P300CAL/P300CALMAIN.dart';
import 'P400CAL/P400CALMAIN.dart';

//---------------------------------------------------------

class Page400 extends StatelessWidget {
  const Page400({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page400blockget();
  }
}

class Page400blockget extends StatelessWidget {
  const Page400blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P400HESBALANCEGETCALDATA_Bloc(),
        child: BlocBuilder<P400HESBALANCEGETCALDATA_Bloc,
            List<P400HESBALANCEGETCALDATAclass>>(
          builder: (context, data) {
            return Page400Body(
              data: data,
            );
          },
        ));
  }
}

class Page400Body extends StatelessWidget {
  Page400Body({
    super.key,
    this.data,
  });
  List<P400HESBALANCEGETCALDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P400CALMAIN(
      data: data,
    );
  }
}
