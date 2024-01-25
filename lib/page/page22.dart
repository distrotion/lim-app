import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-03-P2BALANCEBODYICPgetgraph.dart';

import '../bloc/BlocEvent/22-01-P22FFBODYSTD.dart';
import '../bloc/BlocEvent/22-02-P22FFBODYSTDGETSET.dart';
import '../bloc/BlocEvent/22-03-P22FFBODYSTDgetgraph.dart';
import '../bloc/BlocEvent/22-GetFFvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P22FFBODYSTD/P22FFBODYSTD.dart';

class Page22 extends StatelessWidget {
  const Page22({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page22BlocTableBody();
  }
}

class Page22BlocTableBody extends StatelessWidget {
  const Page22BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetFFvalue_Bloc(),
        child: BlocBuilder<GetFFvalue_Bloc, FFDATAclass>(
          builder: (context, value) {
            return Page22BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page22BlocTableBodySET extends StatelessWidget {
  Page22BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  FFDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P22FFBODYSTD_Bloc(),
        child: BlocBuilder<P22FFBODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page22BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page22BlocTableBodySETGETSET extends StatelessWidget {
  Page22BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  FFDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P22FFBODYSTDGETSET_Bloc(),
        child: BlocBuilder<P22FFBODYSTDGETSET_Bloc, P22FFBODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page22BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page22BlocTableBodygetgraph extends StatelessWidget {
  Page22BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  FFDATAclass? value;
  String? status;
  P22FFBODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P22FFBODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P22FFBODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page22Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page22Body extends StatelessWidget {
  Page22Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  FFDATAclass? value;
  String? status;
  P22FFBODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P22FFBODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
