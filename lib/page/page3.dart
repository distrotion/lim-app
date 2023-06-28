import 'package:flutter/material.dart';

import 'P3BALANCEBODYICP01/P3BALANCEBODYICP01.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page3Body();
  }
}

class Page3Body extends StatelessWidget {
  const Page3Body({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: P03BALANCEBODYICP01(),
    );
  }
}
