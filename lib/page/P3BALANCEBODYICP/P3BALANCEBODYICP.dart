import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/01-Getbalancevalue.dart';
import '../../bloc/BlocEvent/03-01-P3BALANCEBODYICP.dart';
import '../../bloc/BlocEvent/03-02-P3BALANCEBODYICPGETSET.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/ComInputText.dart';
import '../../widget/common/Loading.dart';
import '../page1.dart';
import 'P3BALANCEBODYICPVAR.dart';

late BuildContext P03BALANCEBODYICPcontext;

class P03BALANCEBODYICP extends StatefulWidget {
  P03BALANCEBODYICP({
    super.key,
    this.value,
    this.SET,
    this.status,
  });
  String? value;
  P3BALANCEBODYICPGETSETCLASS? SET;
  String? status;
  @override
  State<P03BALANCEBODYICP> createState() => _P03BALANCEBODYICPState();
}

class _P03BALANCEBODYICPState extends State<P03BALANCEBODYICP> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<Getbalancevalue_Bloc>().add(Getbalancevalue_Get());
    context
        .read<P3BALANCEBODYICPGETSET_Bloc>()
        .add(P3BALANCEBODYICPGETSET_GET());
  }

  @override
  Widget build(BuildContext context) {
    P03BALANCEBODYICPcontext = context;
    P3BALANCEBODY01ICPVAR.value = widget.value ?? '';
    P3BALANCEBODYICPGETSETCLASS dataset =
        widget.SET ?? P3BALANCEBODYICPGETSETCLASS();

    P3BALANCEBODY01ICPVAR.ReqNo = dataset.ReqNo;
    P3BALANCEBODY01ICPVAR.InstrumentName = dataset.InstrumentName;
    P3BALANCEBODY01ICPVAR.CustFull = dataset.CustShort;

    P3BALANCEBODY01ICPVAR.W11 = dataset.W11;
    P3BALANCEBODY01ICPVAR.W11_adj = dataset.W11_adj;
    P3BALANCEBODY01ICPVAR.Result = P3BALANCEBODY01ICPVAR.W11;

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
                            Text("REQ NO : ${P3BALANCEBODY01ICPVAR.ReqNo}"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "TYPE : ${P3BALANCEBODY01ICPVAR.InstrumentName}"),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                                "CustFull : ${P3BALANCEBODY01ICPVAR.CustFull}"),
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
                          child:
                              Center(child: Text(P3BALANCEBODY01ICPVAR.value)),
                        ),
                        InkWell(
                          onTap: () {
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
                            context
                                .read<P3BALANCEBODYICP_Bloc>()
                                .add(P3BALANCEBODYICP_SETDATA());
                            context
                                .read<Getbalancevalue_Bloc>()
                                .add(Getbalancevalue_Get());
                            onLoadingFAKE(context);
                            Future.delayed(const Duration(milliseconds: 2000),
                                () {
                              context
                                  .read<P3BALANCEBODYICPGETSET_Bloc>()
                                  .add(P3BALANCEBODYICPGETSET_GET());
                              setState(() {});
                            });
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
                                  child: Text("N1 R1"),
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
                              onTap: () {
                                context
                                    .read<P3BALANCEBODYICP_Bloc>()
                                    .add(P3BALANCEBODYICP_CLEARW11());
                                context
                                    .read<Getbalancevalue_Bloc>()
                                    .add(Getbalancevalue_Get());
                                onLoadingFAKE(context);
                                Future.delayed(
                                    const Duration(milliseconds: 2000), () {
                                  context
                                      .read<P3BALANCEBODYICPGETSET_Bloc>()
                                      .add(P3BALANCEBODYICPGETSET_GET());
                                  setState(() {});
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 95,
                                color: P3BALANCEBODY01ICPVAR.SEND == ''
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("CLEAR N1 R1"),
                                ),
                              ),
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
                                  child: Text("N1 R2"),
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
                                  child: Text(P3BALANCEBODY01ICPVAR.W11_adj)),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            InkWell(
                              onTap: () {
                                context
                                    .read<P3BALANCEBODYICP_Bloc>()
                                    .add(P3BALANCEBODYICP_CLEARW11_ADJ());
                                context
                                    .read<Getbalancevalue_Bloc>()
                                    .add(Getbalancevalue_Get());
                                onLoadingFAKE(context);
                                Future.delayed(
                                    const Duration(milliseconds: 2000), () {
                                  context
                                      .read<P3BALANCEBODYICPGETSET_Bloc>()
                                      .add(P3BALANCEBODYICPGETSET_GET());
                                  setState(() {});
                                });
                              },
                              child: Container(
                                height: 40,
                                width: 95,
                                color: P3BALANCEBODY01ICPVAR.SEND == ''
                                    ? Colors.orange
                                    : Colors.grey.shade400,
                                child: const Center(
                                  child: Text("CLEAR N1R2"),
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
