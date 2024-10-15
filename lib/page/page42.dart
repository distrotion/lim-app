import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/42-01-P42XRFBODYSTD.dart';

import '../bloc/BlocEvent/42-02-P42XRFBODYSTDGETSET.dart';
import '../bloc/BlocEvent/42-03-P42XRFBODYSTDgetgraph.dart';
import '../bloc/BlocEvent/41-GetXRFvalue.dart';
import '../bloc/cubit/POP-searchHistoryChartData.dart';
import 'P42XRFBODYSTD/P42XRFBODYSTD.dart';

class Page42 extends StatelessWidget {
  const Page42({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page42BlocTableBody();
  }
}

class Page42BlocTableBody extends StatelessWidget {
  const Page42BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => GetXRFvalue_Bloc(),
        child: BlocBuilder<GetXRFvalue_Bloc, XRFDATAclass>(
          builder: (context, value) {
            return Page42BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page42BlocTableBodySET extends StatelessWidget {
  Page42BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  XRFDATAclass? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P42XRFBODYSTD_Bloc(),
        child: BlocBuilder<P42XRFBODYSTD_Bloc, String>(
          builder: (context, status) {
            return Page42BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page42BlocTableBodySETGETSET extends StatelessWidget {
  Page42BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  XRFDATAclass? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P42XRFBODYSTDGETSET_Bloc(),
        child: BlocBuilder<P42XRFBODYSTDGETSET_Bloc, P42XRFBODYSTDGETSETCLASS>(
          builder: (context, SET) {
            return Page42BlocTableBodygetgraph(
              value: value,
              SET: SET,
              status: status,
            );
          },
        ));
  }
}

class Page42BlocTableBodygetgraph extends StatelessWidget {
  Page42BlocTableBodygetgraph({
    Key? key,
    this.value,
    this.status,
    this.SET,
  }) : super(key: key);
  XRFDATAclass? value;
  String? status;
  P42XRFBODYSTDGETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P42XRFBODYSTDgetgraph_Bloc(),
        child: BlocBuilder<P42XRFBODYSTDgetgraph_Bloc, List<HistoryChartModel>>(
          builder: (context, historyChartDatain) {
            return Page42Body(
              value: value,
              SET: SET,
              historyChartDatain: historyChartDatain,
            );
          },
        ));
  }
}

class Page42Body extends StatelessWidget {
  Page42Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  }) : super(key: key);
  XRFDATAclass? value;
  String? status;
  P42XRFBODYSTDGETSETCLASS? SET;
  List<HistoryChartModel>? historyChartDatain;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P42XRFBODYSTD(
        value: value,
        SET: SET,
        status: status,
        historyChartDatain: historyChartDatain,
      ),
    );
  }
}
