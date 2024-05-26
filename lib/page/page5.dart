import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';
import '../bloc/BlocEvent/05-01-P5BALANCEBODYCW3L.dart';
import '../bloc/BlocEvent/05-02-P5BALANCEBODYCW3LGETSET.dart';
import '../bloc/BlocEvent/05-03-P2BALANCEBODYCW3Lgetgraph.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P5BALANCEBODYCW3L/P5BALANCEBODYCW3L.dart';

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page5BlocTableBody();
  }
}

class Page5BlocTableBody extends StatelessWidget {
  const Page5BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Getbalancevalue_Bloc(),
        child: BlocBuilder<Getbalancevalue_Bloc, String>(
          builder: (context, value) {
            return Page5BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page5BlocTableBodySET extends StatelessWidget {
  Page5BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P5BALANCEBODYCW3L_Bloc(),
        child: BlocBuilder<P5BALANCEBODYCW3L_Bloc, String>(
          builder: (context, status) {
            return Page5BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page5BlocTableBodySETGETSET extends StatelessWidget {
  Page5BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P5BALANCEBODYCW3LGETSET_Bloc(),
        child: BlocBuilder<P5BALANCEBODYCW3LGETSET_Bloc,
            P5BALANCEBODYCW3LGETSETCLASS>(
          builder: (context, SET) {
            return Page5BlocTableBodygetgraph(
              value: value,
              SET: SET,
            );
          },
        ));
  }
}

//P2BALANCEBODYCW01getgraph_Bloc

class Page5BlocTableBodygetgraph extends StatelessWidget {
  Page5BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  String? value;
  String? status;
  P5BALANCEBODYCW3LGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P5BALANCEBODYCW3Lgetgraph_Bloc(),
        child: BlocBuilder<P5BALANCEBODYCW3Lgetgraph_Bloc,
            List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page5Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page5Body extends StatelessWidget {
  Page5Body({
    Key? key,
    this.value,
    this.status,
    this.SET,
    this.historyChartDatain,
  }) : super(key: key);
  String? value;
  String? status;
  P5BALANCEBODYCW3LGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: P5BALANCEBODYCW3L(
      value: value,
      SET: SET,
      historyChartDatain: historyChartDatain,
    ));
  }
}
