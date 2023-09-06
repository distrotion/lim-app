import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/BlocEvent/01-Getbalancevalue.dart';
import '../bloc/BlocEvent/02-01-P2BALANCEBODYICP01.dart';
import '../bloc/BlocEvent/02-02-P2BALANCEBODYICP01GETSET.dart';
import '../model/model.dart';
import 'P2BALANCEBODYCW01/P2BALANCEBODYCW01.dart';

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
        create: (_) => P2BALANCEBODYCW01_Bloc(),
        child: BlocBuilder<P2BALANCEBODYCW01_Bloc, String>(
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
        create: (_) => P2BALANCEBODYCW01GETSET_Bloc(),
        child: BlocBuilder<P2BALANCEBODYCW01GETSET_Bloc,
            P2BALANCEBODYCW01GETSETCLASS>(
          builder: (context, SET) {
            return Page2Body(
              value: value,
              SET: SET,
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
  }) : super(key: key);
  String? value;
  String? status;
  P2BALANCEBODYCW01GETSETCLASS? SET;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P02BALANCEBODYCW01(
        value: value,
        SET: SET,
        status: status,
      ),
    );
  }
}
