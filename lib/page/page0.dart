import 'package:flutter/material.dart';
import 'package:lim_app/page/page99.dart';

import '../data/global.dart';
import 'TEST.dart';
import 'page1.dart';
import 'page100.dart';
import 'page12.dart';
import 'page2.dart';
import 'page3.dart';
import 'page32.dart';
import 'page5.dart';
import 'page7.dart';

bool isChecked = false;

class Page0 extends StatelessWidget {
  const Page0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Page0Body();

    // return Page7();
  }
}

class Page0Body extends StatelessWidget {
  const Page0Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (USERDATA.Branch == 'BANGPOO') {
      return Page99();
      // return Page3();
    } else {
      return Page100();
    }
  }
}


// USERDATA.INSMASTER = '';