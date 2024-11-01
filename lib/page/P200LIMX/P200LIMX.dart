import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import '../../bloc/cubit/00-01-ICPOCR_cubit.dart';
import '../../bloc/cubit/00-02-ICS2000OCR_cubit.dart';
import '../../bloc/cubit/NotificationEvent.dart';
import '../../data/global.dart';

late BuildContext P200LIMXUPDATEcontext;

class P200LIMXUPDATE extends StatefulWidget {
  const P200LIMXUPDATE({super.key});

  @override
  State<P200LIMXUPDATE> createState() => _P200LIMXUPDATEState();
}

class _P200LIMXUPDATEState extends State<P200LIMXUPDATE> {
  @override
  Widget build(BuildContext context) {
    P200LIMXUPDATEcontext = context;
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text("ICP(PDF)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['pdf', 'xps'],
                    );
                    Uint8List? imageByte;
                    if (picked != null) {
                      imageByte = picked.files.first.bytes;
                      // print(imageByte!.toList());
                      await context
                          .read<TESTINGOCR_Cubit>()
                          .FilePathTESTcu(imageByte!.toList(), "1234");
                      setState(() {});
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.red,
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text("UPLOAD"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text("TOC(txt)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['txt'],
                    );
                    Uint8List? imageByte;
                    if (picked != null) {
                      imageByte = picked.files.first.bytes;
                      const asciiDecoder = AsciiDecoder();
                      final result = asciiDecoder.convert(imageByte!.toList());
                      // print(result);
                      List<String> dataexList = result.split("\n");
                      // print(dataexList);
                      //----
                      final _whitespaceRE = RegExp(r"\s+");

                      String cleanupWhitespace(String input) =>
                          input.split(_whitespaceRE).join(",");
                      //----

                      List<DATASET2V> setdatablist = [];
                      for (var i = 0; i < dataexList.length; i++) {
                        if (dataexList[i].contains("RTB") ||
                            dataexList[i].contains("RTR")) {
                          // print(cleanupWhitespace(dataexList[i]));
                          List<String> dtList =
                              cleanupWhitespace(dataexList[i]).split(",");
                          DATASET2V setdatab = DATASET2V();
                          // print(dtList);

                          for (var j = 0; j < dtList.length; j++) {
                            // print(dtList[j].replaceAll(" ", ""));
                            String DATAgeteach = dtList[j].replaceAll(" ", "");

                            if (j == 2) {
                              //
                              // print(DATAgeteach);
                              List<String> dtList = DATAgeteach.split("/");
                              setdatab.code = DATAgeteach;
                              for (var k = 0; k < dtList.length; k++) {
                                if (k == 0) {
                                  setdatab.REQ = dtList[k];
                                  // print(setdatab.REQ);
                                }
                                if (k == 1) {
                                  setdatab.R = dtList[k];
                                  // print(setdatab.R);
                                }
                                if (k == 2) {
                                  List<String> dtListinlist =
                                      dtList[k].split("-");
                                  for (var l = 0;
                                      l < dtListinlist.length;
                                      l++) {
                                    if (l == 0) {
                                      setdatab.DI1 = dtListinlist[l];
                                      // print(setdatab.DI1);
                                    }
                                    if (l == 1) {
                                      setdatab.DI2 = dtListinlist[l];
                                      // print(setdatab.DI2);
                                    }
                                  }
                                }
                              }
                            }
                            if (j == 3) {
                              setdatab.DIM = dtList[j];
                              // print(setdatab.VALUE1);
                            }
                            if (j == 5) {
                              setdatab.VALUE1 = dtList[j];
                              // print(setdatab.VALUE1);
                            }
                            if (j == 6) {
                              setdatab.VALUE2 = dtList[j];
                              // print(setdatab.VALUE2);
                            }
                          }
                          setdatablist.add(setdatab);
                          //.remove("b")
                        }
                      }

                      List<Map<String, String>> outdataset = [];
                      for (var s = 0; s < setdatablist.length; s++) {
                        // print({
                        //   "code": setdatablist[s].code,
                        //   "REQ": setdatablist[s].REQ,
                        //   "R": setdatablist[s].R,
                        //   "DIM": setdatablist[s].DIM,
                        //   "DI1": setdatablist[s].DI1,
                        //   "DI2": setdatablist[s].DI2,
                        //   "TC": setdatablist[s].VALUE1,
                        //   "IC": setdatablist[s].VALUE2,
                        // });

                        outdataset.add({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "TC": setdatablist[s].VALUE1,
                          "IC": setdatablist[s].VALUE2,
                        });
                      }

                      Dio().post(
                        '${serverG}LIMX/TOCSETDATA',
                        data: {
                          "DATA": outdataset,
                        },
                      ).then((value) {
                        BlocProvider.of<BlocNotification>(contextGB)
                            .UpdateNotification("Complete", "Upload completed",
                                enumNotificationlist.Success);
                      });
                      // await context
                      //     .read<TESTINGOCR_Cubit>()
                      //     .FilePathTESTcu(imageByte!.toList(), "1234");
                      // setState(() {});
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.red,
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text("UPLOAD"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text("XRF(CSV)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['csv'],
                    );
                    Uint8List? imageByte;
                    if (picked != null) {
                      imageByte = picked.files.first.bytes;
                      const asciiDecoder = AsciiDecoder();
                      final result = asciiDecoder.convert(imageByte!.toList());
                      // print(result);
                      List<String> dataexList = result.split("\n");
                      // print(dataexList);
                      List<DATASET> setdatablist = [];
                      String type = '';
                      for (var i = 0; i < dataexList.length; i++) {
                        if (i == 0) {
                          print(dataexList[0]
                              .replaceAll('"', '')
                              .replaceAll(',', ''));
                          type = dataexList[0]
                              .replaceAll('"', '')
                              .replaceAll(',', '')
                              .replaceAll('\r', '');
                        }
                        if (dataexList[i].contains("RTB") ||
                            dataexList[i].contains("RTR")) {
                          List<String> dtList = dataexList[i].split(",");
                          DATASET setdatab = DATASET();

                          for (var j = 0; j < dtList.length; j++) {
                            // print(dtList[j].replaceAll(" ", ""));

                            String DATAgeteach = dtList[j].replaceAll(" ", "");
                            if (j == 0) {
                              //
                              setdatab.type = type;
                              setdatab.code = DATAgeteach.replaceAll('"', '');
                              List<String> dtList = DATAgeteach.split(".");
                              for (var k = 0; k < dtList.length; k++) {
                                if (k == 0) {
                                  setdatab.REQ = dtList[k].replaceAll('"', '');
                                }
                                if (k == 1) {
                                  setdatab.R = dtList[k].replaceAll('"', '');
                                }
                                if (k == 2) {
                                  setdatab.DI = dtList[k].replaceAll('"', '');
                                }
                              }
                            } else if (j == 3) {
                              setdatab.VALUE = dtList[j].replaceAll('"', '');
                            }
                          }
                          setdatablist.add(setdatab);
                        }
                      }
                      List<Map<String, String>> outdataset = [];
                      for (var s = 0; s < setdatablist.length; s++) {
                        // print({
                        //   "code": setdatablist[s].code,
                        //   "REQ": setdatablist[s].REQ,
                        //   "R": setdatablist[s].R,
                        //   "NO": setdatablist[s].DI,
                        //   "VALUE": setdatablist[s].VALUE,
                        // });
                        outdataset.add({
                          "type": setdatablist[s].type,
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "NO": setdatablist[s].DI,
                          "VALUE": setdatablist[s].VALUE,
                        });
                      }

                      Dio().post(
                        '${serverG}LIMX/XRFSETDATA',
                        data: {
                          "DATA": outdataset,
                        },
                      ).then((value) {
                        BlocProvider.of<BlocNotification>(contextGB)
                            .UpdateNotification("Complete", "Upload completed",
                                enumNotificationlist.Success);
                      });
                      // await context
                      //     .read<TESTINGOCR_Cubit>()
                      //     .FilePathTESTcu(imageByte!.toList(), "1234");
                      // setState(() {});
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.red,
                    child: const Center(
                      child: Text("UPLOAD"),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     children: [
          //       Container(
          //         height: 40,
          //         width: 200,
          //         color: Colors.blue,
          //         child: Center(
          //           child: Text("ICS-2000(PDF)"),
          //         ),
          //       ),
          //       InkWell(
          //         onTap: () async {
          //           var picked = await FilePicker.platform.pickFiles(
          //             type: FileType.custom,
          //             allowedExtensions: ['pdf', 'xps'],
          //           );
          //           Uint8List? imageByte;
          //           if (picked != null) {
          //             imageByte = picked.files.first.bytes;
          //             // print(imageByte!.toList());
          //             await context
          //                 .read<ICS2000OCR_Cubit>()
          //                 .FilePathTESTcu(imageByte!.toList(), "1234");
          //             setState(() {});
          //           }
          //         },
          //         child: Container(
          //           height: 40,
          //           width: 100,
          //           color: Colors.red,
          //           child: Container(
          //             height: 40,
          //             width: 100,
          //             color: Colors.red,
          //             child: const Center(
          //               child: Text("UPLOAD"),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text("Ti(UV)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['csv'],
                    );
                    Uint8List? imageByte;
                    if (picked != null) {
                      imageByte = picked.files.first.bytes;
                      const asciiDecoder = AsciiDecoder();
                      final result = asciiDecoder.convert(imageByte!.toList());
                      // print(result);
                      List<String> dataexList = result.split("\n");
                      // print(dataexList);
                      List<DATASETTIUV> setdatablist = [];
                      String type = '';
                      for (var i = 0; i < dataexList.length; i++) {
                        if (i == 0) {
                          print(dataexList[0]
                              .replaceAll('"', '')
                              .replaceAll(',', ''));
                          type = dataexList[0]
                              .replaceAll('"', '')
                              .replaceAll(',', '')
                              .replaceAll('\r', '');
                        }
                        if (dataexList[i].contains("RTB") ||
                            dataexList[i].contains("RTR")) {
                          List<String> dtList = dataexList[i].split(",");
                          DATASETTIUV setdatab = DATASETTIUV();

                          for (var j = 0; j < dtList.length; j++) {
                            // print(dtList[j].replaceAll(" ", ""));

                            String DATAgeteach = dtList[j].replaceAll(" ", "");
                            if (j == 0) {
                              //
                              // setdatab.type = type;
                              setdatab.code = DATAgeteach.replaceAll('"', '');
                              List<String> dtList = DATAgeteach.split("/");
                              for (var k = 0; k < dtList.length; k++) {
                                if (k == 0) {
                                  setdatab.REQ = dtList[k].replaceAll('"', '');
                                }
                                if (k == 1) {
                                  setdatab.R = dtList[k].replaceAll('"', '');
                                }
                                if (k == 2) {
                                  setdatab.DI1 = dtList[k].replaceAll('"', '');
                                }
                              }
                            } else if (j == 5) {
                              setdatab.VALUE = dtList[j].replaceAll('"', '');
                            } else if (j == 4) {
                              setdatab.DI2 = dtList[j].replaceAll('"', '');
                            }
                          }
                          setdatablist.add(setdatab);
                        }
                      }
                      // print(setdatablist);
                      List<Map<String, String>> outdataset = [];
                      for (var s = 0; s < setdatablist.length; s++) {
                        print({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "VALUE": setdatablist[s].VALUE,
                        });
                        outdataset.add({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "VALUE": setdatablist[s].VALUE,
                        });
                      }

                      Dio().post(
                        '${serverG}LIMX/UVSETDATA',
                        data: {
                          "DATA": outdataset,
                        },
                      ).then((value) {
                        print(value);
                        BlocProvider.of<BlocNotification>(contextGB)
                            .UpdateNotification("Complete", "Upload completed",
                                enumNotificationlist.Success);
                      });

                      // Dio().post(
                      //   '${serverG}LIMX/XRFSETDATA',
                      //   data: {
                      //     "DATA": outdataset,
                      //   },
                      // ).then((value) {
                      //   BlocProvider.of<BlocNotification>(contextGB)
                      //       .UpdateNotification("Complete", "Upload completed",
                      //           enumNotificationlist.Success);
                      // });
                      // await context
                      //     .read<TESTINGOCR_Cubit>()
                      //     .FilePathTESTcu(imageByte!.toList(), "1234");
                      // setState(() {});
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.red,
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text("UPLOAD"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 200,
                  color: Colors.blue,
                  child: Center(
                    child: Text("OCA(UV)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['csv'],
                    );
                    Uint8List? imageByte;
                    if (picked != null) {
                      imageByte = picked.files.first.bytes;
                      const asciiDecoder = AsciiDecoder();
                      final result = asciiDecoder.convert(imageByte!.toList());
                      // print(result);
                      List<String> dataexList = result.split("\n");
                      // print(dataexList);
                      List<DATASETOCA> setdatablist = [];
                      String type = '';
                      for (var i = 0; i < dataexList.length; i++) {
                        // if (i == 0) {
                        //   // print(dataexList[1]
                        //   //     .replaceAll('"', '')
                        //   //     .replaceAll(',', ''));
                        //   // type = dataexList[1]
                        //   //     .replaceAll('"', '')
                        //   //     .replaceAll(',', '');
                        //   // .replaceAll('\r', '');
                        // }
                        if (dataexList[i].contains("RTB") ||
                            dataexList[i].contains("RTR")) {
                          // print(dataexList[i]);
                          List<String> dtList = dataexList[i].split(",");
                          print(dtList);
                          DATASETOCA setdatab = DATASETOCA();

                          for (var j = 0; j < dtList.length; j++) {
                            // print(dtList[j].replaceAll(" ", ""));

                            String DATAgeteach = dtList[j].replaceAll(" ", "");
                            print(DATAgeteach);
                            if (j == 0) {
                              //
                              // setdatab.type = type;
                              setdatab.code = DATAgeteach.replaceAll('"', '');
                              List<String> dtList = DATAgeteach.split("/");
                              for (var k = 0; k < dtList.length; k++) {
                                if (k == 0) {
                                  setdatab.REQ = dtList[k].replaceAll('"', '');
                                }
                                if (k == 1) {
                                  setdatab.R = dtList[k].replaceAll('"', '');
                                }
                                if (k == 2) {
                                  setdatab.DI1 = dtList[k].replaceAll('"', '');
                                }
                              }
                            } else if (j == 1) {
                              setdatab.VALUE01 = dtList[j].replaceAll('"', '');
                            } else if (j == 2) {
                              setdatab.VALUE02 = dtList[j].replaceAll('"', '');
                            } else if (j == 3) {
                              setdatab.VALUE03 = dtList[j].replaceAll('"', '');
                            } else {}
                          }
                          setdatablist.add(setdatab);
                        }
                      }
                      // print(setdatablist);
                      List<Map<String, String>> outdataset = [];
                      for (var s = 0; s < setdatablist.length; s++) {
                        print({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "VALUE01": setdatablist[s].VALUE01,
                          "VALUE02": setdatablist[s].VALUE02,
                          "VALUE03": setdatablist[s].VALUE03,
                        });
                        outdataset.add({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "VALUE01": setdatablist[s].VALUE01,
                          "VALUE02": setdatablist[s].VALUE02,
                          "VALUE03": setdatablist[s].VALUE03,
                        });
                      }

                      Dio().post(
                        '${serverG}LIMX/OCASETDATA',
                        data: {
                          "DATA": outdataset,
                        },
                      ).then((value) {
                        BlocProvider.of<BlocNotification>(contextGB)
                            .UpdateNotification("Complete", "Upload completed",
                                enumNotificationlist.Success);
                      });
                      // await context
                      //     .read<TESTINGOCR_Cubit>()
                      //     .FilePathTESTcu(imageByte!.toList(), "1234");
                      // setState(() {});
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 100,
                    color: Colors.red,
                    child: Container(
                      height: 40,
                      width: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text("UPLOAD"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DATASET2V {
  DATASET2V({
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DIM = '',
    this.DI1 = '',
    this.DI2 = '',
    this.VALUE1 = '',
    this.VALUE2 = '',
  });
  String code;
  String REQ;
  String R;
  String DIM;
  String DI1;
  String DI2;
  String VALUE1;
  String VALUE2;
}

class DATASET {
  DATASET({
    this.type = '',
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DI = '',
    this.VALUE = '',
  });
  String type;
  String code;
  String REQ;
  String R;
  String DI;
  String VALUE;
}

class DATASETTIUV {
  DATASETTIUV({
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DIM = '',
    this.DI1 = '',
    this.DI2 = '',
    this.VALUE = '',
  });
  String code;
  String REQ;
  String R;
  String DIM;
  String DI1;
  String DI2;
  String VALUE;
}

class DATASETOCA {
  DATASETOCA({
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DIM = '',
    this.DI1 = '',
    this.DI2 = '',
    this.VALUE01 = '',
    this.VALUE02 = '',
    this.VALUE03 = '',
  });
  String code;
  String REQ;
  String R;
  String DIM;
  String DI1;
  String DI2;
  String VALUE01;
  String VALUE02;
  String VALUE03;
}
