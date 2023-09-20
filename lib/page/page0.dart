import 'package:flutter/material.dart';
import 'package:lim_app/page/page99.dart';

import '../data/global.dart';
import 'TEST.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page0Body();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (USERDATA.INSMASTER == '') {
      return Page99();
    } else {
      return Page99();
    }
  }
}


// USERDATA.INSMASTER = '';