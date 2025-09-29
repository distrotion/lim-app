// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import '../bloc/BlocEvent/320-01-P320GETDATA.dart';
import '../bloc/BlocEvent/420-01-P420GETDATA.dart';
import 'P300CAL/P300CALMAIN.dart';
import 'P320CALDATALOG/P320CALDATALOGMAIN.dart';
import 'P420CALDATALOG/P420CALDATALOGMAIN.dart';

//---------------------------------------------------------

class Page420 extends StatelessWidget {
  const Page420({Key? key}) : super(key: key);

  @override
/*************  ✨ Codeium Command ⭐  *************/
  /// Build a [Page420blockget] widget.
  ///
  /// This widget is a [BlocProvider] that wraps a [BlocBuilder] that builds a
  /// [Page420Body] widget with the state of the [P420HESBALANCEDATALOG_Bloc].
  ///
/******  422d0439-8ff5-4c64-ab41-4c396641f2d7  *******/ Widget build(
      BuildContext context) {
    return Page420blockget();
  }
}

class Page420blockget extends StatelessWidget {
  const Page420blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P420HESBALANCEDATALOG_Bloc(),
        child: BlocBuilder<P420HESBALANCEDATALOG_Bloc,
            List<P420HESBALANCEDATALOGclass>>(
          builder: (context, data) {
            return Page420Body(
              data: data,
            );
          },
        ));
  }
}

class Page420Body extends StatelessWidget {
  Page420Body({
    super.key,
    this.data,
  });
  List<P420HESBALANCEDATALOGclass>? data;
  @override
  Widget build(BuildContext context) {
    return P420CALDATALOGMAIN(
      data: data,
    );
  }
}
