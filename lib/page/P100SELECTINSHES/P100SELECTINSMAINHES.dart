import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../page1.dart';
import '../page31.dart';
import '../page41.dart';
import '../page51.dart';
import '../page56.dart';

class P100SELECTINSHESMAIN extends StatefulWidget {
  const P100SELECTINSHESMAIN({super.key});

  @override
  State<P100SELECTINSHESMAIN> createState() => _P100SELECTINSHESMAINState();
}

class _P100SELECTINSHESMAINState extends State<P100SELECTINSHESMAIN> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    USERDATA.INSMASTER = '';
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    // USERDATA.INSMASTER = 'HESBALANCE01';
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
                            image: AssetImage("assets/images/HESBA01.jpg"),
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
                          child: Text("HESBALANCE01"),
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
                    USERDATA.INSMASTER = 'HESBALANCE02';
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
                            image: AssetImage("assets/images/HESBA02.jpg"),
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
                        // color: Colors.red,
                        color: Colors.blue,
                        child: const Center(
                          child: Text("HESBALANCE02"),
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
                    USERDATA.INSMASTER = 'HESBALANCE03';
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
                            image: AssetImage("assets/images/HESBA03.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        width: 125,
                        color: Colors.blue,
                        child: const Center(
                          child: Text("HESBALANCE03"),
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
                    // USERDATA.INSMASTER = 'HESBALANCE04';
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
                            image: AssetImage("assets/images/HESBA04.jpg"),
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
                          child: Text("HESBALANCE04"),
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
                    USERDATA.INSMASTER = 'HESXRF01';
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
                            image: AssetImage("assets/images/XRFPrimussII.png"),
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
                    USERDATA.INSMASTER = 'HESTOC01';
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
                            image: AssetImage("assets/images/TOC-HES.png"),
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
                    USERDATA.INSMASTER = 'HESICP01';
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
                            image: AssetImage("assets/images/ICP-HES.png"),
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
                    USERDATA.INSMASTER = 'HESIC01';
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
                            image: AssetImage("assets/images/ICS-2100.png"),
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
                          child: Text("ICS-2100"),
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
                    USERDATA.INSMASTER = 'HESUV01';
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
                            image: AssetImage("assets/images/UV-HES.png"),
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
      ),
    );
  }
}
