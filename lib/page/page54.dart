import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/54-01-P54ICS8100BODYSTD.dart';
import '../bloc/BlocEvent/54-02-P54ICS8100BODYSTDGETSET.dart';
import '../bloc/BlocEvent/54-03-P54ICS8100BODYSTDgetgraph.dart';
import '../bloc/BlocEvent/54-GetICS8100value.dart';
import '../bloc/BlocEvent/57-GetUVvalue.dart';

import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P54ICS8100BODYSTD/P54ICS8100BODYSTD.dart';

class Page54 extends StatelessWidget {
  const Page54({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page54BlocTableBody();
  }
}

class Page54BlocTableBody extends StatelessWidget {
  const Page54BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetICS8100value_Bloc(),
        child: BlocBuilder<GetICS8100value_Bloc, ICS8100DATAclass>(
          builder: (context, value) {
            return Page54BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page54BlocTableBodySET extends StatelessWidget {
  Page54BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  ICS8100DATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P54ICS8100BODYSTD_Bloc(),
        child: BlocBuilder<P54ICS8100BODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page54BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page54BlocTableBodySETGETSET extends StatelessWidget {
  Page54BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  ICS8100DATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P54ICS8100BODYSTDGETSET_Bloc(),
        child: BlocBuilder<P54ICS8100BODYSTDGETSET_Bloc,
            P54ICS8100BODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page54BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page54BlocTableBodygetgraph extends StatelessWidget {
  Page54BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  ICS8100DATAclass? value;
  String? status;
  P54ICS8100BODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P54ICS8100BODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P54ICS8100BODYSTDgetgraph_Bloc,
            List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page54Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page54Body extends StatelessWidget {
  Page54Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  ICS8100DATAclass? value;
  String? status;
  P54ICS8100BODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P54ICS8100BODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
