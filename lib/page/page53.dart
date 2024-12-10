import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/53-01-P53ICS2000BODYSTD.dart';
import '../bloc/BlocEvent/53-02-P53ICS2000BODYSTDGETSET.dart';
import '../bloc/BlocEvent/53-03-P53ICS2000BODYSTDgetgraph.dart';
import '../bloc/BlocEvent/53-GetICS2000value copy.dart';
import '../bloc/BlocEvent/57-GetUVvalue.dart';

import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P53ICS2000BODYSTD/P53ICS2000BODYSTD.dart';

class Page53 extends StatelessWidget {
  const Page53({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page53BlocTableBody();
  }
}

class Page53BlocTableBody extends StatelessWidget {
  const Page53BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetICS2000value_Bloc(),
        child: BlocBuilder<GetICS2000value_Bloc, ICS2000DATAclass>(
          builder: (context, value) {
            return Page53BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page53BlocTableBodySET extends StatelessWidget {
  Page53BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  ICS2000DATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P53ICS2000BODYSTD_Bloc(),
        child: BlocBuilder<P53ICS2000BODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page53BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page53BlocTableBodySETGETSET extends StatelessWidget {
  Page53BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  ICS2000DATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P53ICS2000BODYSTDGETSET_Bloc(),
        child: BlocBuilder<P53ICS2000BODYSTDGETSET_Bloc,
            P53ICS2000BODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page53BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page53BlocTableBodygetgraph extends StatelessWidget {
  Page53BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  ICS2000DATAclass? value;
  String? status;
  P53ICS2000BODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P53ICS2000BODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P53ICS2000BODYSTDgetgraph_Bloc,
            List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page53Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page53Body extends StatelessWidget {
  Page53Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  ICS2000DATAclass? value;
  String? status;
  P53ICS2000BODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P53ICS2000BODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
