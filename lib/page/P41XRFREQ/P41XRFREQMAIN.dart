import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/41-01-P41XRFGETDATA.dart';
import '../../bloc/BlocEvent/41-02-P41XRFREQGETSTR.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/dummydata.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../model/model.dart';
import '../P2BALANCEBODYCW/P2BALANCEBODYCWVAR.dart';
import '../P4BALANCEBODYSLUDGE/P4BALANCEBODYSLUDGEVAR.dart';
import '../page1.dart';
import '../page100.dart';
import '../page99.dart';
import 'TABLE/P41XRFREQTABLE.dart';

class P41XRFREQMAIN extends StatefulWidget {
  P41XRFREQMAIN({
    super.key,
    this.data,
    this.str,
  });
  List<dataset>? data;
  String? str;

  @override
  State<P41XRFREQMAIN> createState() => _P41XRFREQMAINState();
}

class _P41XRFREQMAINState extends State<P41XRFREQMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P41XRFREQGET_Bloc>().add(GETDATALISTFROMSAR());
    context.read<P41XRFREQGETSTR_Bloc>().add(P41XRFREQGETSTR_ROOM());
    // reserall_P4BALANCEBODYSLUDGEVAR();
    // reserall_P2BALANCEBODYCWVAR();
  }

  @override
  Widget build(BuildContext context) {
    String reqnoonroom = widget.str ?? '';
    String reqnoonroomR = '';

    if (reqnoonroom != '' && reqnoonroom != ' ') {
      reqnoonroomR = 'Using by ${reqnoonroom}';
    } else {
      reqnoonroomR = 'Ready to use';
    }

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
                child: Center(
                  child: SizedBox(
                    height: 80,
                    width: 800,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  if (USERDATA.Branch == 'BANGPOO') {
                                    CuPage = Page99();
                                    MainBodyContext.read<ChangePage_Bloc>()
                                        .add(ChangePage_nodrower());
                                    // return Page3();
                                  } else {
                                    CuPage = Page100();
                                    MainBodyContext.read<ChangePage_Bloc>()
                                        .add(ChangePage_nodrower());
                                  }
                                },
                                child: SizedBox(
                                  height: 60,
                                  width: 300,
                                  child: Center(
                                    child: Row(
                                      children: [
                                        const Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: EdgeInsets.only(right: 20),
                                            child: Icon(
                                              Icons.arrow_back_ios,
                                              weight: 100,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 8,
                                          child: Text(
                                            "${USERDATA.INSMASTER}",
                                            style: TextStyle(fontSize: 28),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              // Text(
                              //   "${USERDATA.INSMASTER}",
                              //   style: TextStyle(fontSize: 28),
                              // ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                reqnoonroomR,
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<P41XRFREQGETSTR_Bloc>()
                                          .add(P41XRFREQGETSTR_ROOM());
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        color: Colors.yellow,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: const Center(
                                        child: Text("Refresh"),
                                      ),
                                    ),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      context
                                          .read<P41XRFREQGETSTR_Bloc>()
                                          .add(P41XRFREQGETSTR_CLEARROOM());
                                      context
                                          .read<P41XRFREQGETSTR_Bloc>()
                                          .add(P41XRFREQGETSTR_ROOM());
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 100,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        color: Colors.red,
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      ),
                                      child: const Center(
                                        child: Text("CLEAR ROOM"),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
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
                child: P41XRFREQTABLE(sardata: widget.data),
              ),
            ),
          )
        ],
      ),
    );
  }
}
