// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//-------------------------------------------------

abstract class P400HESBALANCEGETCALDATA_Bloc_Event {}

class P400HESBALANCEGETCALDATA_Bloc_GET
    extends P400HESBALANCEGETCALDATA_Bloc_Event {}

class P400HESBALANCEGETCALDATA_Bloc_GET2
    extends P400HESBALANCEGETCALDATA_Bloc_Event {}

class P400HESBALANCEGETCALDATA_Bloc_GET3
    extends P400HESBALANCEGETCALDATA_Bloc_Event {}

class P400HESBALANCEGETCALDATA_Bloc_FLUSH
    extends P400HESBALANCEGETCALDATA_Bloc_Event {}

class P400HESBALANCEGETCALDATA_Bloc extends Bloc<
    P400HESBALANCEGETCALDATA_Bloc_Event, List<P400HESBALANCEGETCALDATAclass>> {
  P400HESBALANCEGETCALDATA_Bloc() : super([]) {
    on<P400HESBALANCEGETCALDATA_Bloc_GET>((event, emit) {
      return _P400HESBALANCEGETCALDATA_Bloc_GET([], emit);
    });
    on<P400HESBALANCEGETCALDATA_Bloc_GET2>((event, emit) {
      return _P400HESBALANCEGETCALDATA_Bloc_GET2([], emit);
    });
    on<P400HESBALANCEGETCALDATA_Bloc_GET3>((event, emit) {
      return _P400HESBALANCEGETCALDATA_Bloc_GET3([], emit);
    });
    on<P400HESBALANCEGETCALDATA_Bloc_FLUSH>((event, emit) {
      return _P400HESBALANCEGETCALDATA_Bloc_FLUSH([], emit);
    });
  }

  Future<void> _P400HESBALANCEGETCALDATA_Bloc_GET(
      List<P400HESBALANCEGETCALDATAclass> toAdd,
      Emitter<List<P400HESBALANCEGETCALDATAclass>> emit) async {
    List<P400HESBALANCEGETCALDATAclass> output = [];
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
    //   List<P400HESBALANCEGETCALDATAclass> outputdata = input.map((data) {
    //     return P400HESBALANCEGETCALDATAclass(
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

  Future<void> _P400HESBALANCEGETCALDATA_Bloc_GET2(
      List<P400HESBALANCEGETCALDATAclass> toAdd,
      Emitter<List<P400HESBALANCEGETCALDATAclass>> emit) async {
    // List<P400HESBALANCEGETCALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // var input = dummydatainput2;

    // List<P400HESBALANCEGETCALDATAclass> outputdata = input
    //     .where((data) =>
    //         data['location'] == 'ESIE1' &&
    //         data['plant'] == 'YES' &&
    //         data['step01'] == 'YES')
    //     .map((data) {
    //   return P400HESBALANCEGETCALDATAclass(
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

  Future<void> _P400HESBALANCEGETCALDATA_Bloc_GET3(
      List<P400HESBALANCEGETCALDATAclass> toAdd,
      Emitter<List<P400HESBALANCEGETCALDATAclass>> emit) async {
    // List<P400HESBALANCEGETCALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    // List<P400HESBALANCEGETCALDATAclass> datadummy = [
    //   P400HESBALANCEGETCALDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P400HESBALANCEGETCALDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P400HESBALANCEGETCALDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P400HESBALANCEGETCALDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P400HESBALANCEGETCALDATA_Bloc_FLUSH(
      List<P400HESBALANCEGETCALDATAclass> toAdd,
      Emitter<List<P400HESBALANCEGETCALDATAclass>> emit) async {
    List<P400HESBALANCEGETCALDATAclass> output = [];
    emit(output);
  }
}

class P400HESBALANCEGETCALDATAclass {
  P400HESBALANCEGETCALDATAclass({
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
