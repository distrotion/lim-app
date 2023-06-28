import 'package:flutter/material.dart';

import 'P2BALANCEBODYCW01/P2BALANCEBODYCW01.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page2Body();
    ;
  }
}

class Page2Body extends StatelessWidget {
  const Page2Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: P02BALANCEBODYCW01(),
    );
  }
}
