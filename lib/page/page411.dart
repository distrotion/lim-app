// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/311-01-P311SENTDATA.dart';
import '../bloc/BlocEvent/411-01-P411SENTDATA.dart';
import 'P411HESBALANCE03CAL/P411HESBALANCE03CALMAIN.dart';

//---------------------------------------------------------

class Page411 extends StatelessWidget {
  const Page411({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page411blockget();
  }
}

class Page411blockget extends StatelessWidget {
  const Page411blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P411HESBALANCECALDATA_Bloc(),
        child: BlocBuilder<P411HESBALANCECALDATA_Bloc,
            List<P411HESBALANCECALDATAclass>>(
          builder: (context, data) {
            return Page411Body(
              data: data,
            );
          },
        ));
  }
}

class Page411Body extends StatelessWidget {
  Page411Body({
    super.key,
    this.data,
  });
  List<P411HESBALANCECALDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P411HESBALANCE03CALMAIN(
      data: data,
    );
  }
}
