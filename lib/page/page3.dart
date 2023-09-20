import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';

import '../bloc/BlocEvent/03-01-P3BALANCEBODYICP.dart';
import '../bloc/BlocEvent/03-02-P3BALANCEBODYICPGETSET.dart';
import 'P3BALANCEBODYICP/P3BALANCEBODYICP.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3BlocTableBody();
  }
}

class Page3BlocTableBody extends StatelessWidget {
  const Page3BlocTableBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => Getbalancevalue_Bloc(),
        child: BlocBuilder<Getbalancevalue_Bloc, String>(
          builder: (context, value) {
            return Page3BlocTableBodySET(
              value: value,
            );
          },
        ));
  }
}

class Page3BlocTableBodySET extends StatelessWidget {
  Page3BlocTableBodySET({
    Key? key,
    this.value,
  }) : super(key: key);
  String? value;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P3BALANCEBODYICP_Bloc(),
        child: BlocBuilder<P3BALANCEBODYICP_Bloc, String>(
          builder: (context, status) {
            return Page3BlocTableBodySETGETSET(
              value: value,
              status: status,
            );
          },
        ));
  }
}

class Page3BlocTableBodySETGETSET extends StatelessWidget {
  Page3BlocTableBodySETGETSET({
    Key? key,
    this.value,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P3BALANCEBODYICPGETSET_Bloc(),
        child: BlocBuilder<P3BALANCEBODYICPGETSET_Bloc,
            P3BALANCEBODYICPGETSETCLASS>(
          builder: (context, SET) {
            return Page3Body(
              value: value,
              SET: SET,
            );
          },
        ));
  }
}

class Page3Body extends StatelessWidget {
  Page3Body({
    Key? key,
    this.value,
    this.SET,
    this.status,
  }) : super(key: key);
  String? value;
  String? status;
  P3BALANCEBODYICPGETSETCLASS? SET;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P03BALANCEBODYICP(
        value: value,
        SET: SET,
        status: status,
      ),
    );
  }
}
