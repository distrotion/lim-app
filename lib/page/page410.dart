// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import '../bloc/BlocEvent/410-01-P410SENTDATA.dart';
import 'P410HESBALANCE02CAL/P410HESBALANCE02CALMAIN.dart';

//---------------------------------------------------------

class Page410 extends StatelessWidget {
  const Page410({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page410blockget();
  }
}

class Page410blockget extends StatelessWidget {
  const Page410blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P410HESBALANCECALDATA_Bloc(),
        child: BlocBuilder<P410HESBALANCECALDATA_Bloc,
            List<P410HESBALANCECALDATAclass>>(
          builder: (context, data) {
            return Page410Body(
              data: data,
            );
          },
        ));
  }
}

class Page410Body extends StatelessWidget {
  Page410Body({
    super.key,
    this.data,
  });
  List<P410HESBALANCECALDATAclass>? data;
  @override
  Widget build(BuildContext context) {
    return P410HESBALANCE02CALMAIN(
      data: data,
      onClose: () {},
    );
  }
}
