import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/03-03-P2BALANCEBODYICPgetgraph.dart';

import '../bloc/BlocEvent/32-01-P32ICPBODYSTD.dart';
import '../bloc/BlocEvent/32-02-P32ICPBODYSTDGETSET.dart';
import '../bloc/BlocEvent/32-03-P32ICPBODYSTDgetgraph.dart';
import '../bloc/BlocEvent/32-GetICPvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P32ICPBODYSTD/P32ICPBODYSTD.dart';

class Page32 extends StatelessWidget {
  const Page32({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page32BlocTableBody();
  }
}

class Page32BlocTableBody extends StatelessWidget {
  const Page32BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetICPvalue_Bloc(),
        child: BlocBuilder<GetICPvalue_Bloc, ICPDATAclass>(
          builder: (context, value) {
            return Page32BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page32BlocTableBodySET extends StatelessWidget {
  Page32BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  ICPDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P32ICPBODYSTD_Bloc(),
        child: BlocBuilder<P32ICPBODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page32BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page32BlocTableBodySETGETSET extends StatelessWidget {
  Page32BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  ICPDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P32ICPBODYSTDGETSET_Bloc(),
        child: BlocBuilder<P32ICPBODYSTDGETSET_Bloc, P32ICPBODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page32BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page32BlocTableBodygetgraph extends StatelessWidget {
  Page32BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  ICPDATAclass? value;
  String? status;
  P32ICPBODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P32ICPBODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P32ICPBODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page32Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page32Body extends StatelessWidget {
  Page32Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  ICPDATAclass? value;
  String? status;
  P32ICPBODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P32ICPBODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
