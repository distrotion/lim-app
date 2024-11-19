import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:typed_data';
import '../../data/global.dart';
import '../../mainBody.dart';
import 'package:http/http.dart' as http;

import '../../page/P200LIMX/P200LIMX.dart';
import '../../widget/common/Loading.dart';
import '../BlocEvent/ChangePageEvent.dart';
import 'package:http_parser/http_parser.dart';

import '../cubit/NotificationEvent.dart';

//import '../cubit/NotificationEvent.dart';

//P200LIMXUPDATEcontext

String ocrserver = 'http://172.23.10.51:6001/ocr';
// String ocrserver = 'http://127.0.0.1:15010/test';

class IC8100EX_Cubit extends Cubit<IC8100EXdataout> {
  /// {@macro brightness_cubit}
  IC8100EX_Cubit() : super(IC8100EXdataout());

  /// Toggles the current brightness between light and dark.
  Future<void> FilePathTESTcu(
    List<int> input,
    String POCHECK,
  ) async {
    IC8100EXdataout output = IC8100EXdataout();

    FreeLoading(P200LIMXUPDATEcontext);

    var url = Uri.parse(ocrserver);
    var request = http.MultipartRequest(
      "POST",
      url,
    );

    request.files.add(
      http.MultipartFile.fromBytes(
        'pdf',
        input,
        contentType: MediaType('application', 'octet-stream'),
        filename: "data.pdf",
      ),
    );

    var response = await request.send();

    final _whitespaceRE = RegExp(r"\s+");
    String cleanupWhitespace(String input) =>
        input.split(_whitespaceRE).join(",");
    String cleanupWhitespaceC(String input) =>
        input.split(_whitespaceRE).join("");

    if (response.statusCode == 200) {
      Navigator.pop(P200LIMXUPDATEcontext);
      String orderpdf = '';
      String datapdf = '';
      var responseBody = await response.stream.bytesToString();

      var jsonResponse = json.decode(responseBody);
      // print(jsonResponse);
      if (jsonResponse['text'] != null) {
        String dataex = jsonResponse['text'].toString();
        print(dataex);

        List<String> dataexList = dataex.split("\n");
        //   // print(dataexList);
        int k = 0;
        String code = '';
        String reqs = '';
        String R = '';
        String DI = '';
        DATASETIC8100EX SETPDF = DATASETIC8100EX();
        List<DATASETIC8100EX> LISTSETPDF = [];
        for (var i = 0; i < dataexList.length; i++) {
          //     //Sample ID
          //     // if (dataexList[i].contains("Sample Name")) {
          //&& k == 0 && code == ''
          if (dataexList[i].contains("Sample Name") && k == 0 && code == '') {
            //
            if (dataexList[i].contains("RTB") ||
                dataexList[i].contains("RTR")) {
              List<String> req = dataexList[i].split(":");

              for (var s = 0; s < req.length; s++) {
                if (s == 1) {
                  // print(req[s]);

                  k = 1;
                  code = req[s];
                  List<String> listcode = code.split("/");
                  for (var a = 0; a < listcode.length; a++) {
                    if (a == 0) {
                      reqs = listcode[0];
                    }
                    if (a == 1) {
                      R = listcode[1];
                    }
                    if (a == 2) {
                      DI = listcode[1];
                    }
                  }
                }
              }
              // print(reqs + ' ' + R + ' ' + DI);
              SETPDF.REQ = reqs;
              SETPDF.code = code;
              SETPDF.R = R;
              SETPDF.DI = DI;
            }
          }
          if (dataexList[i].contains("for Concentration Limit") && k == 2) {
            if (SETPDF.REQ != '') {
              LISTSETPDF.add(SETPDF);
            }

            SETPDF = DATASETIC8100EX();
            k = 0;
            code = '';
            reqs = '';
            R = '';
            DI = '';
          }

          if (k == 2) {
            // print(cleanupWhitespace(dataexList[i])); SETPDF.code
            print((dataexList[i]));
            // List<String> listsetdata =
            //     cleanupWhitespace(dataexList[i]).split(",");
            // // print(listsetdata);
            // if (listsetdata.length > 10) {
            //   if (cleanupWhitespace(listsetdata[0]) == '1') {
            //     print(listsetdata[2] + '  ' + (listsetdata[10]));
            //     // if (cleanupWhitespace(listsetdata[2]) == 'F') {
            //     SETPDF.F_VALUE = listsetdata[10];
            //     // }
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '2') {
            //     print(listsetdata[2] + '  ' + (listsetdata[10]));
            //     // if (cleanupWhitespace(listsetdata[2]) == 'Cl') {
            //     SETPDF.Cl_VALUE = listsetdata[10];
            //     // }
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '3') {
            //     print(listsetdata[2] + '  ' + (listsetdata[10]));
            //     // if (cleanupWhitespace(listsetdata[2]) == 'NO3') {
            //     SETPDF.NO3_VALUE = listsetdata[10];
            //     // }
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '4') {
            //     print(listsetdata[2] + '  ' + (listsetdata[10]));
            //     // if (cleanupWhitespace(listsetdata[2]) == 'PO4') {
            //     SETPDF.PO4_VALUE = listsetdata[10];
            //     // }
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '5') {
            //     print(listsetdata[2] + '  ' + (listsetdata[10]));
            //     // if (cleanupWhitespace(listsetdata[2]) == 'SO4') {
            //     SETPDF.SO4_VALUE = listsetdata[10];
            //     // }
            //   }
            // }
            // else if (listsetdata.length > 3) {
            //   if (cleanupWhitespace(listsetdata[0]) == '1') {
            //     print(listsetdata[2] + '    ');
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '2') {
            //     print(listsetdata[2] + '    ');
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '3') {
            //     print(listsetdata[2] + '    ');
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '4') {
            //     print(listsetdata[2] + '    ');
            //   }
            //   if (cleanupWhitespace(listsetdata[0]) == '5') {
            //     print(listsetdata[2] + '    ');
            //   }
            // }
          }

          if (dataexList[i].contains("Flag") && k == 1) {
            // print(dataexList[i]);

            k = 2;
          }
        }
        List<Map<String, String>> outdataset = [];
        for (var d = 0; d < LISTSETPDF.length; d++) {
          // print({
          //   "type": LISTSETPDF[d].type,
          //   "code": LISTSETPDF[d].code,
          //   "REQ": LISTSETPDF[d].REQ,
          //   "R": LISTSETPDF[d].R,
          //   "DI": LISTSETPDF[d].DI,
          //   "VALUE": LISTSETPDF[d].VALUE,
          // });
          outdataset.add({
            "type": LISTSETPDF[d].type,
            "code": LISTSETPDF[d].code,
            "REQ": LISTSETPDF[d].REQ,
            "R": LISTSETPDF[d].R,
            "DI": LISTSETPDF[d].DI,
            "F_VALUE": LISTSETPDF[d].F_VALUE,
            "Cl_VALUE": LISTSETPDF[d].Cl_VALUE,
            "NO3_VALUE": LISTSETPDF[d].NO3_VALUE,
            "PO4_VALUE": LISTSETPDF[d].PO4_VALUE,
            "SO4_VALUE": LISTSETPDF[d].SO4_VALUE,
          });
        }
        print(outdataset);
        // Dio().post(
        //   '${serverG}LIMX/IC8100EXSETDATA',
        //   data: {
        //     "DATA": outdataset,
        //   },
        // ).then((value) {
        //   //
        //   BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
        //       "Complete", "Upload completed", enumNotificationlist.Success);
        // });
      }
    } else {
//
    }

    emit(output);
  }
// Future<void> VoiceDiagCubitGetResult(List<int> input, String type, String Speaker,
//       String folder, String team) async {
//     IC8100EXdataout output = IC8100EXdataout();

//     emit(output);
//   }

  Future<void> flush() async {
    IC8100EXdataout output = IC8100EXdataout();

    emit(output);
  }
}

class IC8100EXdataout {
  IC8100EXdataout({
    this.status = "",
    this.DATA = "",
  });
  String status;
  String DATA;
}

class DATASETIC8100EX {
  DATASETIC8100EX({
    this.type = '',
    this.code = '',
    this.REQ = '',
    this.R = '',
    this.DI = '',
    this.F_VALUE = '',
    this.Cl_VALUE = '',
    this.NO3_VALUE = '',
    this.PO4_VALUE = '',
    this.SO4_VALUE = '',
  });
  String type;
  String code;
  String REQ;
  String R;
  String DI;
  String F_VALUE;
  String Cl_VALUE;
  String NO3_VALUE;
  String PO4_VALUE;
  String SO4_VALUE;
}
