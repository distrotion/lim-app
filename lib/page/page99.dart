import 'package:flutter/material.dart';

import 'P99SELECTINS/P99SELECTINSMAIN.dart';

class Page99 extends StatelessWidget {
  const Page99({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page99Body();
  }
}

class Page99Body extends StatelessWidget {
  const Page99Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return P99SELECTINSMAIN();
  }
}
