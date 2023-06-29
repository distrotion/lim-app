import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../../bloc/cubit/NotificationEvent.dart';
import '../../../bloc/cubit/Rebuild.dart';

import '../../../data/global.dart';
import '../../../mainBody.dart';
import '../../../model/model.dart';
import '../../../widget/common/ComInputText.dart';
import '../../../widget/common/Loading.dart';
import '../../../widget/common/popup.dart';

import '../../page2.dart';
import '../../page3.dart';
import '../P1BALANCEREQ01VAR.dart';
import 'P1BALANCEREQ01TABLEFIELD.dart';

class P1BALANCEREQ01TABLE extends StatefulWidget {
  P1BALANCEREQ01TABLE({Key? key, this.sardata}) : super(key: key);
  List<dataset>? sardata;

  @override
  State<P1BALANCEREQ01TABLE> createState() => _P1BALANCEREQ01TABLEState();
}

class _P1BALANCEREQ01TABLEState extends State<P1BALANCEREQ01TABLE> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ComInputText(
                  isSideIcon: true,
                  height: 40,
                  width: 400,
                  isContr: P1BALANCEREQ01VAR.iscontrol,
                  fnContr: (input) {
                    P1BALANCEREQ01VAR.iscontrol = input;
                  },
                  sValue: P1BALANCEREQ01VAR.SEARCH,
                  returnfunc: (String s) {
                    setState(() {
                      P1BALANCEREQ01VAR.SEARCH = s;
                    });
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      P1BALANCEREQ01VAR.iscontrol = true;
                      P1BALANCEREQ01VAR.SEARCH = '';
                    });
                  },
                  child: Container(
                    height: 40,
                    width: 150,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.orange,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Center(
                      child: Text("SEARCH CLEAR"),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      color: Colors.blueAccent,
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                    child: const Center(
                      child: Text("RELOAD"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: P1WIDGETFIELD(
              height: 20,
              forntsize: 10,
              B01: 'REQ NO.', //f1
              B02: 'TYPE', //f19
              B03: 'Customer NAME', //f17
              B04: 'Sampling Name', //f16
              B05: 'Sampling date', //f9
              B06: 'Remark', //f30
              B07: 'B05', //--
              B08: 'ACTION',
              CB01: Colors.black54,
              CB02: Colors.black54,
              CB03: Colors.black54,
              CB04: Colors.black54,
              CB05: Colors.black54,
              CB06: Colors.black54,
              CB07: Colors.black54,
              CB08: Colors.black54,
              FCB: Colors.white,
            ),
          ),
          Expanded(
            flex: 46,
            child: SizedBox(
              child: tabledetailsearchlist(
                sapdata: widget.sardata,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class tabledetailsearchlist extends StatelessWidget {
  tabledetailsearchlist({Key? key, this.sapdata}) : super(key: key);
  List<dataset>? sapdata;
  @override
  Widget build(BuildContext context) {
    List<dataset> _data = sapdata ?? [];
    List<dataset> _data_exp = [];

    for (int i = 0; i < _data.length; i++) {
      if (_data[i].f01.contains(P1BALANCEREQ01VAR.SEARCH) ||
              _data[i].f02.contains(P1BALANCEREQ01VAR.SEARCH) ||
              _data[i].f03.contains(P1BALANCEREQ01VAR.SEARCH) ||
              _data[i].f04.contains(P1BALANCEREQ01VAR.SEARCH)
          // _data[i].f05.contains(P1BALANCEREQ01VAR.SEARCH)
          ) {
        _data_exp.add(_data[i]);
      }
    }
    return tabledetailsearch(
      sapdata: _data_exp,
    );
  }
}

class tabledetailsearch extends StatelessWidget {
  tabledetailsearch({
    Key? key,
    this.sapdata,
  }) : super(key: key);
  List<dataset>? sapdata;

  @override
  Widget build(BuildContext context) {
    List<dataset> _data_exp = sapdata ?? [];
    List<Widget> tableout = [];
    for (int i = 0; i < _data_exp.length; i++) {
      tableout.add(P1WIDGETFIELD(
        height: 45,
        B01: _data_exp[i].f01,
        B02: _data_exp[i].f02,
        B03: _data_exp[i].f03,
        B04: _data_exp[i].f04,
        B05: _data_exp[i].f05,
        B06: _data_exp[i].f06,
        B07: '',
        B08: '',
        B09: '',
        B10: '',
        B11: _data_exp[i].f02,
        B12: _data_exp[i].f03,
        CB01: _data_exp[i].f36 == 'finish-no'
            ? Colors.red
            : _data_exp[i].f36 == 'finish'
                ? Colors.green
                : _data_exp[i].f36 == 'ip'
                    ? Colors.yellow
                    : Colors.transparent,
        isSELECTFUNC: true,
        SELECTFUNC: (PO, CP, FG) async {
          print(PO);
          print(CP);
          print(FG);

          // if (CP == 'COATING WEIGHT') {
          //   P2BALANCEBODY01CWVAR.ReqNo = PO;
          //   P2BALANCEBODY01CWVAR.TYPE = CP;
          //   CuPage = Page2();
          //   MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
          // } else if (CP == 'ICP') {
          //   P3BALANCEBODY01ICPVAR.ReqNo = PO;
          //   P3BALANCEBODY01ICPVAR.TYPE = CP;
          //   CuPage = Page3();
          //   MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
          // } else {
          //   //
          //   // WORNINGpop(context, ["NO HAVE", "INSTRUMENT"], 100, 200);
          //   P3BALANCEBODY01ICPVAR.ReqNo = PO;
          //   P3BALANCEBODY01ICPVAR.TYPE = CP;
          //   CuPage = Page3();
          //   MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
          // }
          final response = Dio().post(
            'http://172.23.10.40:2600/balance01GETREGISTER',
            data: {},
          ).then((value) {
            if (value.statusCode == 200) {
              var databuff = value.data;
              // print('>>>>${databuff['REQNO']}');
              if (databuff['REQNO'] != null) {
                if (databuff['REQNO'].toString() == '') {
                  final response = Dio().post(
                    'http://172.23.10.40:2600/balance01SETREGISTER',
                    data: {
                      "REQNO": PO,
                    },
                  ).then((value) {
                    if (value.statusCode == 200) {
                      var databuff = value.data;

                      if (databuff['msg'].toString() == 'ok') {
                        GENREQSG(context, _data_exp[i]);
                      } else {
                        // WORNINGpop(context, ["test2", "test2"], 100, 200);
                      }
                    }
                  });
                } else {
                  // WORNINGpop(context, ["test", "test"], 100, 200);
                  CuPage = Page3();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                }
              }
            }
          });
        },
      ));
    }
    return tabledetailinside(
      tableout: tableout,
    );
  }
}

class tabledetailinside extends StatelessWidget {
  tabledetailinside({Key? key, this.tableout}) : super(key: key);
  List<Widget>? tableout;
  @override
  Widget build(BuildContext context) {
    List<Widget> _tableout = tableout ?? [];
    return SingleChildScrollView(
      child: SizedBox(
        height: _tableout.length * 45 + 35,
        child: Column(
          children: _tableout,
        ),
      ),
    );
  }
}

GENREQSG(BuildContext contextin, dataset datainput) async {
  //
  Dio().post(
    '${serverG}02SARBALANCE01SINGLESHOT/GENREQ',
    data: {
      "ReqNo": datainput.f01,
      "InstrumentName": datainput.f02,
      //-------------------
      "Branch": datainput.f11,
      "Code": datainput.f12,
      "ControlRange": datainput.f13,
      "CustFull": datainput.f14,
      "CustId": datainput.f15,
      "CustShort": datainput.f16,
      "DueDate1": datainput.f17,
      "Incharge": datainput.f18,
      "ItemName": datainput.f20,
      "ItemNo": datainput.f21,
      "ItemReportName": datainput.f22,
      "ItemStatus": datainput.f23,
      "JobType": datainput.f24,
      "ListDate": datainput.f25,
      "Mag": datainput.f26,
      "Position": datainput.f27,
      "ProcessReportName": datainput.f28,
      "ReceiveDate": datainput.f29,
      "RemarkNo": datainput.f30,
      "RemarkSend": datainput.f31,
      "ReportOrder": datainput.f32,
      "ReqDate": datainput.f33,
      "ReqUser": datainput.f35,
      "RequestRound": datainput.f36,
      "RequestSection": datainput.f37,
      "RequestStatus": datainput.f38,
      "SampleCode": datainput.f39,
      "SampleGroup": datainput.f40,
      "SampleName": datainput.f41,
      "SampleNo": datainput.f42,
      "SampleRemark": datainput.f43,
      "SampleStatus": datainput.f44,
      "SampleTank": datainput.f45,
      "SampleType": datainput.f46,
      "SamplingDate": datainput.f47,
      "SendDate": datainput.f48,
      "Std1": datainput.f49,
      "Std2": datainput.f50,
      "Std3": datainput.f51,
      "Std4": datainput.f52,
      "Std5": datainput.f53,
      "Std6": datainput.f54,
      "Std7": datainput.f55,
      "Std8": datainput.f56,
      "Std9": datainput.f57,
      "StdFactor": datainput.f58,
      "StdMax": datainput.f59,
      "StdMaxL": datainput.f60,
      "StdMin": datainput.f61,
      "StdMinL": datainput.f62,
      "StdSymbol": datainput.f63,
      "Temp": datainput.f64,
      "UserListAnalysis": datainput.f65,
      "UserReceive": datainput.f66,
      "UserReject": datainput.f67,
      "UserRequestRecheck": datainput.f68,
      "UserSend": datainput.f69,
    },
  ).then((value) {
    CuPage = Page3();
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  });
}

void CHECKROOM(BuildContext contextin, dataset datainput) async {}


// List<Widget> tableout = [
//       P1WIDGETFIELD(
//         isSELECTFUNC: true,
//         SELECTFUNC: (input) {
//           P1BALANCEREQ01VAR.INSCOUTTEST = 2;
//           contextGB.read<BlocPageRebuild>().rebuildPage();
//         },
//       ),
//       P1WIDGETFIELD(
//         isSELECTFUNC: true,
//         SELECTFUNC: (input) {
//           P1BALANCEREQ01VAR.INSCOUTTEST = 3;
//           contextGB.read<BlocPageRebuild>().rebuildPage();
//         },
//       ),
//     ];