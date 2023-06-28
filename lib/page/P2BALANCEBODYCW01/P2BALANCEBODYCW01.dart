import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/ComInputText.dart';
import '../page1.dart';
import 'P2BALANCEBODY01CWVAR.dart';

class P02BALANCEBODYCW01 extends StatefulWidget {
  const P02BALANCEBODYCW01({super.key});

  @override
  State<P02BALANCEBODYCW01> createState() => _P02BALANCEBODYCW01State();
}

class _P02BALANCEBODYCW01State extends State<P02BALANCEBODYCW01> {
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
                        "BALANCE CW 01 (TTC HES)",
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
                            Text("REQ NO : ${P2BALANCEBODY01CWVAR.REQNO}"),
                          ],
                        ),
                        Row(
                          children: [
                            Text("B01 : ${P2BALANCEBODY01CWVAR.TYPE}"),
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
                          child: Center(child: Text("1.1234")),
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
                                color: P2BALANCEBODY01CWVAR.SEND == ''
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
                              child:
                                  Center(child: Text(P2BALANCEBODY01CWVAR.W11)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 95,
                                color: P2BALANCEBODY01CWVAR.SEND == ''
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("CLEAR N1"),
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
                                color: P2BALANCEBODY01CWVAR.SEND == ''
                                    ? Colors.green
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("N2"),
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
                              child:
                                  Center(child: Text(P2BALANCEBODY01CWVAR.W11)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: 40,
                                width: 95,
                                color: P2BALANCEBODY01CWVAR.SEND == ''
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("CLEAR N2"),
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
                            if (P2BALANCEBODY01CWVAR.dip12 != '') ...[
                              Container(
                                height: 40,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "dip 1-2 : " + P2BALANCEBODY01CWVAR.dip12,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                            if (P2BALANCEBODY01CWVAR.dip13 != '') ...[
                              Container(
                                height: 40,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "dip 1-3 : " + P2BALANCEBODY01CWVAR.dip13,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              Container(
                                height: 40,
                                color: Colors.green,
                                child: Center(
                                  child: Text(
                                    "dip 2-3 : " + P2BALANCEBODY01CWVAR.dip23,
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
                            height: P2BALANCEBODY01CWVAR.dip13 != ''
                                ? 120
                                : P2BALANCEBODY01CWVAR.dip12 != ''
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
                              const Center(child: Text('AREA')),
                              if (P2BALANCEBODY01CWVAR.SPEChi != '')
                                Center(
                                    child: Text(
                                        'MAX:' + P2BALANCEBODY01CWVAR.SPEChi)),
                              if (P2BALANCEBODY01CWVAR.SPEClow != '')
                                Center(
                                    child: Text(
                                        'MIN:' + P2BALANCEBODY01CWVAR.SPEClow)),
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
                              Center(child: Text(P2BALANCEBODY01CWVAR.Result)),
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
                      color: Colors.orange,
                      child: const Center(
                        child: Text(
                          "TEMP SAVE",
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
                          "BACK PAGE",
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
