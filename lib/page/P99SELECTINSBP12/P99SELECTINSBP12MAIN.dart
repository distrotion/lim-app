// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../bloc/BlocEvent/ChangePageEvent.dart';
// import '../../data/global.dart';
// import '../../mainBody.dart';
// import '../page1.dart';
// import '../page11.dart';
// import '../page21.dart';
// import '../page31.dart';
// import '../page41.dart';
// import '../page51.dart';
// import '../page56.dart';

// class P99SELECTINSBP12MAIN extends StatefulWidget {
//   const P99SELECTINSBP12MAIN({super.key});

//   @override
//   State<P99SELECTINSBP12MAIN> createState() => _P99SELECTINSBP12MAINState();
// }

// class _P99SELECTINSBP12MAINState extends State<P99SELECTINSBP12MAIN> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     USERDATA.INSMASTER = '';
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12BALANCE01';
//                   CuPage = Page1();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/BP12BA01.jpg"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("BA01"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12BALANCE02';
//                   CuPage = Page1();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/BP12BA02.jpg"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       // color: Colors.blue,
//                       color: Colors.red,
//                       child: const Center(
//                         child: Text("BA02"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12BALANCE03';
//                   CuPage = Page1();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/BP12BA03.jpg"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       child: const Center(
//                         child: Text("BA03"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       USERDATA.INSMASTER = 'BP12FF01';
//                       CuPage = Page21();
//                       MainBodyContext.read<ChangePage_Bloc>()
//                           .add(ChangePage_nodrower());
//                     },
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 78,
//                           width: 128.0,
//                           decoration: const BoxDecoration(
//                             // color: Colors.white,
//                             // color: Colors.red,
//                             image: DecorationImage(
//                               image: AssetImage("assets/images/BP12FF01.jpg"),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Container(
//                           height: 50,
//                           width: 125,
//                           color: Colors.blue,
//                           // color: Colors.red,
//                           child: const Center(
//                             child: Text("Ion Meter(FF01)"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: InkWell(
//                     onTap: () {
//                       USERDATA.INSMASTER = 'BP12PH01';
//                       CuPage = Page21();
//                       MainBodyContext.read<ChangePage_Bloc>()
//                           .add(ChangePage_nodrower());
//                     },
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 78,
//                           width: 128.0,
//                           decoration: const BoxDecoration(
//                             // color: Colors.white,
//                             // color: Colors.red,
//                             image: DecorationImage(
//                               image: AssetImage("assets/images/BP12FF01.jpg"),
//                               fit: BoxFit.fitHeight,
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 15,
//                         ),
//                         Container(
//                           height: 50,
//                           width: 125,
//                           // color: Colors.blue,
//                           color: Colors.red,
//                           child: const Center(
//                             child: Text("pH Meter(PH01)"),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12XRF01';
//                   CuPage = Page41();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         // color: Colors.white,
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/XRF.png"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("XRF Primus II"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//         Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12TOC01';
//                   CuPage = Page31();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/TOC.png"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("TOC"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12ICP01';
//                   CuPage = Page31();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/ICP.png"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("ICP Perkin"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12ICS2000';
//                   CuPage = Page51();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/ICS-2000.png"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("ICS 2000"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12ICS8100';
//                   CuPage = Page51();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/IC-8100EX.png"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("IC 8100EX"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   USERDATA.INSMASTER = 'BP12UV01';
//                   //BP12OCA01
//                   CuPage = Page56();
//                   MainBodyContext.read<ChangePage_Bloc>()
//                       .add(ChangePage_nodrower());
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       height: 78,
//                       width: 128.0,
//                       decoration: const BoxDecoration(
//                         color: Colors.white,
//                         // color: Colors.red,
//                         image: DecorationImage(
//                           image: AssetImage("assets/images/UV-BP.png"),
//                           fit: BoxFit.fitHeight,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 15,
//                     ),
//                     Container(
//                       height: 50,
//                       width: 125,
//                       color: Colors.blue,
//                       // color: Colors.red,
//                       child: const Center(
//                         child: Text("UV"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lim_app/bloc/BlocEvent/99-01-P99SELECTINSBP12MAIN.dart';

import '../../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../P300CAL/P300CALVAR.dart';
import '../page1.dart';
import '../page11.dart';
import '../page21.dart';
import '../page31.dart';
import '../page41.dart';
import '../page51.dart';
import '../page56.dart';

late BuildContext P99SELECTINSBP12MAINcontext;

class P99SELECTINSBP12MAIN extends StatefulWidget {
  P99SELECTINSBP12MAIN({
    super.key,
    this.data,
  });
  List<P99SELECTINSBP12MAINclass>? data;

  @override
  State<P99SELECTINSBP12MAIN> createState() => _P99SELECTINSBP12MAINState();
}

class _P99SELECTINSBP12MAINState extends State<P99SELECTINSBP12MAIN> {
  @override
  void initState() {
    super.initState();
    getRefreshData(); // เรียกใช้ async function ที่ดึง API
    USERDATA.INSMASTER = '';
  }

  void getRefreshData() async {
    try {
      final response = await Dio().post(
        "${serverNRBP12}GetDataCal",
        data: {
          "DateTime": P300CALVAR.timefornodered,
        },
      );

      if (response.statusCode == 200) {
        setState(() {
          P300CALVAR.BA01 = response.data[0]['BA01'];
          P300CALVAR.BA03 = response.data[0]['BA03'];
        });
      }
    } catch (e) {
      print("Error fetching Refresh data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    P99SELECTINSBP12MAINcontext = context;
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: P300CALVAR.BA01.isNotEmpty && P300CALVAR.BA01 == 'NG'
                    ? null
                    : () {
                        USERDATA.INSMASTER = 'BP12BALANCE01';
                        CuPage = Page1();
                        MainBodyContext.read<ChangePage_Bloc>()
                            .add(ChangePage_nodrower());
                      },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("assets/images/BP12BA01.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color:
                          P300CALVAR.BA01.isNotEmpty && P300CALVAR.BA01 == 'OK'
                              ? Colors.blue
                              : Colors.red,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("T 071-002"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12BALANCE02';
                  CuPage = Page1();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/BP12BA02.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      // color: Colors.blue,
                      color: Colors.red,
                      child: const Center(
                        child: Text("CTC-BAL-001"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: P300CALVAR.BA03.isNotEmpty && P300CALVAR.BA03 == 'NG'
                    ? null
                    : () {
                        USERDATA.INSMASTER = 'BP12BALANCE03';
                        CuPage = Page1();
                        MainBodyContext.read<ChangePage_Bloc>()
                            .add(ChangePage_nodrower());
                      },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/BP12BA03.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color:
                          P300CALVAR.BA03.isNotEmpty && P300CALVAR.BA03 == 'OK'
                              ? Colors.blue
                              : Colors.red,
                      child: const Center(
                        child: Text("CTC-BAL-002"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12FF01';
                  CuPage = Page21();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        // color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/BP12FF01.jpg"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("Ion Meter(FF01)"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12XRF01';
                  CuPage = Page41();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        // color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/XRF.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("XRF Primus II"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12TOC01';
                  CuPage = Page31();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/TOC.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("TOC"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12ICP01';
                  CuPage = Page31();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/ICP.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("ICP Perkin"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12ICS2000';
                  CuPage = Page51();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/ICS-2000.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("ICS 2000"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12ICS2100';
                  CuPage = Page51();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/ICS-2000.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("ICS 2100"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12ICS8100';
                  CuPage = Page51();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/IC-8100EX.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("IC 8100EX"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  USERDATA.INSMASTER = 'BP12UV01';
                  //BP12OCA01
                  CuPage = Page56();
                  MainBodyContext.read<ChangePage_Bloc>()
                      .add(ChangePage_nodrower());
                },
                child: Row(
                  children: [
                    Container(
                      height: 78,
                      width: 128.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        // color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage("assets/images/UV-BP.png"),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      height: 50,
                      width: 125,
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("UV"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
