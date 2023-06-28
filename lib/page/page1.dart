import 'package:flutter/material.dart';

import 'P1BALANCEREQ01/P1BALANCEREQ01MAIN.dart';

//---------------------------------------------------------

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page1Body();
  }
}

class Page1Body extends StatelessWidget {
  const Page1Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P1BALANCEREQ01MAIN(),
    );
  }
}
