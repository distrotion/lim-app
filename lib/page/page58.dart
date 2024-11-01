import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/57-GetUVvalue.dart';
import '../bloc/BlocEvent/58-01-P58OCABODYSTD.dart';
import '../bloc/BlocEvent/58-02-P58OCABODYSTDGETSET.dart';
import '../bloc/BlocEvent/58-03-P58OCABODYSTDgetgraph.dart';
import '../bloc/BlocEvent/58-GetOCAvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P58OCABODYSTD/P58OCABODYSTD.dart';

class Page58 extends StatelessWidget {
  const Page58({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page58BlocTableBody();
  }
}

class Page58BlocTableBody extends StatelessWidget {
  const Page58BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetOCAvalue_Bloc(),
        child: BlocBuilder<GetOCAvalue_Bloc, OCADATAclass>(
          builder: (context, value) {
            return Page58BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page58BlocTableBodySET extends StatelessWidget {
  Page58BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  OCADATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P58OCABODYSTD_Bloc(),
        child: BlocBuilder<P58OCABODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page58BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page58BlocTableBodySETGETSET extends StatelessWidget {
  Page58BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  OCADATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P58OCABODYSTDGETSET_Bloc(),
        child: BlocBuilder<P58OCABODYSTDGETSET_Bloc, P58OCABODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page58BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page58BlocTableBodygetgraph extends StatelessWidget {
  Page58BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  OCADATAclass? value;
  String? status;
  P58OCABODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P58OCABODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P58OCABODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page58Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page58Body extends StatelessWidget {
  Page58Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  OCADATAclass? value;
  String? status;
  P58OCABODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P58OCABODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
