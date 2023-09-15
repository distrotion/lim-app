import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';
import '../bloc/BlocEvent/04-01-P4BALANCEBODYSLUDGE.dart';
import '../bloc/BlocEvent/04-02-P4BALANCEBODYSLUDGEGETSET.dart';
import '../bloc/BlocEvent/04-03-P4BALANCEBODYSLUDGEgetgraph.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P4BALANCEBODYSLUDGE/P4BALANCEBODYSLUDGEmain.dart';

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page4BlocTableBody();
  }
}

class Page4BlocTableBody extends StatelessWidget {
  const Page4BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Getbalancevalue_Bloc(),
        child: BlocBuilder<Getbalancevalue_Bloc, String>(
          builder: (context, value) {
            return Page4BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page4BlocTableBodySET extends StatelessWidget {
  Page4BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P4BALANCEBODYSLUDGE_Bloc(),
        child: BlocBuilder<P4BALANCEBODYSLUDGE_Bloc, String>(
          builder: (context, status) {
            return Page4BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page4BlocTableBodySETGETSET extends StatelessWidget {
  Page4BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P4BALANCEBODYSLUDGEGETSET_Bloc(),
        child: BlocBuilder<P4BALANCEBODYSLUDGEGETSET_Bloc,
            P4BALANCEBODYSLUDGEGETSETCLASS>(
          builder: (context, SET) {
            return Page4BlocTableBodygetgraph(
              value: value,
              SET: SET,
            );
          },
        ));
  }
}

//P2BALANCEBODYICP01getgraph_Bloc

class Page4BlocTableBodygetgraph extends StatelessWidget {
  Page4BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  String? value;
  String? status;
  P4BALANCEBODYSLUDGEGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P4BALANCEBODYSLUDGEgetgraph_Bloc(),
        child: BlocBuilder<P4BALANCEBODYSLUDGEgetgraph_Bloc,
            List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page4Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page4Body extends StatelessWidget {
  Page4Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  String? value;
  String? status;
  P4BALANCEBODYSLUDGEGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P4BALANCEBODYSLUDGE(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
