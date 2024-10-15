import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/51-01-P51ICGETDATA.dart';
import '../bloc/BlocEvent/51-02-P51ICREQGETSTR.dart';
import '../model/model.dart';
import 'P51ICREQ/P51ICREQMAIN.dart';

class Page51 extends StatelessWidget {
  const Page51({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page51BlocTableBody();
  }
}

class Page51BlocTableBody extends StatelessWidget {
  const Page51BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P51ICREQGET_Bloc(),
        child: BlocBuilder<P51ICREQGET_Bloc, List<dataset>>(
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
        create: (_) => P51ICREQGETSTR_Bloc(),
        child: BlocBuilder<P51ICREQGETSTR_Bloc, String>(
          builder: (context, str) {
            return Page51Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page51Body extends StatelessWidget {
  Page51Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return P51ICREQMAIN(
      data: data,
      str: str,
    );
  }
}
