import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:excel/excel.dart';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';
import '../../bloc/cubit/00-01-ICPOCR_cubit.dart';
import '../../bloc/cubit/00-02-ICS2000OCR_cubit.dart';
import '../../bloc/cubit/00-03-IC8100EX.dart';
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
                    child: Text("Ti(UV)(csv)"),
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
                              List<String> dtList = DATAgeteach.split(".");
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
                    child: Text("OCA(UV)(csv)"),
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
                              List<String> dtList = DATAgeteach.split(".");
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

                      //----------------//----------------

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
                    child: Text("IC-8100EX(xlsx)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['xlsx'],
                    );
                    Uint8List? dataByte;
                    if (picked != null) {
                      //
                      dataByte = picked.files.first.bytes;
                      var excel = Excel.decodeBytes(dataByte!.toList());

                      // print(excel);

                      var datarow = excel.tables["Sheet1"]?.rows ?? [];
                      // DATASETICS8100 setdatab = DATASETICS8100();
                      List<DATASETICS8100> setdatablist = [];
                      String settingdata = '';

                      for (var i = 0; i < datarow.length; i++) {
                        DATASETICS8100 setdatab = DATASETICS8100();
                        for (var j = 0; j < datarow[i].length; j++) {
                          String data = (datarow[i][j]?.value ?? '').toString();
                          if (datarow[i].length <= 3) {
                            if (j == 3) {
                              print("${data}   ");
                              if (data.contains("Fluoride") ||
                                  data.contains("F")) {
                                print("${data}   ");
                                settingdata = data;
                              }
                              if (data.contains("Chloride") ||
                                  data.contains("Cl")) {
                                print("${data}   ");
                                settingdata = data;
                              }
                              if (data.contains("Nitrate") ||
                                  data.contains("NO3")) {
                                print("${data}   ");
                                settingdata = data;
                              }
                              if (data.contains("Sulphate") ||
                                  data.contains("SO4")) {
                                print("${data}   ");
                                settingdata = data;
                              }
                              if (data.contains("Phosphate") ||
                                  data.contains("PO4")) {
                                print("${data}   ");
                                settingdata = data;
                              }
                              if (data.contains("P2O7") ||
                                  data.contains("P2O7")) {
                                print("${data}   ");
                                settingdata = data;
                              }
                            }
                            if (j == 2) {
                              setdatab.code = data;
                              // print(datarow[i][j]?.value);
                              // setdatab.code = data;
                              List<String> dtList = data.split("/");
                              if (data.contains("RTB") ||
                                  data.contains("RTR")) {
                                // print(
                                //     "${data}   : ${(datarow[i][5]?.value ?? '')} ");
                                for (var k = 0; k < dtList.length; k++) {
                                  if (k == 0) {
                                    setdatab.REQ =
                                        dtList[k].replaceAll('"', '');
                                    // print(setdatab.REQ);
                                  }
                                  if (k == 1) {
                                    setdatab.R = dtList[k].replaceAll('"', '');
                                    // print(setdatab.R);
                                  }
                                  if (k == 2) {
                                    setdatab.DI1 =
                                        dtList[k].replaceAll('"', '');
                                    // print(setdatab.DI1);
                                  }
                                }

                                // setdatab.code = data;
                                // setdatab.Fluoride =
                                //     (datarow[i][3]?.value ?? '').toString();
                                // print(setdatab.code);
                                // print(setdatab.value);
                                // print(settingdata);

                                if (settingdata.contains("Fluoride") ||
                                    settingdata.contains("F")) {
                                  print(
                                      "${data}  ${(datarow[i][3]?.value ?? '')} ");
                                  setdatab.Fluoride =
                                      (datarow[i][3]?.value ?? '').toString();
                                }
                                if (settingdata.contains("Chloride") ||
                                    settingdata.contains("Cl")) {
                                  print(
                                      "${data}   ${(datarow[i][3]?.value ?? '')} ");
                                  setdatab.Chloride =
                                      (datarow[i][3]?.value ?? '').toString();
                                }
                                if (settingdata.contains("Nitrate") ||
                                    settingdata.contains("NO3")) {
                                  print(
                                      "${data}   ${(datarow[i][3]?.value ?? '')} ");
                                  setdatab.Nitrate =
                                      (datarow[i][3]?.value ?? '').toString();
                                }
                                if (settingdata.contains("Sulphate") ||
                                    settingdata.contains("SO4")) {
                                  print(
                                      "${data}   ${(datarow[i][3]?.value ?? '')} ");
                                  setdatab.Sulphate =
                                      (datarow[i][3]?.value ?? '').toString();
                                }
                                if (settingdata.contains("Phosphate") ||
                                    settingdata.contains("PO4")) {
                                  print(
                                      "${data}   ${(datarow[i][3]?.value ?? '')} ");
                                  setdatab.Phosphate =
                                      (datarow[i][3]?.value ?? '').toString();
                                }
                                if (settingdata.contains("P2O7") ||
                                    settingdata.contains("P2O7")) {
                                  print(
                                      "${data}   ${(datarow[i][3]?.value ?? '')} ");
                                  setdatab.P2O7 =
                                      (datarow[i][3]?.value ?? '').toString();
                                }
                              }
                            }
                          } else {
                            if (j == 2) {
                              setdatab.code = data;
                              // print(datarow[i][j]?.value);
                              // setdatab.code = data;
                              List<String> dtList = data.split("/");
                              if (data.contains("RTB") ||
                                  data.contains("RTR")) {
                                // print(
                                //     "${data}   : ${(datarow[i][5]?.value ?? '')} ");
                                for (var k = 0; k < dtList.length; k++) {
                                  if (k == 0) {
                                    setdatab.REQ =
                                        dtList[k].replaceAll('"', '');
                                    // print(setdatab.REQ);
                                  }
                                  if (k == 1) {
                                    setdatab.R = dtList[k].replaceAll('"', '');
                                    // print(setdatab.R);
                                  }
                                  if (k == 2) {
                                    setdatab.DI1 =
                                        dtList[k].replaceAll('"', '');
                                    // print(setdatab.DI1);
                                  }
                                }

                                // setdatab.code = data;
                                // setdatab.Fluoride =
                                //     (datarow[i][3]?.value ?? '').toString();
                                // print(setdatab.code);
                                // print(setdatab.value);
                                // print(settingdata);

                                // if (settingdata.contains("Fluoride") ||
                                //     settingdata.contains("F")) {
                                print(
                                    "${data}  ${(datarow[i][3]?.value ?? '')} ");
                                setdatab.Fluoride =
                                    (datarow[i][3]?.value ?? '').toString();
                                // }
                                // if (settingdata.contains("Chloride") ||
                                //     settingdata.contains("Cl")) {
                                print(
                                    "${data}   ${(datarow[i][4]?.value ?? '')} ");
                                setdatab.Chloride =
                                    (datarow[i][4]?.value ?? '').toString();
                                // }
                                // if (settingdata.contains("Nitrate") ||
                                //     settingdata.contains("NO3")) {
                                print(
                                    "${data}   ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.Nitrate =
                                    (datarow[i][5]?.value ?? '').toString();
                                // }
                                // if (settingdata.contains("Sulphate") ||
                                //     settingdata.contains("SO4")) {
                                print(
                                    "${data}   ${(datarow[i][7]?.value ?? '')} ");
                                setdatab.Sulphate =
                                    (datarow[i][7]?.value ?? '').toString();
                                // }
                                // if (settingdata.contains("Phosphate") ||
                                //     settingdata.contains("PO4")) {
                                print(
                                    "${data}   ${(datarow[i][6]?.value ?? '')} ");
                                setdatab.Phosphate =
                                    (datarow[i][6]?.value ?? '').toString();
                                // }
                                // if (settingdata.contains("P2O7") ||
                                //     settingdata.contains("P2O7")) {
                                // print(
                                //     "${data}   ${(datarow[i][3]?.value ?? '')} ");
                                // setdatab.P2O7 =
                                //     (datarow[i][3]?.value ?? '').toString();
                                // }
                              }
                            }
                          }
                          if (setdatab.REQ.contains("RTB") ||
                              setdatab.REQ.contains("RTR") &&
                                  j == datarow[i].length - 1) {
                            setdatablist.add(setdatab);
                          }
                        }
                      }
                      print(setdatablist.length);

                      List<Map<String, String>> outdataset = [];
                      for (var s = 0; s < setdatablist.length; s++) {
                        print({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "Fluoride": setdatablist[s].Fluoride,
                          "Chloride": setdatablist[s].Chloride,
                          "Nitrate": setdatablist[s].Nitrate,
                          "Sulphate": setdatablist[s].Sulphate,
                          "Phosphate": setdatablist[s].Phosphate,
                          "P2O7": setdatablist[s].P2O7,
                        });
                        outdataset.add({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "Fluoride": setdatablist[s].Fluoride,
                          "Chloride": setdatablist[s].Chloride,
                          "Nitrate": setdatablist[s].Nitrate,
                          "Sulphate": setdatablist[s].Sulphate,
                          "Phosphate": setdatablist[s].Phosphate,
                          "P2O7": setdatablist[s].P2O7,
                        });
                      }

                      Dio().post(
                        '${serverG}LIMX/IC8100EXSETDATA',
                        data: {
                          "DATA": outdataset,
                        },
                      ).then((value) {
                        BlocProvider.of<BlocNotification>(contextGB)
                            .UpdateNotification("Complete", "Upload completed",
                                enumNotificationlist.Success);
                      });

                      // List<String> dataexList = result.split("\n");
                      // print(imageByte!.toList());
                      // await context
                      //     .read<IC8100EX_Cubit>()
                      //     .FilePathTESTcu(dataByte!.toList(), "1234");
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
                    child: Text("ICS2000(xlsx)"),
                  ),
                ),
                InkWell(
                  onTap: () async {
                    var picked = await FilePicker.platform.pickFiles(
                      type: FileType.custom,
                      allowedExtensions: ['xlsx'],
                    );
                    Uint8List? dataByte;
                    if (picked != null) {
                      dataByte = picked.files.first.bytes;
                      var excel = Excel.decodeBytes(dataByte!.toList());

                      // print(excel);
                      // for (var table in excel.tables.keys) {
                      // print(table); //sheet Name
                      // print(excel.tables[table]?.maxColumns);
                      // print(excel.tables[table]?.maxRows);
                      // if (table == "Sheet1") {
                      // for (var row in excel.tables["Sheet1"]?.rows ?? []) {
                      //   //
                      //   for (var cell in row) {
                      //     print(cell?.value);
                      //   }
                      // }
                      var datarow = excel.tables["Sheet1"]?.rows ?? [];
                      List<DATASETICS2000> setdatablist = [];
                      String settingdata = '';
                      for (var i = 0; i < datarow.length; i++) {
                        DATASETICS2000 setdatab = DATASETICS2000();
                        for (var j = 0; j < datarow[i].length; j++) {
                          String data = (datarow[i][j]?.value ?? '').toString();

                          if (j == 2) {
                            // print("${data}   ");
                            if (data.contains("Fluoride")) {
                              print("${data}   ");
                              settingdata = data;
                            }
                            if (data.contains("Chloride")) {
                              print("${data}   ");
                              settingdata = data;
                            }
                            if (data.contains("Nitrate")) {
                              print("${data}   ");
                              settingdata = data;
                            }
                            if (data.contains("Sulphate")) {
                              print("${data}   ");
                              settingdata = data;
                            }
                            if (data.contains("Phosphate")) {
                              print("${data}   ");
                              settingdata = data;
                            }

                            if (data.contains("P2O7")) {
                              print("${data}   ");
                              settingdata = data;
                            }
                          }
                          if (j == 1) {
                            // print(datarow[i][j]?.value);
                            setdatab.code = data;
                            List<String> dtList = data.split("/");
                            if (data.contains("RTB") || data.contains("RTR")) {
                              // print(
                              //     "${data}   : ${(datarow[i][5]?.value ?? '')} ");
                              for (var k = 0; k < dtList.length; k++) {
                                if (k == 0) {
                                  setdatab.REQ = dtList[k].replaceAll('"', '');
                                  // print(setdatab.REQ);
                                }
                                if (k == 1) {
                                  setdatab.R = dtList[k].replaceAll('"', '');
                                  // print(setdatab.R);
                                }
                                if (k == 2) {
                                  setdatab.DI1 = dtList[k].replaceAll('"', '');
                                  // print(setdatab.DI1);
                                }
                              }
                              if (settingdata.contains("Fluoride")) {
                                print(
                                    "${data}  ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.Fluoride =
                                    (datarow[i][5]?.value ?? '').toString();
                              }
                              if (settingdata.contains("Chloride")) {
                                print(
                                    "${data}   ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.Chloride =
                                    (datarow[i][5]?.value ?? '').toString();
                              }
                              if (settingdata.contains("Nitrate")) {
                                print(
                                    "${data}   ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.Nitrate =
                                    (datarow[i][5]?.value ?? '').toString();
                              }
                              if (settingdata.contains("Sulphate")) {
                                print(
                                    "${data}   ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.Sulphate =
                                    (datarow[i][5]?.value ?? '').toString();
                              }
                              if (settingdata.contains("Phosphate")) {
                                print(
                                    "${data}   ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.Phosphate =
                                    (datarow[i][5]?.value ?? '').toString();
                              }
                              if (settingdata.contains("P2O7")) {
                                print(
                                    "${data}   ${(datarow[i][5]?.value ?? '')} ");
                                setdatab.P2O7 =
                                    (datarow[i][5]?.value ?? '').toString();
                              }
                            }
                          }
                        }
                        // setdatablist.add(setdatab);
                        if (setdatab.REQ.contains("RTB") ||
                            setdatab.REQ.contains("RTR")) {
                          setdatablist.add(setdatab);
                        }
                      }
                      print(setdatablist.length);

                      List<Map<String, String>> outdataset = [];
                      for (var s = 0; s < setdatablist.length; s++) {
                        print({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "Fluoride": setdatablist[s].Fluoride,
                          "Chloride": setdatablist[s].Chloride,
                          "Nitrate": setdatablist[s].Nitrate,
                          "Sulphate": setdatablist[s].Sulphate,
                          "Phosphate": setdatablist[s].Phosphate,
                          "P2O7": setdatablist[s].P2O7,
                        });
                        outdataset.add({
                          "code": setdatablist[s].code,
                          "REQ": setdatablist[s].REQ,
                          "R": setdatablist[s].R,
                          "DIM": setdatablist[s].DIM,
                          "DI1": setdatablist[s].DI1,
                          "DI2": setdatablist[s].DI2,
                          "Fluoride": setdatablist[s].Fluoride,
                          "Chloride": setdatablist[s].Chloride,
                          "Nitrate": setdatablist[s].Nitrate,
                          "Sulphate": setdatablist[s].Sulphate,
                          "Phosphate": setdatablist[s].Phosphate,
                          "P2O7": setdatablist[s].P2O7,
                        });
                      }
                      Dio().post(
                        '${serverG}LIMX/ICS2000SETDATA',
                        data: {
                          "DATA": outdataset,
                        },
                      ).then((value) {
                        BlocProvider.of<BlocNotification>(contextGB)
                            .UpdateNotification("Complete", "Upload completed",
                                enumNotificationlist.Success);
                      });

                      // }
                      // }
                      // const asciiDecoder = AsciiDecoder();
                      // final result = asciiDecoder.convert(dataByte!.toList());
                      // const asciiDecoder = AsciiDecoder();
                      // final result = asciiDecoder.convert(dataByte!.toList());
                      // print(result);
                      // List<String> dataexList = result.split("\n");
                      // print(dataexList);

                      // print(result);
                      // List<String> dataexList = result.split("\n");
                      // print(dataexList);
                      // List<DATASETOCA> setdatablist = [];
                      // String type = '';
                      // for (var i = 0; i < dataexList.length; i++) {

                      //   if (dataexList[i].contains("RTB") ||
                      //       dataexList[i].contains("RTR")) {
                      //     // print(dataexList[i]);
                      //     List<String> dtList = dataexList[i].split(",");
                      //     print(dtList);
                      //     DATASETOCA setdatab = DATASETOCA();

                      //     for (var j = 0; j < dtList.length; j++) {
                      //       // print(dtList[j].replaceAll(" ", ""));

                      //       String DATAgeteach = dtList[j].replaceAll(" ", "");
                      //       print(DATAgeteach);
                      //       if (j == 0) {
                      //         //
                      //         // setdatab.type = type;
                      //         setdatab.code = DATAgeteach.replaceAll('"', '');
                      //         List<String> dtList = DATAgeteach.split("/");
                      //         for (var k = 0; k < dtList.length; k++) {
                      //           if (k == 0) {
                      //             setdatab.REQ = dtList[k].replaceAll('"', '');
                      //           }
                      //           if (k == 1) {
                      //             setdatab.R = dtList[k].replaceAll('"', '');
                      //           }
                      //           if (k == 2) {
                      //             setdatab.DI1 = dtList[k].replaceAll('"', '');
                      //           }
                      //         }
                      //       } else if (j == 1) {
                      //         setdatab.VALUE01 = dtList[j].replaceAll('"', '');
                      //       } else if (j == 2) {
                      //         setdatab.VALUE02 = dtList[j].replaceAll('"', '');
                      //       } else if (j == 3) {
                      //         setdatab.VALUE03 = dtList[j].replaceAll('"', '');
                      //       } else {}
                      //     }
                      //     setdatablist.add(setdatab);
                      //   }
                      // }
                      // // print(setdatablist);
                      // List<Map<String, String>> outdataset = [];
                      // for (var s = 0; s < setdatablist.length; s++) {
                      //   print({
                      //     "code": setdatablist[s].code,
                      //     "REQ": setdatablist[s].REQ,
                      //     "R": setdatablist[s].R,
                      //     "DIM": setdatablist[s].DIM,
                      //     "DI1": setdatablist[s].DI1,
                      //     "DI2": setdatablist[s].DI2,
                      //     "VALUE01": setdatablist[s].VALUE01,
                      //     "VALUE02": setdatablist[s].VALUE02,
                      //     "VALUE03": setdatablist[s].VALUE03,
                      //   });
                      //   outdataset.add({
                      //     "code": setdatablist[s].code,
                      //     "REQ": setdatablist[s].REQ,
                      //     "R": setdatablist[s].R,
                      //     "DIM": setdatablist[s].DIM,
                      //     "DI1": setdatablist[s].DI1,
                      //     "DI2": setdatablist[s].DI2,
                      //     "VALUE01": setdatablist[s].VALUE01,
                      //     "VALUE02": setdatablist[s].VALUE02,
                      //     "VALUE03": setdatablist[s].VALUE03,
                      //   });
                      // }

                      // Dio().post(
                      //   '${serverG}LIMX/OCASETDATA',
                      //   data: {
                      //     "DATA": outdataset,
                      //   },
                      // ).then((value) {
                      //   BlocProvider.of<BlocNotification>(contextGB)
                      //       .UpdateNotification("Complete", "Upload completed",
                      //           enumNotificationlist.Success);
                      // });
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

class DATASETICS2000 {
  DATASETICS2000({
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DIM = '',
    this.DI1 = '',
    this.DI2 = '',
    this.Fluoride = '',
    this.Chloride = '',
    this.Nitrate = '',
    this.Sulphate = '',
    this.Phosphate = '',
    this.P2O7 = '',
  });
  String code;
  String REQ;
  String R;
  String DIM;
  String DI1;
  String DI2;
  String Fluoride;
  String Chloride;
  String Nitrate;
  String Sulphate;
  String Phosphate;
  String P2O7;
}

class DATASETICS8100 {
  DATASETICS8100({
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DIM = '',
    this.DI1 = '',
    this.DI2 = '',
    this.Fluoride = '',
    this.Chloride = '',
    this.Nitrate = '',
    this.Sulphate = '',
    this.Phosphate = '',
    this.P2O7 = '',
  });
  String code;
  String REQ;
  String R;
  String DIM;
  String DI1;
  String DI2;
  String Fluoride;
  String Chloride;
  String Nitrate;
  String Sulphate;
  String Phosphate;
  String P2O7;
}
