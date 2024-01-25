import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-03-P2BALANCEBODYICPgetgraph.dart';
import '../bloc/BlocEvent/12-01-P12PHBODYSTD.dart';
import '../bloc/BlocEvent/12-02-P12PHBODYSTDGETSET.dart';
import '../bloc/BlocEvent/12-03-P12PHBODYSTDgetgraph.dart';
import '../bloc/BlocEvent/12-GetPHvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P12PHBODYSTD/P12PHBODYSTD.dart';

class Page12 extends StatelessWidget {
  const Page12({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page12BlocTableBody();
  }
}

class Page12BlocTableBody extends StatelessWidget {
  const Page12BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetPHvalue_Bloc(),
        child: BlocBuilder<GetPHvalue_Bloc, PHDATAclass>(
          builder: (context, value) {
            return Page12BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page12BlocTableBodySET extends StatelessWidget {
  Page12BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  PHDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P12PHBODYSTD_Bloc(),
        child: BlocBuilder<P12PHBODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page12BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page12BlocTableBodySETGETSET extends StatelessWidget {
  Page12BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  PHDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P12PHBODYSTDGETSET_Bloc(),
        child: BlocBuilder<P12PHBODYSTDGETSET_Bloc, P12PHBODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page12BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page12BlocTableBodygetgraph extends StatelessWidget {
  Page12BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  PHDATAclass? value;
  String? status;
  P12PHBODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P12PHBODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P12PHBODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page12Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page12Body extends StatelessWidget {
  Page12Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  PHDATAclass? value;
  String? status;
  P12PHBODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P12PHBODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
