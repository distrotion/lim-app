import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/57-01-P57UVBODYSTD.dart';
import '../bloc/BlocEvent/57-02-P57UVBODYSTDGETSET.dart';
import '../bloc/BlocEvent/57-03-P57UVBODYSTDgetgraph.dart';
import '../bloc/BlocEvent/57-GetUVvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P57UVBODYSTD/P57UVBODYSTD.dart';

class Page57 extends StatelessWidget {
  const Page57({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page57BlocTableBody();
  }
}

class Page57BlocTableBody extends StatelessWidget {
  const Page57BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetUVvalue_Bloc(),
        child: BlocBuilder<GetUVvalue_Bloc, UVDATAclass>(
          builder: (context, value) {
            return Page57BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page57BlocTableBodySET extends StatelessWidget {
  Page57BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  UVDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P57UVBODYSTD_Bloc(),
        child: BlocBuilder<P57UVBODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page57BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page57BlocTableBodySETGETSET extends StatelessWidget {
  Page57BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  UVDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P57UVBODYSTDGETSET_Bloc(),
        child: BlocBuilder<P57UVBODYSTDGETSET_Bloc, P57UVBODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page57BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page57BlocTableBodygetgraph extends StatelessWidget {
  Page57BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  UVDATAclass? value;
  String? status;
  P57UVBODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P57UVBODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P57UVBODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page57Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page57Body extends StatelessWidget {
  Page57Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  UVDATAclass? value;
  String? status;
  P57UVBODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P57UVBODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
