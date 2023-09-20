import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';
import '../bloc/BlocEvent/02-01-P2BALANCEBODYCW.dart';
import '../bloc/BlocEvent/02-02-P2BALANCEBODYCWGETSET.dart';
import '../bloc/BlocEvent/02-03-P2BALANCEBODYCWgetgraph.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import '../model/model.dart';
import 'P2BALANCEBODYCW/P2BALANCEBODYCW.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2BlocTableBody();
  }
}

class Page2BlocTableBody extends StatelessWidget {
  const Page2BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Getbalancevalue_Bloc(),
        child: BlocBuilder<Getbalancevalue_Bloc, String>(
          builder: (context, value) {
            return Page2BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page2BlocTableBodySET extends StatelessWidget {
  Page2BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P2BALANCEBODYCW_Bloc(),
        child: BlocBuilder<P2BALANCEBODYCW_Bloc, String>(
          builder: (context, status) {
            return Page2BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page2BlocTableBodySETGETSET extends StatelessWidget {
  Page2BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P2BALANCEBODYCWGETSET_Bloc(),
        child:
            BlocBuilder<P2BALANCEBODYCWGETSET_Bloc, P2BALANCEBODYCWGETSETCLASS>(
          builder: (context, SET) {
            return Page2BlocTableBodygetgraph(
              value: value,
              SET: SET,
            );
          },
        ));
  }
}

//P2BALANCEBODYCW01getgraph_Bloc

class Page2BlocTableBodygetgraph extends StatelessWidget {
  Page2BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  String? value;
  String? status;
  P2BALANCEBODYCWGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P2BALANCEBODYCWgetgraph_Bloc(),
        child:
            BlocBuilder<P2BALANCEBODYCWgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page2Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page2Body extends StatelessWidget {
  Page2Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  String? value;
  String? status;
  P2BALANCEBODYCWGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P02BALANCEBODYCW(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
