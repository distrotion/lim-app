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
import '../../P2BALANCEBODYCW01/P2BALANCEBODY01CWVAR.dart';
import '../../P3BALANCEBODYICP01/P3BALANCEBODY01ICPVAR.dart';
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
              B03: 'NAME', //f17
              B04: 'B02', //f16
              B05: 'B03', //f9
              B06: 'B04', //f30
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
          _data[i].f19.contains(P1BALANCEREQ01VAR.SEARCH) ||
          _data[i].f17.contains(P1BALANCEREQ01VAR.SEARCH) ||
          _data[i].f16.contains(P1BALANCEREQ01VAR.SEARCH) ||
          _data[i].f30.contains(P1BALANCEREQ01VAR.SEARCH)) {
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
        B03: '',
        B04: '',
        B05: '',
        B06: '',
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
        SELECTFUNC: (PO, CP, FG) {
          print(PO);
          print(CP);
          print(FG);

          if (CP == 'COATING WEIGHT') {
            P2BALANCEBODY01CWVAR.REQNO = PO;
            P2BALANCEBODY01CWVAR.TYPE = CP;
            CuPage = Page2();
            MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
          } else if (CP == 'ICP') {
            P3BALANCEBODY01ICPVAR.REQNO = PO;
            P3BALANCEBODY01ICPVAR.TYPE = CP;
            CuPage = Page3();
            MainBodyContext.read<ChangePage_Bloc>().add(ChangePage_nodrower());
          } else {
            //
            WORNINGpop(context, ["NO HAVE", "INSTRUMENT"], 100, 200);
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