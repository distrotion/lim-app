import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/01-01-P1BALANCEREQ01GET.dart';
import '../../bloc/BlocEvent/01-02-P1BALANCEREQ01GETSTR.dart';
import '../../data/dummydata.dart';
import '../../model/model.dart';
import 'TABLE/P1BALANCEREQ01TABLE.dart';

class P1BALANCEREQ01MAIN extends StatefulWidget {
  P1BALANCEREQ01MAIN({
    super.key,
    this.data,
    this.str,
  });
  List<dataset>? data;
  String? str;

  @override
  State<P1BALANCEREQ01MAIN> createState() => _P1BALANCEREQ01MAINState();
}

class _P1BALANCEREQ01MAINState extends State<P1BALANCEREQ01MAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<P1BALANCEREQ01GET_Bloc>().add(GETDATALISTFROMSAR());
    context.read<P1BALANCEREQ01GETSTR_Bloc>().add(P1BALANCEREQ01GETSTR_ROOM());
  }

  @override
  Widget build(BuildContext context) {
    String reqnoonroom = widget.str ?? '';
    String reqnoonroomR = '';

    if (reqnoonroom != '') {
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
                        const Expanded(
                          flex: 2,
                          child: Text(
                            "BALANCE-01 (CHM-01)",
                            style: TextStyle(fontSize: 28),
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
                                          .read<P1BALANCEREQ01GETSTR_Bloc>()
                                          .add(P1BALANCEREQ01GETSTR_ROOM());
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
                                          .read<P1BALANCEREQ01GETSTR_Bloc>()
                                          .add(
                                              P1BALANCEREQ01GETSTR_CLEARROOM());
                                      context
                                          .read<P1BALANCEREQ01GETSTR_Bloc>()
                                          .add(P1BALANCEREQ01GETSTR_ROOM());
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
                child: P1BALANCEREQ01TABLE(sardata: widget.data),
              ),
            ),
          )
        ],
      ),
    );
  }
}
