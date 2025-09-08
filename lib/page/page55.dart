import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/55-01-P55ICS2100BODYSTD.dart';
import '../bloc/BlocEvent/55-02-P55ICS2100BODYSTDGETSET.dart';
import '../bloc/BlocEvent/55-03-P55ICS2100BODYSTDgetgraph.dart';
import '../bloc/BlocEvent/55-GetICS2100value copy.dart';
import '../bloc/BlocEvent/57-GetUVvalue.dart';

import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P55ICS2100BODYSTD/P55ICS2100BODYSTD.dart';

class Page55 extends StatelessWidget {
  const Page55({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page55BlocTableBody();
  }
}

class Page55BlocTableBody extends StatelessWidget {
  const Page55BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetICS2100value_Bloc(),
        child: BlocBuilder<GetICS2100value_Bloc, ICS2000DATAclass>(
          builder: (context, value) {
            return Page55BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page55BlocTableBodySET extends StatelessWidget {
  Page55BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  ICS2000DATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P55ICS2100BODYSTD_Bloc(),
        child: BlocBuilder<P55ICS2100BODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page55BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page55BlocTableBodySETGETSET extends StatelessWidget {
  Page55BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  ICS2000DATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P55ICS2100BODYSTDGETSET_Bloc(),
        child: BlocBuilder<P55ICS2100BODYSTDGETSET_Bloc, P55ICS2100BODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page55BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page55BlocTableBodygetgraph extends StatelessWidget {
  Page55BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  ICS2000DATAclass? value;
  String? status;
  P55ICS2100BODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P55ICS2100BODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P55ICS2100BODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page55Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page55Body extends StatelessWidget {
  Page55Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  ICS2000DATAclass? value;
  String? status;
  P55ICS2100BODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P55ICS2100BODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
