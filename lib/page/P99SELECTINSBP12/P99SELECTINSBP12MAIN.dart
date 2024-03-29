import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../page1.dart';
import '../page11.dart';
import '../page21.dart';

class P99SELECTINSBP12MAIN extends StatefulWidget {
  const P99SELECTINSBP12MAIN({super.key});

  @override
  State<P99SELECTINSBP12MAIN> createState() => _P99SELECTINSBP12MAINState();
}

class _P99SELECTINSBP12MAINState extends State<P99SELECTINSBP12MAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    USERDATA.INSMASTER = '';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
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
                      color: Colors.blue,
                      // color: Colors.red,
                      child: const Center(
                        child: Text("BA01"),
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
                  // USERDATA.INSMASTER = 'BP12BALANCE02';
                  // CuPage = Page1();
                  // MainBodyContext.read<ChangePage_Bloc>()
                  //     .add(ChangePage_nodrower());
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
                        child: Text("BA02"),
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
                      color: Colors.blue,
                      child: const Center(
                        child: Text("BA03"),
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InkWell(
            //     onTap: () {
            //       USERDATA.INSMASTER = 'BP12PH01';
            //       CuPage = Page11();
            //       MainBodyContext.read<ChangePage_Bloc>()
            //           .add(ChangePage_nodrower());
            //     },
            //     child: Row(
            //       children: [
            //         Container(
            //           height: 78,
            //           width: 128.0,
            //           decoration: const BoxDecoration(
            //             // color: Colors.white,
            //             color: Colors.red,
            //             // image: DecorationImage(
            //             //   image: AssetImage("assets/images/BP12BA01.jpg"),
            //             //   fit: BoxFit.fitHeight,
            //             // ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 15,
            //         ),
            //         Container(
            //           height: 50,
            //           width: 125,
            //           color: Colors.blue,
            //           // color: Colors.red,
            //           child: const Center(
            //             child: Text("PH Meter(01)"),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
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
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: InkWell(
            //     onTap: () {
            //       USERDATA.INSMASTER = 'BP12CL01';
            //       CuPage = Page21();
            //       MainBodyContext.read<ChangePage_Bloc>()
            //           .add(ChangePage_nodrower());
            //     },
            //     child: Row(
            //       children: [
            //         Container(
            //           height: 78,
            //           width: 128.0,
            //           decoration: const BoxDecoration(
            //             // color: Colors.white,
            //             color: Colors.red,
            //             // image: DecorationImage(
            //             //   image: AssetImage("assets/images/BP12BA01.jpg"),
            //             //   fit: BoxFit.fitHeight,
            //             // ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 15,
            //         ),
            //         Container(
            //           height: 50,
            //           width: 125,
            //           color: Colors.blue,
            //           // color: Colors.red,
            //           child: const Center(
            //             child: Text("Ion Meter(CL01)"),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
