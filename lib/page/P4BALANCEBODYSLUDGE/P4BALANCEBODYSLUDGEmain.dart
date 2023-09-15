import 'package:dio/dio.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/01-Getbalancevalue.dart';

import '../../bloc/BlocEvent/04-02-P4BALANCEBODYSLUDGEGETSET.dart';
import '../../bloc/BlocEvent/04-03-P4BALANCEBODYSLUDGEgetgraph.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../bloc/cubit/POP-searchHistoryChartData.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../../widget/common/Safty.dart';

import '../page1.dart';
import 'P4BALANCEBODYSLUDGEVAR.dart';

late BuildContext P4BALANCEBODYSLUDGEcontext;

class P4BALANCEBODYSLUDGE extends StatefulWidget {
  P4BALANCEBODYSLUDGE({
    super.key,
    this.value,
    this.SET,
    this.status,
    this.historyChartDatain,
  });
  String? value;
  P4BALANCEBODYSLUDGEGETSETCLASS? SET;
  String? status;
  List<HistoryChartModel>? historyChartDatain;

  @override
  State<P4BALANCEBODYSLUDGE> createState() => _P4BALANCEBODYSLUDGEState();
}

class _P4BALANCEBODYSLUDGEState extends State<P4BALANCEBODYSLUDGE> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Getbalancevalue_Bloc>().add(Getbalancevalue_Get());
    context
        .read<P4BALANCEBODYSLUDGEGETSET_Bloc>()
        .add(P4BALANCEBODYSLUDGEGETSET_GET());
    P4BALANCEBODYSLUDGEVAR.area = '';
    P4BALANCEBODYSLUDGEVAR.Result = '';
    P4BALANCEBODYSLUDGEVAR.mem = 'GO';
  }

  @override
  Widget build(BuildContext context) {
    P4BALANCEBODYSLUDGEcontext = context;

    P4BALANCEBODYSLUDGEVAR.value = widget.value ?? '';
    P4BALANCEBODYSLUDGEGETSETCLASS dataset =
        widget.SET ?? P4BALANCEBODYSLUDGEGETSETCLASS();

    P4BALANCEBODYSLUDGEVAR.ReqNo = dataset.ReqNo;
    P4BALANCEBODYSLUDGEVAR.InstrumentName = dataset.InstrumentName;
    P4BALANCEBODYSLUDGEVAR.CustFull = dataset.CustShort;
    P4BALANCEBODYSLUDGEVAR.UID = dataset.UID;
    P4BALANCEBODYSLUDGEVAR.ItemName = dataset.ItemName;
    if (P4BALANCEBODYSLUDGEVAR.NOitem == '') {
      P4BALANCEBODYSLUDGEVAR.iscontrol = true;
      P4BALANCEBODYSLUDGEVAR.NOitem = dataset.NOitem;
    }

    // P4BALANCEBODYSLUDGEVAR.W11 = dataset.W11;
    // P4BALANCEBODYSLUDGEVAR.W12 = dataset.W12;
    // P4BALANCEBODYSLUDGEVAR.W13 = dataset.W13;
    // P4BALANCEBODYSLUDGEVAR.W14 = dataset.W14;

    P4BALANCEBODYSLUDGEVAR.Result = P4BALANCEBODYSLUDGEVAR.W11;

    List<HistoryChartModel> _historyChartData = widget.historyChartDatain ?? [];
    // List<HistoryChartModel> _historyChartData = [];

    if (P4BALANCEBODYSLUDGEVAR.mem == 'GO' &&
        P4BALANCEBODYSLUDGEVAR.UID != '' &&
        P4BALANCEBODYSLUDGEVAR.InstrumentName != '') {
      context
          .read<P4BALANCEBODYSLUDGEgetgraph_Bloc>()
          .add(P4BALANCEBODYSLUDGEgetgraph_get());
      P4BALANCEBODYSLUDGEVAR.mem = '';
      print("+++++++++++++++++++");
    }

    print(_historyChartData);
    return SizedBox(
      width: 1000,
      child: SingleChildScrollView(
        child: Wrap(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 500,
              height: 614,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 60,
                      width: 300,
                      child: Center(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: InkWell(
                                onTap: () {
                                  CuPage = Page1();
                                  MainBodyContext.read<ChangePage_Bloc>()
                                      .add(ChangePage_nodrower());
                                },
                                child: const Icon(
                                  Icons.arrow_back_ios,
                                  weight: 100,
                                  size: 40,
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 4,
                              child: Text(
                                "BALANCE CW 01 (TTC HES)",
                                style: TextStyle(fontSize: 28),
                              ),
                            ),
                          ],
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
                              Text("REQ NO : ${P4BALANCEBODYSLUDGEVAR.ReqNo}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "TYPE : ${P4BALANCEBODYSLUDGEVAR.InstrumentName}"),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "CustFull : ${P4BALANCEBODYSLUDGEVAR.CustFull}"),
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
                            child: Center(
                                child: Text(P4BALANCEBODYSLUDGEVAR.value)),
                          ),
                          InkWell(
                            onTap: () {
                              //
                              context
                                  .read<Getbalancevalue_Bloc>()
                                  .add(Getbalancevalue_Get());
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
                              // context
                              //     .read<P2BALANCEBODYCW01_Bloc>()
                              //     .add(P2BALANCEBODYCW01_SETDATA());
                              // context
                              //     .read<Getbalancevalue_Bloc>()
                              //     .add(Getbalancevalue_Get());
                              // onLoadingFAKE(context);
                              // Future.delayed(const Duration(milliseconds: 2000),
                              //     () {
                              //   context
                              //       .read<P2BALANCEBODYCW01GETSET_Bloc>()
                              //       .add(P2BALANCEBODYCW01GETSET_GET());
                              //   setState(() {});
                              // });
                            },
                            child: Container(
                              height: 40,
                              width: 120,
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
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.brown
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("NO"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 150,
                                        // color: Colors.blue,
                                        child: Container(
                                          height: 62,
                                          // color: Colors.blue.shade300,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ComInputText(
                                                isNumberOnly: true,
                                                isEnabled:
                                                    P4BALANCEBODYSLUDGEVAR
                                                            .Result ==
                                                        '',
                                                width: 100,
                                                height: 40,
                                                isContr: P4BALANCEBODYSLUDGEVAR
                                                    .iscontrol,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P4BALANCEBODYSLUDGEVAR
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue: P4BALANCEBODYSLUDGEVAR
                                                    .NOitem,
                                                returnfunc: (String s) {
                                                  P4BALANCEBODYSLUDGEVAR
                                                      .NOitem = s;
                                                },
                                              ),
                                              Text("")
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.green
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("W1 (g)"),
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
                                            child: Text(
                                                P4BALANCEBODYSLUDGEVAR.W11)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.orange
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text(""),
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
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.green
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("W2 (g)"),
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
                                            child: Text(
                                                P4BALANCEBODYSLUDGEVAR.W12)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // context
                                          //     .read<P2BALANCEBODYCW01_Bloc>()
                                          //     .add(
                                          //         P2BALANCEBODYCW01_CLEARW11());
                                          // context
                                          //     .read<Getbalancevalue_Bloc>()
                                          //     .add(Getbalancevalue_Get());
                                          // onLoadingFAKE(context);
                                          // Future.delayed(
                                          //     const Duration(
                                          //         milliseconds: 2000), () {
                                          //   context
                                          //       .read<
                                          //           P2BALANCEBODYCW01GETSET_Bloc>()
                                          //       .add(
                                          //           P2BALANCEBODYCW01GETSET_GET());
                                          //   setState(() {});
                                          // });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.orange
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("CLEAR"),
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
                                  width: 250,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.green
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("VOLUME"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 150,
                                        // color: Colors.blue,
                                        child: Container(
                                          height: 62,
                                          // color: Colors.blue.shade300,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ComInputText(
                                                isNumberOnly: true,
                                                isEnabled:
                                                    P4BALANCEBODYSLUDGEVAR
                                                            .Result ==
                                                        '',
                                                width: 100,
                                                height: 40,
                                                isContr: P4BALANCEBODYSLUDGEVAR
                                                    .iscontrol,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P4BALANCEBODYSLUDGEVAR
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P4BALANCEBODYSLUDGEVAR.area,
                                                returnfunc: (String s) {
                                                  P4BALANCEBODYSLUDGEVAR.area =
                                                      s;
                                                },
                                              ),
                                              Text("cm2")
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.brown
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("NO"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 150,
                                        // color: Colors.blue,
                                        child: Container(
                                          height: 62,
                                          // color: Colors.blue.shade300,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ComInputText(
                                                isNumberOnly: true,
                                                isEnabled:
                                                    P4BALANCEBODYSLUDGEVAR
                                                            .Result ==
                                                        '',
                                                width: 100,
                                                height: 40,
                                                isContr: P4BALANCEBODYSLUDGEVAR
                                                    .iscontrol,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P4BALANCEBODYSLUDGEVAR
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue: P4BALANCEBODYSLUDGEVAR
                                                    .NOitem,
                                                returnfunc: (String s) {
                                                  P4BALANCEBODYSLUDGEVAR
                                                      .NOitem = s;
                                                },
                                              ),
                                              Text("")
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.green
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("W1 (g)"),
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
                                            child: Text(
                                                P4BALANCEBODYSLUDGEVAR.W11)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.orange
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text(""),
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
                                  width: 250,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.green
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("W2 (g)"),
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
                                            child: Text(
                                                P4BALANCEBODYSLUDGEVAR.W12)),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          // context
                                          //     .read<P2BALANCEBODYCW01_Bloc>()
                                          //     .add(
                                          //         P2BALANCEBODYCW01_CLEARW11());
                                          // context
                                          //     .read<Getbalancevalue_Bloc>()
                                          //     .add(Getbalancevalue_Get());
                                          // onLoadingFAKE(context);
                                          // Future.delayed(
                                          //     const Duration(
                                          //         milliseconds: 2000), () {
                                          //   context
                                          //       .read<
                                          //           P2BALANCEBODYCW01GETSET_Bloc>()
                                          //       .add(
                                          //           P2BALANCEBODYCW01GETSET_GET());
                                          //   setState(() {});
                                          // });
                                        },
                                        child: Container(
                                          height: 40,
                                          width: 60,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.orange
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("CLEAR"),
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
                                  width: 250,
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () {},
                                        child: Container(
                                          height: 40,
                                          width: 80,
                                          color:
                                              P4BALANCEBODYSLUDGEVAR.SEND == ''
                                                  ? Colors.green
                                                  : Colors.grey.shade400,
                                          child: const Center(
                                            child: Text("VOLUME"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        height: 40,
                                        width: 150,
                                        // color: Colors.blue,
                                        child: Container(
                                          height: 62,
                                          // color: Colors.blue.shade300,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ComInputText(
                                                isNumberOnly: true,
                                                isEnabled:
                                                    P4BALANCEBODYSLUDGEVAR
                                                            .Result ==
                                                        '',
                                                width: 100,
                                                height: 40,
                                                isContr: P4BALANCEBODYSLUDGEVAR
                                                    .iscontrol,
                                                fnContr: (input) {
                                                  setState(() {
                                                    P4BALANCEBODYSLUDGEVAR
                                                        .iscontrol = input;
                                                  });
                                                },
                                                sValue:
                                                    P4BALANCEBODYSLUDGEVAR.area,
                                                returnfunc: (String s) {
                                                  P4BALANCEBODYSLUDGEVAR.area =
                                                      s;
                                                },
                                              ),
                                              Text("cm2")
                                            ],
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                          ],
                        )
                      ],
                    ),

                    Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              if (P4BALANCEBODYSLUDGEVAR.dip12 != '') ...[
                                Container(
                                  height: 40,
                                  color: Colors.green,
                                  child: Center(
                                    child: Text(
                                      "dip 1-2 : " +
                                          P4BALANCEBODYSLUDGEVAR.dip12,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                              if (P4BALANCEBODYSLUDGEVAR.dip13 != '') ...[
                                Container(
                                  height: 40,
                                  color: Colors.green,
                                  child: Center(
                                    child: Text(
                                      "dip 1-3 : " +
                                          P4BALANCEBODYSLUDGEVAR.dip13,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  color: Colors.green,
                                  child: Center(
                                    child: Text(
                                      "dip 2-3 : " +
                                          P4BALANCEBODYSLUDGEVAR.dip23,
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
                              height: P4BALANCEBODYSLUDGEVAR.dip13 != ''
                                  ? 120
                                  : P4BALANCEBODYSLUDGEVAR.dip12 != ''
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
                    // InkWell(
                    //   onTap: () {
                    //     // print(ConverstStr(P4BALANCEBODYSLUDGEVAR.area));
                    //     if (P4BALANCEBODYSLUDGEVAR.Result == '') {
                    //       setState(() {
                    //         P4BALANCEBODYSLUDGEVAR.Result = ((double.parse(
                    //                         ConverstStr(
                    //                             P4BALANCEBODYSLUDGEVAR.W11)) -
                    //                     double.parse(ConverstStr(
                    //                         P4BALANCEBODYSLUDGEVAR.W12))) /
                    //                 double.parse(
                    //                     ConverstStr(P4BALANCEBODYSLUDGEVAR.area)) *
                    //                 10000)
                    //             .toStringAsFixed(2);
                    //       });
                    //     } else {
                    //       setState(() {
                    //         P4BALANCEBODYSLUDGEVAR.Result = '';
                    //       });
                    //     }
                    //   },
                    //   child: Container(
                    //     height: 40,
                    //     color: Colors.orange,
                    //     child: Center(
                    //       child: Text(
                    //         P4BALANCEBODYSLUDGEVAR.Result == '' ? "CAL" : "RE CAL",
                    //         style: TextStyle(color: Colors.white),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          // child: Container(
                          //   height: 62,
                          //   color: Colors.blue.shade300,
                          //   child: Column(
                          //     children: [
                          //       const SizedBox(
                          //         height: 5,
                          //       ),
                          //       const Center(child: Text('AREA')),
                          //       Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceAround,
                          //         children: [
                          //           ComInputText(
                          //             isNumberOnly: true,
                          //             isEnabled:
                          //                 P4BALANCEBODYSLUDGEVAR.Result == '',
                          //             width: 100,
                          //             height: 40,
                          //             isContr: P4BALANCEBODYSLUDGEVAR.iscontrol,
                          //             fnContr: (input) {
                          //               setState(() {
                          //                 P4BALANCEBODYSLUDGEVAR.iscontrol = input;
                          //               });
                          //             },
                          //             sValue: P4BALANCEBODYSLUDGEVAR.area,
                          //             returnfunc: (String s) {
                          //               P4BALANCEBODYSLUDGEVAR.area = s;
                          //             },
                          //           ),
                          //           Text("cm2")
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          child: InkWell(
                            onTap: () {
                              // print(ConverstStr(P4BALANCEBODYSLUDGEVAR.area));
                              // if (P4BALANCEBODYSLUDGEVAR.Result == '') {
                              //   setState(() {
                              //     P4BALANCEBODYSLUDGEVAR
                              //         .Result = ((double.parse(ConverstStr(
                              //                     P4BALANCEBODYSLUDGEVAR.W11)) -
                              //                 double.parse(ConverstStr(
                              //                     P4BALANCEBODYSLUDGEVAR
                              //                         .W12))) /
                              //             double.parse(ConverstStr(
                              //                 P4BALANCEBODYSLUDGEVAR.area)) *
                              //             10000)
                              //         .toStringAsFixed(2);
                              //   });
                              //   context
                              //       .read<P2BALANCEBODYCW01_Bloc>()
                              //       .add(P2BALANCEBODYCW01_CAL());
                              // } else {
                              //   setState(() {
                              //     P4BALANCEBODYSLUDGEVAR.Result = '';
                              //   });
                              // }
                            },
                            child: Container(
                              height: 62,
                              color: P4BALANCEBODYSLUDGEVAR.Result == ''
                                  ? Colors.orange
                                  : Colors.deepOrange,
                              child: Center(
                                child: Text(
                                  P4BALANCEBODYSLUDGEVAR.Result == ''
                                      ? "CAL"
                                      : "RE CAL",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
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
                                Center(
                                    child: Text(P4BALANCEBODYSLUDGEVAR.Result)),
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
                      onTap: () {
                        Dio().post(
                          '${serverN}/balance01CLEARREGISTER',
                          data: {},
                        ).then((value) {
                          CuPage = Page1();
                          MainBodyContext.read<ChangePage_Bloc>()
                              .add(ChangePage_nodrower());
                        });
                      },
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
                      onTap: () {
                        // if (P4BALANCEBODYSLUDGEVAR.area != '' &&
                        //     P4BALANCEBODYSLUDGEVAR.W11 != '' &&
                        //     P4BALANCEBODYSLUDGEVAR.W12 != '') {
                        // context
                        //     .read<P2BALANCEBODYCW01_Bloc>()
                        //     .add(P2BALANCEBODYCW01_SEND_TO_SAR());
                        // } else {
                        //   WORNINGpop(
                        //     context,
                        //     [
                        //       "DATA NOT COMPLETE",
                        //       "PLEASE CHECK",
                        //     ],
                        //     100,
                        //     100,
                        //   );
                        // }
                      },
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
              child: Container(
                width: 600,
                height: 500,
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                      color: Color(0xFFE0F7FA),
                      /* gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(0, 56, 243, 247),
                          Color(0x03F6FB),
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ), */
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(
                              height: 15,
                            ),
                            /*                             Text(
                                'HISTORY DATA',
                                style: TextStyle(
                                  //color: Color(0xff827daa),
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2,
                                ),
                                textAlign: TextAlign.center,
                              ), */
                            Text(
                              '${_historyChartData.length > 0 ? _historyChartData[0].custFull : ''}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'SAMPLE NAME : ${_historyChartData.length > 0 ? _historyChartData[0].sampleName : ''}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'ITEM : ${P4BALANCEBODYSLUDGEVAR.itemName}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'POSITION : ${_historyChartData.length > 0 ? _historyChartData[0].position : ''}',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              'CONTROL RANGE',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  ' MIN : ${_historyChartData.length > 0 ? _historyChartData[0].stdMin : ''}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Text(
                                  ' MAX : ${_historyChartData.length > 0 ? _historyChartData[0].stdMax : ''}',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 30.0, left: 6.0),
                                child: _LineChart(
                                  isShowingMainData:
                                      P4BALANCEBODYSLUDGEVAR.isShowingMainData,
                                  historyChartData: _historyChartData,
                                  // historyChartData: [],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.refresh,
                            color: Colors.white.withOpacity(
                                P4BALANCEBODYSLUDGEVAR.isShowingMainData
                                    ? 1.0
                                    : 0.5),
                          ),
                          onPressed: () {
                            setState(() {
                              P4BALANCEBODYSLUDGEVAR.isShowingMainData =
                                  !P4BALANCEBODYSLUDGEVAR.isShowingMainData;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _LineChart extends StatelessWidget {
  _LineChart({
    required this.isShowingMainData,
    required this.historyChartData,
  });
  final bool isShowingMainData;
  double maxX = 0;
  double minX = 0;
  double maxY = 0;
  double minY = 0;
  bool showBottomTile = true;
  List<HistoryChartModel> historyChartData;

  final List<Color> gradientColors = [
    const Color(0xFFEF9A9A),
    const Color(0xFFFFEBEE),
  ];

  @override
  Widget build(BuildContext context) {
    manageData();

    return LineChart(
      chartData,
      // LineChartData(),
      // swapAnimationDuration: const Duration(milliseconds: 250),
    );
  }

  void manageData() {
    print("In manage");
    minX = 0;
    if (historyChartData.length == 1 &&
        double.parse(ConverstStr(historyChartData[0].resultApprove)) > 0) {
      maxX = 2;
      showBottomTile = false;
    } else if (historyChartData.length == 1) {
      maxX = 1;
      showBottomTile = false;
    } else {
      maxX = historyChartData.length.toDouble() - 1;
    }
    double maxResult = 0;
    double minResult = 9999999;

    for (int i = 0; i < historyChartData.length; i++) {
      if (double.parse(ConverstStr(historyChartData[i].resultApprove)) <
          minResult) {
        minResult =
            double.parse(ConverstStr(historyChartData[i].resultApprove));
      }
      if (double.parse(ConverstStr(historyChartData[i].resultApprove)) >
          maxResult) {
        maxResult =
            double.parse(ConverstStr(historyChartData[i].resultApprove));
      }
    }
    print(minResult);
    print(maxResult);
    if (historyChartData.length > 0) {
      if (double.parse(ConverstStr(historyChartData[0].stdMin)) > 0 &&
          double.parse(ConverstStr(historyChartData[0].stdMin)) < minResult) {
        minY = (double.parse(ConverstStr(historyChartData[0].stdMin)) * 0.7);
      } else {
        minY = minResult * 0.7;
      }
      if (double.parse(ConverstStr(historyChartData[0].stdMax)) > 0 &&
          double.parse(ConverstStr(historyChartData[0].stdMax)) > maxResult) {
        maxY = (double.parse(ConverstStr(historyChartData[0].stdMax)) * 1.3);
      } else {
        maxY = maxResult * 1.3;
      }
    }

    /* print("Minx:$minX");
    print("Maxx:$maxX");
    print("Miny:$minY");
    print("MaxY:$maxY");
    for (int i = 0; i < historyChartData.length; i++) {
      print((int.tryParse(historyChartData[i].resultApprove))!
          .toDouble()
          .toString());
    } */
  }

  LineChartData get chartData => LineChartData(
        lineTouchData: lineTouchData1,
        gridData: gridData,
        titlesData: titlesData1,
        borderData: borderData,
        lineBarsData: lineBarsData1(),
        minX: minX,
        maxX: maxX,
        minY: minY,
        maxY: maxY,
      );

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.blueGrey.withOpacity(0.8),
            getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
              return touchedBarSpots.map((barSpot) {
                final flSpot = barSpot;
                if (historyChartData.length == 1) {
                  return LineTooltipItem(
                    'RESULT : ${flSpot.y}',
                    TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return LineTooltipItem(
                    '${flSpot.y} ${historyChartData[flSpot.x.toInt()].resultApproveUnit}\nDate\n${historyChartData[flSpot.x.toInt()].samplingDate}',
                    TextStyle(
                      fontSize: 15,
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              }).toList();
            }),
      );

  FlTitlesData get titlesData1 => FlTitlesData(
        leftTitles: leftTitles,
        bottomTitles: bottomTitles,
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        /* leftTitles: SideTitles(
        showTitles: true,
        margin: 8,
        interval: 0.2,
        reservedSize: 100,
        getTextStyles: (context, value) => const TextStyle(
          color: Color(0xFFD50000),
          fontWeight: FontWeight.bold,
          fontSize: 14,
        ),
      ) */
      );

  /* List<LineChartBarData> get lineBarsData1 => [
        upperLine,
        lowwerLine,
        lineData,
      ]; */
  List<LineChartBarData> lineBarsData1() {
    List<LineChartBarData> buff = [];
    if (historyChartData.length > 0) {
      if (double.parse(ConverstStr(historyChartData[0].resultApprove)) > 0) {
        buff.add(lineData);
      }
      if (double.parse(ConverstStr(historyChartData[0].stdMin)) > 0) {
        buff.add(lowwerLine);
      }
      if (double.parse(ConverstStr(historyChartData[0].stdMax)) > 0) {
        buff.add(upperLine);
      }
    }

    return buff;
  }

  AxisTitles get leftTitles => AxisTitles(
        sideTitles: SideTitles(
          showTitles: true,
          //margin: 5,
          //interval: (maxY - minY) / 10,
          reservedSize: 35,
        ),
        /*  style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ), */

        /* getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return '1m';
          case 2:
            return '2m';
          case 3:
            return '3m';
          case 4:
            return '5m';
          case 5:
            return '1m';
          case 6:
            return '2m';
          case 7:
            return '3m';
          case 8:
            return '5m';
          case 9:
            return '3m';
          case 10:
            return '5m';
        }
        return '';
      } */
      );

  AxisTitles get bottomTitles => AxisTitles(
        sideTitles: SideTitles(
          showTitles: showBottomTile,
          reservedSize: 80,
          //margin: 10,
          interval: 1,
          getTitlesWidget: (value, titleMeta) {
            return Padding(
              // You can use any widget here
              padding: EdgeInsets.only(
                top: 20,
                left: 50,
              ),
              child: Transform.rotate(
                angle: -45,
                child: Text(
                  historyChartData[value.toInt()].samplingDate,
/*                   style: TextStyle(color: Colors.red), */
                  style: TextStyle(fontSize: 14),
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),

        /* getTextStyles: (context, value) => const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ), */
        /* getTitles: (value) {
          return historyChartData[value.toInt()].samplingDate;
        },
        rotateAngle: -45, */
      );

  FlGridData get gridData => FlGridData(show: true);

  FlBorderData get borderData => FlBorderData(
        show: true,
        border: Border(
          bottom: BorderSide(color: Colors.black, width: 2),
          left: BorderSide(color: Colors.black, width: 2),
          right: BorderSide(color: Colors.transparent),
          top: BorderSide(color: Colors.transparent),
        ),
      );

  LineChartBarData get upperLine => LineChartBarData(
        isCurved: true,
        /*  color: [const Color(0xFFFF6F00)], */
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        aboveBarData: BarAreaData(
          show: true,
          /* color:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(), */
        ),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: upperLineData(),
      );

  List<FlSpot> upperLineData() {
    List<FlSpot> buff = [];
    if (historyChartData.length == 1 &&
        double.parse(ConverstStr(historyChartData[0].resultApprove)) > 0) {
      buff.add(FlSpot(
          0, double.parse(ConverstStr(historyChartData[0].stdMax)).toDouble()));
      buff.add(FlSpot(
          2, double.parse(ConverstStr(historyChartData[0].stdMax)).toDouble()));
    } else if (historyChartData.length == 1) {
      buff.add(FlSpot(
          0, double.parse(ConverstStr(historyChartData[0].stdMax)).toDouble()));
      buff.add(FlSpot(
          1, double.parse(ConverstStr(historyChartData[0].stdMax)).toDouble()));
    } else {
      buff.add(FlSpot(
          0, double.parse(ConverstStr(historyChartData[0].stdMax)).toDouble()));
      buff.add(FlSpot(historyChartData.length.toDouble() - 1,
          double.parse(ConverstStr(historyChartData[0].stdMax)).toDouble()));
    }
    return buff;
  }

  LineChartBarData get lowwerLine => LineChartBarData(
        isCurved: true,
        /* colors: [const Color(0xFFFF6F00)], */
        color: Colors.amber,
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: FlDotData(show: false),
        aboveBarData: BarAreaData(show: false),
        belowBarData: BarAreaData(
          show: true,
          /* colors:
              gradientColors.map((color) => color.withOpacity(0.3)).toList(), */
        ),
        spots: lowwerLineData(),
      );

  List<FlSpot> lowwerLineData() {
    List<FlSpot> buff = [];
    if (historyChartData.length == 1 &&
        double.parse(ConverstStr(historyChartData[0].resultApprove)) > 0) {
      buff.add(FlSpot(
          0, double.parse(ConverstStr(historyChartData[0].stdMin)).toDouble()));
      buff.add(FlSpot(
          2, double.parse(ConverstStr(historyChartData[0].stdMin)).toDouble()));
    } else if (historyChartData.length == 1) {
      buff.add(FlSpot(
          0, double.parse(ConverstStr(historyChartData[0].stdMin)).toDouble()));
      buff.add(FlSpot(
          1, double.parse(ConverstStr(historyChartData[0].stdMin)).toDouble()));
    } else {
      buff.add(FlSpot(
          0, double.parse(ConverstStr(historyChartData[0].stdMin)).toDouble()));
      buff.add(FlSpot(historyChartData.length.toDouble() - 1,
          double.parse(ConverstStr(historyChartData[0].stdMin)).toDouble()));
    }
    return buff;
  }

  LineChartBarData get lineData => LineChartBarData(
        isCurved: true,
        /* colors: const [Color(0xff27b6fc)], */
        color: Colors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        dotData: FlDotData(show: true),
        belowBarData: BarAreaData(show: false),
        /* spots: [for (final node in HistoryChartData) FlSpot(node.timestamp.toDouble(), node.rawValue)
        ], */
        spots: ((() {
          if (historyChartData.length == 1 &&
              double.parse(ConverstStr(historyChartData[0].resultApprove)) >
                  0) {
            //for (int i = 0; i < historyChartData.length; i++)
            print("addddddd");
            return [
              FlSpot(
                  1,
                  (double.parse(
                      ConverstStr(historyChartData[0].resultApprove))))
            ];
          } else {
            List<FlSpot> buff = [];
            for (int i = 0; i < historyChartData.length; i++) {
              buff.add(FlSpot(
                  i.toDouble(),
                  (double.parse(
                      ConverstStr(historyChartData[i].resultApprove)))));
            }
            return buff;
          }
        }())),
      );
}
