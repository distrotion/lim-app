import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/41-GetXRFvalue.dart';
import '../bloc/BlocEvent/52-01-P52IC01BODYSTD.dart';
import '../bloc/BlocEvent/52-02-P52IC01BODYSTDGETSET.dart';
import '../bloc/BlocEvent/52-03-P52IC01BODYSTDgetgraph.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P52IC01BODYSTD/P52IC01BODYSTD.dart';

class Page52 extends StatelessWidget {
  const Page52({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page52BlocTableBody();
  }
}

class Page52BlocTableBody extends StatelessWidget {
  const Page52BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetXRFvalue_Bloc(),
        child: BlocBuilder<GetXRFvalue_Bloc, XRFDATAclass>(
          builder: (context, value) {
            return Page52BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page52BlocTableBodySET extends StatelessWidget {
  Page52BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  XRFDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P52IC01BODYSTD_Bloc(),
        child: BlocBuilder<P52IC01BODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page52BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page52BlocTableBodySETGETSET extends StatelessWidget {
  Page52BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  XRFDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P52IC01BODYSTDGETSET_Bloc(),
        child:
            BlocBuilder<P52IC01BODYSTDGETSET_Bloc, P52IC01BODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page52BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page52BlocTableBodygetgraph extends StatelessWidget {
  Page52BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  XRFDATAclass? value;
  String? status;
  P52IC01BODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P52IC01BODYSTDgetgraph_Bloc(),
        child:
            BlocBuilder<P52IC01BODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page52Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page52Body extends StatelessWidget {
  Page52Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  XRFDATAclass? value;
  String? status;
  P52IC01BODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P52IC01BODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
