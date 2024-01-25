import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/11-01-P11PHGETDATA.dart';
import '../bloc/BlocEvent/11-02-P11PHREQGETSTR.dart';
import '../model/model.dart';
import 'P11PHREQ/P11PHREQMAIN.dart';

class Page11 extends StatelessWidget {
  const Page11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page11BlocTableBody();
  }
}

class Page11BlocTableBody extends StatelessWidget {
  const Page11BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P11PHREQGET_Bloc(),
        child: BlocBuilder<P11PHREQGET_Bloc, List<dataset>>(
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
        create: (_) => P11PHREQGETSTR_Bloc(),
        child: BlocBuilder<P11PHREQGETSTR_Bloc, String>(
          builder: (context, str) {
            return Page11Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page11Body extends StatelessWidget {
  Page11Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return P11PHREQMAIN(
      data: data,
      str: str,
    );
  }
}
