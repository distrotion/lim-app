// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lim_app/page/P300CAL/P300CALVAR.dart';
import 'package:lim_app/page/P99SELECTINSBP12/P99SELECTINSBP12MAIN.dart';
import '../../data/global.dart';
import '../../page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P99SELECTINSBP12MAIN_Bloc_Event {}

class P99SELECTINSBP12MAIN_Bloc_GET extends P99SELECTINSBP12MAIN_Bloc_Event {}

class P99SELECTINSBP12MAIN_Bloc_GET2 extends P99SELECTINSBP12MAIN_Bloc_Event {}

class P99SELECTINSBP12MAIN_Bloc_GET3 extends P99SELECTINSBP12MAIN_Bloc_Event {}

class P99SELECTINSBP12MAIN_Bloc_FLUSH extends P99SELECTINSBP12MAIN_Bloc_Event {}

class P99SELECTINSBP12MAIN_Bloc extends Bloc<P99SELECTINSBP12MAIN_Bloc_Event,
    List<P99SELECTINSBP12MAINclass>> {
  P99SELECTINSBP12MAIN_Bloc() : super([]) {
    on<P99SELECTINSBP12MAIN_Bloc_GET>((event, emit) {
      return _P99SELECTINSBP12MAIN_Bloc_GET([], emit);
    });
    on<P99SELECTINSBP12MAIN_Bloc_GET2>((event, emit) {
      return _P99SELECTINSBP12MAIN_Bloc_GET2([], emit);
    });
    on<P99SELECTINSBP12MAIN_Bloc_GET3>((event, emit) {
      return _P99SELECTINSBP12MAIN_Bloc_GET3([], emit);
    });
    on<P99SELECTINSBP12MAIN_Bloc_FLUSH>((event, emit) {
      return _P99SELECTINSBP12MAIN_Bloc_FLUSH([], emit);
    });
  }

  Future<void> _P99SELECTINSBP12MAIN_Bloc_GET(
      List<P99SELECTINSBP12MAINclass> toAdd,
      Emitter<List<P99SELECTINSBP12MAINclass>> emit) async {
    List<P99SELECTINSBP12MAINclass> output = [];
    //-------------------------------------------------------------------------------------
    FreeLoading(P99SELECTINSBP12MAINcontext);
    print('test');
    final response = await Dio().post(
      "${serverNRBP12}GetDataCal",
      data: {
        "DateTime": P300CALVAR.timefornodered,
      },
    );
    // var input = [];
    // if (response.statusCode == 200) {
    //   // print(response.statusCode);
    //   // print(response.data);
    //   // print(response.data[0]['Refresh']);
    //   P300CALVAR.Refresh = response.data[0]['Refresh'];
    //   var databuff = response.data;
    //   input = databuff;
    //   List<P99SELECTINSBP12MAINclass> outputdata = input.map((data) {
    //     return P99SELECTINSBP12MAINclass(
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
    Navigator.of(P99SELECTINSBP12MAINcontext).pop();
  }

  Future<void> _P99SELECTINSBP12MAIN_Bloc_GET2(
      List<P99SELECTINSBP12MAINclass> toAdd,
      Emitter<List<P99SELECTINSBP12MAINclass>> emit) async {
    // List<P99SELECTINSBP12MAINclass> output = [];
    //-------------------------------------------------------------------------------------
    // var input = dummydatainput2;

    // List<P99SELECTINSBP12MAINclass> outputdata = input
    //     .where((data) =>
    //         data['location'] == 'ESIE1' &&
    //         data['plant'] == 'YES' &&
    //         data['step01'] == 'YES')
    //     .map((data) {
    //   return P99SELECTINSBP12MAINclass(
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

  Future<void> _P99SELECTINSBP12MAIN_Bloc_GET3(
      List<P99SELECTINSBP12MAINclass> toAdd,
      Emitter<List<P99SELECTINSBP12MAINclass>> emit) async {
    // List<P99SELECTINSBP12MAINclass> output = [];
    //-------------------------------------------------------------------------------------
    // List<P99SELECTINSBP12MAINclass> datadummy = [
    //   P99SELECTINSBP12MAINclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P99SELECTINSBP12MAINclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P99SELECTINSBP12MAINclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P99SELECTINSBP12MAINclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P99SELECTINSBP12MAIN_Bloc_FLUSH(
      List<P99SELECTINSBP12MAINclass> toAdd,
      Emitter<List<P99SELECTINSBP12MAINclass>> emit) async {
    List<P99SELECTINSBP12MAINclass> output = [];
    emit(output);
  }
}

class P99SELECTINSBP12MAINclass {
  P99SELECTINSBP12MAINclass({
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
