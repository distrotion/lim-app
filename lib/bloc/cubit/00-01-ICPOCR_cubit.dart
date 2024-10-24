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

class TESTINGOCR_Cubit extends Cubit<TESTINGdataout> {
  /// {@macro brightness_cubit}
  TESTINGOCR_Cubit() : super(TESTINGdataout());

  /// Toggles the current brightness between light and dark.
  Future<void> FilePathTESTcu(
    List<int> input,
    String POCHECK,
  ) async {
    TESTINGdataout output = TESTINGdataout();

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
        // print(dataex);

        List<String> dataexList = dataex.split("\n");
        // print(dataexList);
        int k = 0;
        String code = '';
        String reqs = '';
        String R = '';
        String DI = '';
        DATASETPDF SETPDF = DATASETPDF();
        List<DATASETPDF> LISTSETPDF = [];
        for (var i = 0; i < dataexList.length; i++) {
          //Sample ID
          // if (dataexList[i].contains("Sample ID")) {
          if (dataexList[i].contains("Mean Data") && k == 0 && code == '') {
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
            } else if (dataexList[i].contains("RTR")) {
              List<String> req = dataexList[i].split(":");

              for (var s = 0; s < req.length; s++) {
                if (s == 1) {
                  print(req[s]);

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
            }
          }
          if (dataexList[i].contains("Sequence No") && k == 2) {
            k = 0;
            code = '';
            reqs = '';
            R = '';
            DI = '';
          }

          if (k == 2) {
            // print(cleanupWhitespace(dataexList[i])); SETPDF.code
            List<String> listsetdata =
                cleanupWhitespace(dataexList[i]).split(",");
            for (var s = 0; s < listsetdata.length; s++) {
              if (s == 0) {
                // print(listsetdata[s]);
                SETPDF.code = cleanupWhitespaceC(code);
                SETPDF.REQ = cleanupWhitespaceC(reqs);
                SETPDF.R = cleanupWhitespaceC(R);
                SETPDF.DI = cleanupWhitespaceC(DI);
                SETPDF.type = cleanupWhitespaceC(listsetdata[s]);
              }
              if (s == 6) {
                // print(listsetdata[s]);
                SETPDF.VALUE = cleanupWhitespaceC(listsetdata[s]);
              }
            }

            LISTSETPDF.add(SETPDF);
            SETPDF = DATASETPDF();
          }

          if (dataexList[i].contains("Analyte") && k == 1) {
            //
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
            "VALUE": LISTSETPDF[d].VALUE,
          });
        }
        print(outdataset);
        Dio().post(
          '${serverG}LIMX/ICPSETDATA',
          data: {
            "DATA": outdataset,
          },
        ).then((value) {
          //
          BlocProvider.of<BlocNotification>(contextGB).UpdateNotification(
              "Complete", "Upload completed", enumNotificationlist.Success);
        });
      }
    } else {
      Navigator.pop(P200LIMXUPDATEcontext);
    }
    // print(input);
    // Map<dynamic, dynamic> formData = {
    //   "files": {
    //     "pdf": input,
    //   }
    // };
    // FormData formData = FormData.fromMap({
    //   "file": MultipartFile.fromBytes(
    //     input,
    //     filename: 'test.pdf',
    //   ),
    // });

    // print(formData);

    // final response = await Dio().post(
    //   // server + "/FLOW002/PatCarePvar_WRITE",
    //   ocrserver,
    //   data: {},
    // );

    //print(response);
    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    //   print(databuff);

    //   if (databuff != null) {
    //     if (databuff['text'] != null) {
    //       //

    //       // final shipdata = await Dio().post(
    //       //   // server + "/FLOW002/PatCarePvar_WRITE",
    //       //   'http://172.23.10.34:15010/KARL_SHIP_DATA',
    //       //   data: {
    //       //     "DATA": "0.34",
    //       //   },
    //       // );
    //     } else {}
    //   }
    // }

    emit(output);
  }
// Future<void> VoiceDiagCubitGetResult(List<int> input, String type, String Speaker,
//       String folder, String team) async {
//     TESTINGdataout output = TESTINGdataout();

//     emit(output);
//   }

  Future<void> flush() async {
    TESTINGdataout output = TESTINGdataout();

    emit(output);
  }
}

class TESTINGdataout {
  TESTINGdataout({
    this.status = "",
    this.DATA = "",
  });
  String status;
  String DATA;
}

class DATASETPDF {
  DATASETPDF({
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
