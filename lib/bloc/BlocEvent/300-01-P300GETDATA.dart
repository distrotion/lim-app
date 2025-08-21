// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lim_app/page/P300CAL/P300CALVAR.dart';
import '../../data/global.dart';
import '../../page/P300CAL/P300CALMAIN.dart';
import '../../page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P300BP12BALANCEGETCALDATA_Bloc_Event {}

class P300BP12BALANCEGETCALDATA_Bloc_GET
    extends P300BP12BALANCEGETCALDATA_Bloc_Event {}

class P300BP12BALANCEGETCALDATA_Bloc_GET2
    extends P300BP12BALANCEGETCALDATA_Bloc_Event {}

class P300BP12BALANCEGETCALDATA_Bloc_GET3
    extends P300BP12BALANCEGETCALDATA_Bloc_Event {}

class P300BP12BALANCEGETCALDATA_Bloc_FLUSH
    extends P300BP12BALANCEGETCALDATA_Bloc_Event {}

class P300BP12BALANCEGETCALDATA_Bloc extends Bloc<
    P300BP12BALANCEGETCALDATA_Bloc_Event,
    List<P300BP12BALANCEGETCALDATAclass>> {
  P300BP12BALANCEGETCALDATA_Bloc() : super([]) {
    on<P300BP12BALANCEGETCALDATA_Bloc_GET>((event, emit) {
      return _P300BP12BALANCEGETCALDATA_Bloc_GET([], emit);
    });
    on<P300BP12BALANCEGETCALDATA_Bloc_GET2>((event, emit) {
      return _P300BP12BALANCEGETCALDATA_Bloc_GET2([], emit);
    });
    on<P300BP12BALANCEGETCALDATA_Bloc_GET3>((event, emit) {
      return _P300BP12BALANCEGETCALDATA_Bloc_GET3([], emit);
    });
    on<P300BP12BALANCEGETCALDATA_Bloc_FLUSH>((event, emit) {
      return _P300BP12BALANCEGETCALDATA_Bloc_FLUSH([], emit);
    });
  }

  Future<void> _P300BP12BALANCEGETCALDATA_Bloc_GET(
      List<P300BP12BALANCEGETCALDATAclass> toAdd,
      Emitter<List<P300BP12BALANCEGETCALDATAclass>> emit) async {
    List<P300BP12BALANCEGETCALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // print('test');
    // FreeLoading(P300CALMAINcontext);
    // final response = await Dio().post(
    //   "${serverNRBP12}GetDataCal",
    //   data: {
    //     "DateTime": P300CALVAR.timefornodered,
    //   },
    // );
    // var input = [];
    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    //   input = databuff;
    //   List<P300BP12BALANCEGETCALDATAclass> outputdata = input.map((data) {
    //     return P300BP12BALANCEGETCALDATAclass(
    //       REFRESH: '${data['Refresh']}',
    //     );
    //   }).toList();

    //   output = outputdata;
    //   emit(output);
    //   print(output);
    // } else {
    //   output = [];
    //   emit(output);
    // }
    // Navigator.of(P300CALMAINcontext).pop();
  }

  Future<void> _P300BP12BALANCEGETCALDATA_Bloc_GET2(
      List<P300BP12BALANCEGETCALDATAclass> toAdd,
      Emitter<List<P300BP12BALANCEGETCALDATAclass>> emit) async {
    // List<P300BP12BALANCEGETCALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // var input = dummydatainput2;

    // List<P300BP12BALANCEGETCALDATAclass> outputdata = input
    //     .where((data) =>
    //         data['location'] == 'ESIE1' &&
    //         data['plant'] == 'YES' &&
    //         data['step01'] == 'YES')
    //     .map((data) {
    //   return P300BP12BALANCEGETCALDATAclass(
    //     PLANT: savenull(data['plant']),
    //     ORDER: savenull(data['order']),
    //     MAT: savenull(data['mat']),
    //     LOCATION: savenull(data['location']),
    //     LOT: savenull(data['lot']),
    //     CUSTOMER: savenull(data['customer']),
    //     PARTNO: savenull(data['partno']),
    //     PARTNAME: savenull(data['partname']),
    //     STEP01: savenull(data['step1']),
    //     STEP02: savenull(data['step2']),
    //     STEP03: savenull(data['step3']),
    //     STEP04: savenull(data['step4']),
    //     STEP05: savenull(data['step5']),
    //     STEP06: savenull(data['step6']),
    //     STEP07: savenull(data['step7']),
    //     STEP08: savenull(data['step8']),
    //     STEP09: savenull(data['step9']),
    //   );
    // }).toList();

    // output = outputdata;
    // emit(output);
  }

  Future<void> _P300BP12BALANCEGETCALDATA_Bloc_GET3(
      List<P300BP12BALANCEGETCALDATAclass> toAdd,
      Emitter<List<P300BP12BALANCEGETCALDATAclass>> emit) async {
    // List<P300BP12BALANCEGETCALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // List<P300BP12BALANCEGETCALDATAclass> datadummy = [
    //   P300BP12BALANCEGETCALDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P300BP12BALANCEGETCALDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P300BP12BALANCEGETCALDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P300BP12BALANCEGETCALDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P300BP12BALANCEGETCALDATA_Bloc_FLUSH(
      List<P300BP12BALANCEGETCALDATAclass> toAdd,
      Emitter<List<P300BP12BALANCEGETCALDATAclass>> emit) async {
    List<P300BP12BALANCEGETCALDATAclass> output = [];
    emit(output);
  }
}

class P300BP12BALANCEGETCALDATAclass {
  P300BP12BALANCEGETCALDATAclass({
    this.STATUS = '',
    this.INSTRUMENTNAME = '',
    this.REFRESH = '',
  });

  String STATUS;
  String INSTRUMENTNAME;
  String REFRESH;
}

String savenull(input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
