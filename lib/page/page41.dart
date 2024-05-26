import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/41-01-P41XRFGETDATA.dart';
import '../bloc/BlocEvent/41-02-P41XRFREQGETSTR.dart';
import '../model/model.dart';
import 'P41XRFREQ/P41XRFREQMAIN.dart';

class Page41 extends StatelessWidget {
  const Page41({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page41BlocTableBody();
  }
}

class Page41BlocTableBody extends StatelessWidget {
  const Page41BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P41XRFREQGET_Bloc(),
        child: BlocBuilder<P41XRFREQGET_Bloc, List<dataset>>(
          builder: (context, data) {
            return Page1BlocTableBodySTR(
              data: data,
            );
          },
        ));
  }
}

class Page1BlocTableBodySTR extends StatelessWidget {
  Page1BlocTableBodySTR({
    Key? key,
    this.data,
  }) : super(key: key);
  List<dataset>? data;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P41XRFREQGETSTR_Bloc(),
        child: BlocBuilder<P41XRFREQGETSTR_Bloc, String>(
          builder: (context, str) {
            return Page41Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page41Body extends StatelessWidget {
  Page41Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return P41XRFREQMAIN(
      data: data,
      str: str,
    );
  }
}
