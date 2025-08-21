// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import '../bloc/BlocEvent/320-01-P320GETDATA.dart';
import 'P300CAL/P300CALMAIN.dart';
import 'P320CALDATALOG/P320CALDATALOGMAIN.dart';

//---------------------------------------------------------

class Page320 extends StatelessWidget {
  const Page320({Key? key}) : super(key: key);

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Build a [Page320blockget] widget.
  ///
  /// This widget is a [BlocProvider] that wraps a [BlocBuilder] that builds a
  /// [Page320Body] widget with the state of the [P320BP12BALANCEDATALOG_Bloc].
  ///
/******  422d0439-8ff5-4c64-ab41-4c396641f2d7  *******/  Widget build(BuildContext context) {
    return Page320blockget();
  }
}

class Page320blockget extends StatelessWidget {
  const Page320blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P320BP12BALANCEDATALOG_Bloc(),
        child: BlocBuilder<P320BP12BALANCEDATALOG_Bloc,
            List<P320BP12BALANCEDATALOGclass>>(
          builder: (context, data) {
            return Page320Body(
              data: data,
            );
          },
        ));
  }
}

class Page320Body extends StatelessWidget {
  Page320Body({
    super.key,
    this.data,
  });
  List<P320BP12BALANCEDATALOGclass>? data;
  @override
  Widget build(BuildContext context) {
    return P320CALDATALOGMAIN(
      data: data,
    );
  }
}
