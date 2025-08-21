// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/311-01-P311SENTDATA.dart';
import 'P311CAL/P311BP12BALANCE03CALMAIN.dart';

//---------------------------------------------------------

class Page311 extends StatelessWidget {
  const Page311({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page311blockget();
  }
}

class Page311blockget extends StatelessWidget {
  const Page311blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P311BP12BALANCECALDATA_Bloc(),
        child: BlocBuilder<P311BP12BALANCECALDATA_Bloc,
            List<P311BP12BALANCECALDATAclass>>(
          builder: (context, data) {
            return Page311Body(
              data: data,
            );
          },
        ));
  }
}

class Page311Body extends StatelessWidget {
  Page311Body({
    super.key,
    this.data,
  });
  List<P311BP12BALANCECALDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P311BP12BALANCE03CALMAIN(
      data: data,
    );
  }
}
