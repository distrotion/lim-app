import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/56-01-P56UVGETDATA.dart';
import '../bloc/BlocEvent/56-02-P56UVREQGETSTR.dart';
import '../model/model.dart';
import 'P56UVREQ/P56UVREQMAIN.dart';

class Page56 extends StatelessWidget {
  const Page56({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page56BlocTableBody();
  }
}

class Page56BlocTableBody extends StatelessWidget {
  const Page56BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P56UVREQGET_Bloc(),
        child: BlocBuilder<P56UVREQGET_Bloc, List<dataset>>(
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
        create: (_) => P56UVREQGETSTR_Bloc(),
        child: BlocBuilder<P56UVREQGETSTR_Bloc, String>(
          builder: (context, str) {
            return Page56Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page56Body extends StatelessWidget {
  Page56Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return P56UVREQMAIN(
      data: data,
      str: str,
    );
  }
}
