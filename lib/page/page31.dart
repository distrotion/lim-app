import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/31-01-P31ICPGETDATA.dart';
import '../bloc/BlocEvent/31-02-P31ICPREQGETSTR.dart';
import '../model/model.dart';
import 'P31ICPREQ/P31ICPREQMAIN.dart';

class Page31 extends StatelessWidget {
  const Page31({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page31BlocTableBody();
  }
}

class Page31BlocTableBody extends StatelessWidget {
  const Page31BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P31ICPREQGET_Bloc(),
        child: BlocBuilder<P31ICPREQGET_Bloc, List<dataset>>(
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
        create: (_) => P31ICPREQGETSTR_Bloc(),
        child: BlocBuilder<P31ICPREQGETSTR_Bloc, String>(
          builder: (context, str) {
            return Page31Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page31Body extends StatelessWidget {
  Page31Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return P31ICPREQMAIN(
      data: data,
      str: str,
    );
  }
}
