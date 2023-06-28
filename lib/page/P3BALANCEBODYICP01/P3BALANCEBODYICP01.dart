import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/ComInputText.dart';
import '../page1.dart';
import 'P3BALANCEBODY01ICPVAR.dart';

class P03BALANCEBODYICP01 extends StatefulWidget {
  const P03BALANCEBODYICP01({super.key});

  @override
  State<P03BALANCEBODYICP01> createState() => _P03BALANCEBODYICP01State();
}

class _P03BALANCEBODYICP01State extends State<P03BALANCEBODYICP01> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 800,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 300,
            height: 614,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  const SizedBox(
                    height: 60,
                    width: 300,
                    child: Center(
                      child: Text(
                        "BALANCE ICP 01 (TTC HES)",
                        style: TextStyle(fontSize: 28),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 15,
                    color: Colors.red,
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text("REQ NO : ${P3BALANCEBODY01ICPVAR.REQNO}"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("B01 : ${P3BALANCEBODY01ICPVAR.TYPE}"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("B02 : ${"B02"}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 15,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    height: 40,
                    // color: Colors.red,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text("preview"),
                        Container(
                          width: 150,
                          height: 40,
                          decoration: BoxDecoration(
                            // color: Colors.black,
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: Center(child: Text("2.5678")),
                        ),
                        InkWell(
                          onTap: () {
                            //
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            color: Colors.black,
                            child: const Icon(
                              Icons.cached,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //
                          },
                          child: Container(
                            height: 40,
                            width: 40,
                            color: Colors.black,
                            child: const Center(
                              child: Text(
                                "GET",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 95,
                                color: P3BALANCEBODY01ICPVAR.SEND == ''
                                    ? Colors.green
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("N1"),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              width: 95,
                              color: Colors.blue,
                              child: Center(
                                  child: Text(P3BALANCEBODY01ICPVAR.W11)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 95,
                                color: P3BALANCEBODY01ICPVAR.SEND == ''
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("BACK N1"),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            if (P3BALANCEBODY01ICPVAR.dip12 != '') ...[
                              Container(
                                height: 40,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "dip 1-2 : " + P3BALANCEBODY01ICPVAR.dip12,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                            if (P3BALANCEBODY01ICPVAR.dip13 != '') ...[
                              Container(
                                height: 40,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "dip 1-3 : " + P3BALANCEBODY01ICPVAR.dip13,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "dip 2-3 : " + P3BALANCEBODY01ICPVAR.dip23,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {},
                          child: Container(
                            height: P3BALANCEBODY01ICPVAR.dip13 != ''
                                ? 120
                                : P3BALANCEBODY01ICPVAR.dip12 != ''
                                    ? 40
                                    : 0,
                            color: Colors.amber,
                            child: const Center(
                              child: Text(
                                "RECAL",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 62,
                          color: Colors.blue.shade300,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Center(child: Text('SPEC')),
                              if (P3BALANCEBODY01ICPVAR.SPEChi != '')
                                Center(
                                    child: Text(
                                        'MAX:' + P3BALANCEBODY01ICPVAR.SPEChi)),
                              if (P3BALANCEBODY01ICPVAR.SPEClow != '')
                                Center(
                                    child: Text('MIN:' +
                                        P3BALANCEBODY01ICPVAR.SPEClow)),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          height: 62,
                          color: Colors.lightGreen,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 5,
                              ),
                              const Center(child: Text('RESULT')),
                              Center(child: Text(P3BALANCEBODY01ICPVAR.Result)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 62,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          "SEND DATA TO SAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 62,
                      color: Colors.orange,
                      child: const Center(
                        child: Text(
                          "CLEAR",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      CuPage = Page1();
                      MainBodyContext.read<ChangePage_Bloc>()
                          .add(ChangePage_nodrower());
                    },
                    child: Container(
                      height: 62,
                      color: Colors.black,
                      child: const Center(
                        child: Text(
                          "CLEAR PAGE",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 30,
                      color: Colors.redAccent,
                      child: const Center(
                        child: Text(
                          "REJECT",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 614,
            width: 480,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: const BorderRadius.all(Radius.circular(0)),
            ),
          )
        ],
      ),
    );
  }
}
