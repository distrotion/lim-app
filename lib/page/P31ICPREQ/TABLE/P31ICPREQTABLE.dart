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

import '../../page12.dart';
import '../../page2.dart';
import '../../Page32.dart';
import '../../page3.dart';
import '../../page4.dart';

import '../P31ICPREQVAR.dart';
import 'P31ICPREQTABLEFIELD.dart';

var datet = DateTime.now().millisecondsSinceEpoch;

class P31ICPREQTABLE extends StatefulWidget {
  P31ICPREQTABLE({Key? key, this.sardata}) : super(key: key);
  List<dataset>? sardata;

  @override
  State<P31ICPREQTABLE> createState() => _P31ICPREQTABLEState();
}

class _P31ICPREQTABLEState extends State<P31ICPREQTABLE> {
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
                  isContr: P31ICPREQVAR.iscontrol,
                  fnContr: (input) {
                    P31ICPREQVAR.iscontrol = input;
                  },
                  sValue: P31ICPREQVAR.SEARCH,
                  returnfunc: (String s) {
                    setState(() {
                      P31ICPREQVAR.SEARCH = s;
                    });
                  },
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      P31ICPREQVAR.iscontrol = true;
                      P31ICPREQVAR.SEARCH = '';
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
            child: P31WIDGETFIELD(
              height: 20,
              forntsize: 10,
              B01: 'REQ NO.', //f1
              B02: 'Customer NAME', //f19
              B03: 'Due date', //f9
              B04: 'Sample Name', //f17
              B05: 'Item Name', //f30
              B06: 'Dilution time', //f16
              B07: 'NO', //--
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
      if (_data[i]
                  .f01
                  .toUpperCase()
                  .contains(P31ICPREQVAR.SEARCH.toUpperCase()) ||
              _data[i]
                  .f02
                  .toUpperCase()
                  .contains(P31ICPREQVAR.SEARCH.toUpperCase()) ||
              _data[i]
                  .f03
                  .toUpperCase()
                  .contains(P31ICPREQVAR.SEARCH.toUpperCase()) ||
              _data[i]
                  .f04
                  .toUpperCase()
                  .contains(P31ICPREQVAR.SEARCH.toUpperCase()) ||
              _data[i]
                  .f05
                  .toUpperCase()
                  .contains(P31ICPREQVAR.SEARCH.toUpperCase())
          // _data[i].f05.contains(P31ICPREQVAR.SEARCH)
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
      tableout.add(P31WIDGETFIELD(
        height: 45,
        B01: _data_exp[i].f01,
        B01L:
            "(${monthreplce(_data_exp[i].f05.replaceAll("00:00:00", "").replaceAll("GMT", ""))})",
        B02: _data_exp[i].f03,
        B03: monthreplce(_data_exp[i]
            .f17
            .replaceAll("00:00:00", "")
            .replaceAll("GMT", "")), //f17
        B04: _data_exp[i].f41,
        B05: _data_exp[i].f04,
        B06: _data_exp[i].f26,

        B07: (_data_exp[i].f06).toString(),
        B08: '',
        B09: '',
        B10: '',
        B11: _data_exp[i].f02,
        B12: _data_exp[i].f70,
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

          // if (CP == "Sludge") {
          if (CP == "ICP") {
            final response = Dio().post(
              '${selectBLANCE(USERDATA.Branch)}/GETREGISTER_${USERDATA.INSMASTER}',
              data: {},
            ).then((value) {
              if (value.statusCode == 200) {
                var databuICP = value.data;
                // print('>>>>${databuICP['REQNO']}');
                if (databuICP['REQNO'] != null) {
                  if (databuICP['REQNO'].toString() == '') {
                    final response = Dio().post(
                      '${selectBLANCE(USERDATA.Branch)}/SETREGISTER_${USERDATA.INSMASTER}',
                      data: {
                        "REQNO": PO,
                        "UID": FG,
                      },
                    ).then((value) {
                      if (value.statusCode == 200) {
                        var databuICP = value.data;

                        if (databuICP['msg'].toString() == 'ok') {
                          GENREQSG(context, _data_exp[i], Page32(),
                              '36SARICPSTD/GENREQ');
                        } else {
                          // WORNINGpop(context, ["test2", "test2"], 100, 200);
                        }
                      }
                    });
                  } else {
                    // WORNINGpop(context, ["test", "test"], 100, 200);

                    // CuPage = Page3();
                    // MainBodyContext.read<ChangePage_Bloc>()
                    //     .add(ChangePage_nodrower());
                    WORNINGpop(
                      context,
                      [
                        "BLOCK",
                        "PLEASE CHECK",
                      ],
                      100,
                      100,
                    );
                  }
                }
              }
            });
            // } else if (CP == "Cwt") {
          } else {
            WORNINGpop(
              context,
              [
                "NO",
                "USE",
              ],
              100,
              100,
            );
          }
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

GENREQSG(BuildContext contextin, dataset datainput, Widget widpage,
    String where) async {
  //
  Dio().post(
    '${serverG}${where}',
    data: {
      "ReqNo": datainput.f01,
      "InstrumentName": datainput.f02,
      "UID": datainput.f70,
      "INSNO": USERDATA.INSMASTER,
      "USERREGIS": USERDATA.ID,
      "timestamp": datet,
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
    CuPage = widpage;
    MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
  });
}

void CHECKROOM(BuildContext contextin, dataset datainput) async {}

// List<Widget> tableout = [
//       P1WIDGETFIELD(
//         isSELECTFUNC: true,
//         SELECTFUNC: (input) {
//           P31ICPREQVAR.INSCOUTTEST = 2;
//           contextGB.read<BlocPageRebuild>().rebuildPage();
//         },
//       ),
//       P1WIDGETFIELD(
//         isSELECTFUNC: true,
//         SELECTFUNC: (input) {
//           P31ICPREQVAR.INSCOUTTEST = 3;
//           contextGB.read<BlocPageRebuild>().rebuildPage();
//         },
//       ),
//     ];

// else if (CP != "COATING WEIGHT") {
//   final response = Dio().post(
//     '${serverN}/GETREGISTER_${USERDATA.INSMASTER}',
//     data: {},
//   ).then((value) {
//     if (value.statusCode == 200) {
//       var databuICP = value.data;
//       // print('>>>>${databuICP['REQNO']}');
//       if (databuICP['REQNO'] != null) {
//         if (databuICP['REQNO'].toString() == '') {
//           final response = Dio().post(
//             '${serverN}/SETREGISTER_${USERDATA.INSMASTER}',
//             data: {
//               "REQNO": PO,
//               "UID": FG,
//             },
//           ).then((value) {
//             if (value.statusCode == 200) {
//               var databuICP = value.data;

//               if (databuICP['msg'].toString() == 'ok') {
//                 GENREQSG(context, _data_exp[i], Page2(),
//                     '03SARBALANCE01CWT/GENREQ');
//               } else {
//                 // WORNINGpop(context, ["test2", "test2"], 100, 200);
//               }
//             }
//           });
//         } else {
//           // WORNINGpop(context, ["test", "test"], 100, 200);

//           // CuPage = Page2();
//           // MainBodyContext.read<ChangePage_Bloc>()
//           //     .add(ChangePage_nodrower());

//           WORNINGpop(
//             context,
//             [
//               "BLOCK",
//               "PLEASE CHECK",
//             ],
//             100,
//             100,
//           );
//         }
//       }
//     }
//   });
// }

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

String monthreplce(String input) {
  String output = '';
  output = input
      .replaceAll("Jan", "-01-")
      .replaceAll("Feb", "-02-")
      .replaceAll("Mar", "-03-")
      .replaceAll("Apr", "-04-")
      .replaceAll("May", "-05-")
      .replaceAll("Jun", "-06-")
      .replaceAll("Jul", "-07-")
      .replaceAll("Aug", "-08-")
      .replaceAll("Sep", "-09-")
      .replaceAll("Oct", "-10-")
      .replaceAll("Nov", "-11-")
      .replaceAll("Dec", "-12-")
      .replaceAll(" ", "");
  return output;
}
