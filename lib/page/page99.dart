// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/BlocEvent/99-01-P99SELECTINSBP12MAIN.dart';
import 'P99SELECTINSBP12/P99SELECTINSBP12MAIN.dart';

//---------------------------------------------------------

class Page99 extends StatelessWidget {
  const Page99({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page99blockget();
  }
}

class Page99blockget extends StatelessWidget {
  const Page99blockget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => P99SELECTINSBP12MAIN_Bloc(),
        child: BlocBuilder<P99SELECTINSBP12MAIN_Bloc,
            List<P99SELECTINSBP12MAINclass>>(
          builder: (context, data) {
            return Page99Body(
              data: data,
            );
          },
        ));
  }
}

class Page99Body extends StatelessWidget {
  Page99Body({
    super.key,
    this.data,
  });
  List<P99SELECTINSBP12MAINclass>? data;
  @override
  Widget build(BuildContext context) {
    return P99SELECTINSBP12MAIN(
      data: data,
    );
  }
}
