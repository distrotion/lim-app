import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';

import '../bloc/BlocEvent/07-01-P7BALANCEBODYACID.dart';
import '../bloc/BlocEvent/07-02-P7BALANCEBODYACIDGETSET.dart';
import '../bloc/BlocEvent/07-03-P7BALANCEBODYACIDgetgraph.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P7BALANCEBODYACID/P7BALANCEBODYACID.dart';

class Page7 extends StatelessWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page7BlocTableBody();
  }
}

class Page7BlocTableBody extends StatelessWidget {
  const Page7BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Getbalancevalue_Bloc(),
        child: BlocBuilder<Getbalancevalue_Bloc, String>(
          builder: (context, value) {
            return Page7BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page7BlocTableBodySET extends StatelessWidget {
  Page7BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P7BALANCEBODYACID_Bloc(),
        child: BlocBuilder<P7BALANCEBODYACID_Bloc, String>(
          builder: (context, status) {
            return Page7BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page7BlocTableBodySETGETSET extends StatelessWidget {
  Page7BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P7BALANCEBODYACIDGETSET_Bloc(),
        child: BlocBuilder<P7BALANCEBODYACIDGETSET_Bloc,
            P7BALANCEBODYACIDGETSETCLASS>(
          builder: (context, SET) {
            return Page7BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page7BlocTableBodygetgraph extends StatelessWidget {
  Page7BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  String? value;
  String? status;
  P7BALANCEBODYACIDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P7BALANCEBODYACIDgetgraph_Bloc(),
        child: BlocBuilder<P7BALANCEBODYACIDgetgraph_Bloc,
            List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page7Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page7Body extends StatelessWidget {
  Page7Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  String? value;
  String? status;
  P7BALANCEBODYACIDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P7BALANCEBODYACID(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
