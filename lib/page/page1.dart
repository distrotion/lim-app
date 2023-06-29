import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-01-P1BALANCEREQ01GET.dart';
import '../bloc/BlocEvent/01-02-P1BALANCEREQ01GETSTR.dart';
import '../model/model.dart';
import 'P1BALANCEREQ01/P1BALANCEREQ01MAIN.dart';

//---------------------------------------------------------

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1BlocTableBody();
  }
}

class Page1BlocTableBody extends StatelessWidget {
  const Page1BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P1BALANCEREQ01GET_Bloc(),
        child: BlocBuilder<P1BALANCEREQ01GET_Bloc, List<dataset>>(
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
        create: (_) => P1BALANCEREQ01GETSTR_Bloc(),
        child: BlocBuilder<P1BALANCEREQ01GETSTR_Bloc, String>(
          builder: (context, str) {
            return Page1Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page1Body extends StatelessWidget {
  Page1Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P1BALANCEREQ01MAIN(
        data: data,
        str: str,
      ),
    );
  }
}
