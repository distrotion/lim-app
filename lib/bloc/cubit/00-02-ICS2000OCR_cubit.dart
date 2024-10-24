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

class ICS2000OCR_Cubit extends Cubit<ICS2000OCRdataout> {
  /// {@macro brightness_cubit}
  ICS2000OCR_Cubit() : super(ICS2000OCRdataout());

  /// Toggles the current brightness between light and dark.
  Future<void> FilePathTESTcu(
    List<int> input,
    String POCHECK,
  ) async {
    ICS2000OCRdataout output = ICS2000OCRdataout();

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
      var responseBody = await response.stream.bytesToString();

      var jsonResponse = json.decode(responseBody);
      print(jsonResponse);
      Navigator.pop(P200LIMXUPDATEcontext);
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
//     ICS2000OCRdataout output = ICS2000OCRdataout();

//     emit(output);
//   }

  Future<void> flush() async {
    ICS2000OCRdataout output = ICS2000OCRdataout();

    emit(output);
  }
}

class ICS2000OCRdataout {
  ICS2000OCRdataout({
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
