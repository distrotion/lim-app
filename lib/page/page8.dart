import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';

import '../bloc/BlocEvent/08-01-P8BALANCEBODYSSM.dart';
import '../bloc/BlocEvent/08-02-P8BALANCEBODYSSMGETSET.dart';
import '../bloc/BlocEvent/08-03-P8BALANCEBODYSSMgetgraph.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P8BALANCEBODYSSM/P8BALANCEBODYSSM.dart';

class Page8 extends StatelessWidget {
  const Page8({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page8BlocTableBody();
  }
}

class Page8BlocTableBody extends StatelessWidget {
  const Page8BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Getbalancevalue_Bloc(),
        child: BlocBuilder<Getbalancevalue_Bloc, String>(
          builder: (context, value) {
            return Page8BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page8BlocTableBodySET extends StatelessWidget {
  Page8BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P8BALANCEBODYSSM_Bloc(),
        child: BlocBuilder<P8BALANCEBODYSSM_Bloc, String>(
          builder: (context, status) {
            return Page8BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page8BlocTableBodySETGETSET extends StatelessWidget {
  Page8BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P8BALANCEBODYSSMGETSET_Bloc(),
        child: BlocBuilder<P8BALANCEBODYSSMGETSET_Bloc,
            P8BALANCEBODYSSMGETSETCLASS>(
          builder: (context, SET) {
            return Page8BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page8BlocTableBodygetgraph extends StatelessWidget {
  Page8BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  String? value;
  String? status;
  P8BALANCEBODYSSMGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P8BALANCEBODYSSMgetgraph_Bloc(),
        child:
            BlocBuilder<P8BALANCEBODYSSMgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page8Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page8Body extends StatelessWidget {
  Page8Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  String? value;
  String? status;
  P8BALANCEBODYSSMGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P8BALANCEBODYSSM(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
