import 'package:flutter/material.dart';

import '../../data/dummydata.dart';
import 'TABLE/P1BALANCEREQ01TABLE.dart';

class P1BALANCEREQ01MAIN extends StatelessWidget {
  const P1BALANCEREQ01MAIN({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1024,
      height: 614,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: const BorderRadius.all(Radius.circular(0)),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 2, bottom: 1, start: 2, end: 2),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                child: const Center(
                  child: SizedBox(
                    height: 60,
                    width: 300,
                    child: Center(
                      child: Text(
                        "BALANCE 01 (TTC HES)",
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsetsDirectional.only(
                  top: 1, bottom: 2, start: 2, end: 1),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: const BorderRadius.all(Radius.circular(0)),
                ),
                child: P1BALANCEREQ01TABLE(sardata: testdata),
              ),
            ),
          )
        ],
      ),
    );
  }
}
