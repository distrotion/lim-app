import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/33-01-P32TOCBODYSTD.dart';
import '../bloc/BlocEvent/33-02-P32TOCBODYSTDGETSET.dart';
import '../bloc/BlocEvent/33-03-P32TOCBODYSTDgetgraph.dart';
import '../bloc/BlocEvent/33-GetTOCvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P33TOCBODYSTD/P32TOCBODYSTD.dart';

class Page33 extends StatelessWidget {
  const Page33({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page33BlocTableBody();
  }
}

class Page33BlocTableBody extends StatelessWidget {
  const Page33BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetTOCvalue_Bloc(),
        child: BlocBuilder<GetTOCvalue_Bloc, TOCDATAclass>(
          builder: (context, value) {
            return Page33BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page33BlocTableBodySET extends StatelessWidget {
  Page33BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  TOCDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P33TOCBODYSTD_Bloc(),
        child: BlocBuilder<P33TOCBODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page33BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page33BlocTableBodySETGETSET extends StatelessWidget {
  Page33BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  TOCDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P33TOCBODYSTDGETSET_Bloc(),
        child: BlocBuilder<P33TOCBODYSTDGETSET_Bloc, P33TOCBODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page33BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page33BlocTableBodygetgraph extends StatelessWidget {
  Page33BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  TOCDATAclass? value;
  String? status;
  P33TOCBODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P33TOCBODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P33TOCBODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page33Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page33Body extends StatelessWidget {
  Page33Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  TOCDATAclass? value;
  String? status;
  P33TOCBODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P33TOCBODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
