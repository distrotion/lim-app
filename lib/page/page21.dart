import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/21-01-P11FFGETDATA.dart';
import '../bloc/BlocEvent/21-02-P21FFREQGETSTR.dart';
import '../model/model.dart';
import 'P21FFREQ/P21FFREQMAIN.dart';

class Page21 extends StatelessWidget {
  const Page21({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page21BlocTableBody();
  }
}

class Page21BlocTableBody extends StatelessWidget {
  const Page21BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P21FFREQGET_Bloc(),
        child: BlocBuilder<P21FFREQGET_Bloc, List<dataset>>(
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
        create: (_) => P21FFREQGETSTR_Bloc(),
        child: BlocBuilder<P21FFREQGETSTR_Bloc, String>(
          builder: (context, str) {
            return Page21Body(
              data: data,
              str: str,
            );
          },
        ));
  }
}

class Page21Body extends StatelessWidget {
  Page21Body({
    Key? key,
    this.data,
    this.str,
  }) : super(key: key);
  List<dataset>? data;
  String? str;
  @override
  Widget build(BuildContext context) {
    return P21FFREQMAIN(
      data: data,
      str: str,
    );
  }
}
