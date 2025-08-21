// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lim_app/page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALMAIN.dart';
import '../../data/global.dart';
import '../../page/P300CAL/P300CALVAR.dart';
import '../../page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_GET extends P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_GET2 extends P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_GET3 extends P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_GET4 extends P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_GET5 extends P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_FLUSH extends P310BP12BALANCECALDATA_Event {}

class P310BP12BALANCECALDATA_Bloc extends Bloc<P310BP12BALANCECALDATA_Event,
    List<P310BP12BALANCECALDATAclass>> {
  P310BP12BALANCECALDATA_Bloc() : super([]) {
    on<P310BP12BALANCECALDATA_GET>((event, emit) {
      return _P310BP12BALANCECALDATA_GET([], emit);
    });

    on<P310BP12BALANCECALDATA_GET2>((event, emit) {
      return _P310BP12BALANCECALDATA_GET2([], emit);
    });
    on<P310BP12BALANCECALDATA_GET3>((event, emit) {
      return _P310BP12BALANCECALDATA_GET3([], emit);
    });
    on<P310BP12BALANCECALDATA_GET4>((event, emit) {
      return _P310BP12BALANCECALDATA_GET4([], emit);
    });
    on<P310BP12BALANCECALDATA_GET5>((event, emit) {
      return _P310BP12BALANCECALDATA_GET5([], emit);
    });
    on<P310BP12BALANCECALDATA_FLUSH>((event, emit) {
      return _P310BP12BALANCECALDATA_FLUSH([], emit);
    });
  }

  Future<void> _P310BP12BALANCECALDATA_GET(
      List<P310BP12BALANCECALDATAclass> toAdd,
      Emitter<List<P310BP12BALANCECALDATAclass>> emit) async {
    List<P310BP12BALANCECALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    print('test');
    final response = await Dio().post(
      "${serverNRBP12}SendDataCal",
      data: {
        "DateTime": P300CALVAR.timefornodered,
        "UserLogin": USERDATA.NAME,
        "Branch": USERDATA.Branch,
        "status": P310BP12BALANCE01CALVAR.status,
        "WeightReal": P310BP12BALANCE01CALVAR.inputValue,
        "InstrumentName": P310BP12BALANCE01CALVAR.InstrumentName,
        "Approve_By": P310BP12BALANCE01CALVAR.Approve_By,
        "Password": P310BP12BALANCE01CALVAR.password,
        "averageValue": P310BP12BALANCE01CALVAR.summary1,
        "averageValue1": P310BP12BALANCE01CALVAR.summary2,
        "averageValue2": P310BP12BALANCE01CALVAR.summary3,
        "averageValue3": P310BP12BALANCE01CALVAR.summary4,
        "targetValue": P310BP12BALANCE01CALVAR.targetValue,
        "targetValue1": P310BP12BALANCE01CALVAR.targetValue1,
        "targetValue2": P310BP12BALANCE01CALVAR.targetValue2,
        "targetValue3": P310BP12BALANCE01CALVAR.targetValue3,
        "targetValue4": P310BP12BALANCE01CALVAR.targetValue4,
        "targetValue5": P310BP12BALANCE01CALVAR.targetValue5,
        "targetValue6": P310BP12BALANCE01CALVAR.targetValue6,
        "targetValue7": P310BP12BALANCE01CALVAR.targetValue7,
        "targetValue8": P310BP12BALANCE01CALVAR.targetValue8,
        "targetValue9": P310BP12BALANCE01CALVAR.targetValue9,
        "targetValue10": P310BP12BALANCE01CALVAR.targetValue10,
        "targetValue11": P310BP12BALANCE01CALVAR.targetValue11,
      },
    );

    // var input = [];
    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    //   input = databuff;
    //   List<P310BP12BALANCECALDATAclass> outputdata = input.map((data) {
    //     return P310BP12BALANCECALDATAclass(
    //       PASSWORD: data['Password'],
    //     );
    //   }).toList();
    //   output = outputdata;
    //   emit(output);
    //   print(output);
    // } else {
    //   print("where is my server");
    //   output = [];
    //   emit(output);
    // }
  }

  Future<void> _P310BP12BALANCECALDATA_GET2(
      List<P310BP12BALANCECALDATAclass> toAdd,
      Emitter<List<P310BP12BALANCECALDATAclass>> emit) async {
    List<P310BP12BALANCECALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    FreeLoading(P310BP12BALANCE01CALMAINcontext);
    final response = await Dio().post(
      "${serverNRBP12}GETVALUE01",
      data: {},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print('BlocEvent' + response.data[0]['value'].toString());
      // print(response.data[0]['Refresh']);
      // P300CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P310BP12BALANCECALDATAclass> outputdata = input.map((data) {
        return P310BP12BALANCECALDATAclass(
          GETVALUE: data['value'],
        );
      }).toList();
      output = outputdata;
      emit(output);
      Navigator.of(P310BP12BALANCE01CALMAINcontext).pop();
    } else {
      output = [];
      emit(output);
    }
  }

  Future<void> _P310BP12BALANCECALDATA_GET3(
      List<P310BP12BALANCECALDATAclass> toAdd,
      Emitter<List<P310BP12BALANCECALDATAclass>> emit) async {
    List<P310BP12BALANCECALDATAclass> output = [];
    print('SentTemp');
    final response = await Dio().post(
      "${serverNRBP12}SendDataTemp",
      data: {
        "DateTime": P300CALVAR.timefornodered,
        "UserLogin": USERDATA.NAME,
        "Branch": USERDATA.Branch,
        "status": P310BP12BALANCE01CALVAR.status,
        "WeightReal": P310BP12BALANCE01CALVAR.inputValue,
        "InstrumentName": P310BP12BALANCE01CALVAR.InstrumentName,
        "Approve_By": P310BP12BALANCE01CALVAR.Approve_By,
        "Password": P310BP12BALANCE01CALVAR.password,
        "averageValue": P310BP12BALANCE01CALVAR.summary1,
        "averageValue1": P310BP12BALANCE01CALVAR.summary2,
        "averageValue2": P310BP12BALANCE01CALVAR.summary3,
        "averageValue3": P310BP12BALANCE01CALVAR.summary4,
        "targetValue": P310BP12BALANCE01CALVAR.targetValue,
        "targetValue1": P310BP12BALANCE01CALVAR.targetValue1,
        "targetValue2": P310BP12BALANCE01CALVAR.targetValue2,
        "targetValue3": P310BP12BALANCE01CALVAR.targetValue3,
        "targetValue4": P310BP12BALANCE01CALVAR.targetValue4,
        "targetValue5": P310BP12BALANCE01CALVAR.targetValue5,
        "targetValue6": P310BP12BALANCE01CALVAR.targetValue6,
        "targetValue7": P310BP12BALANCE01CALVAR.targetValue7,
        "targetValue8": P310BP12BALANCE01CALVAR.targetValue8,
        "targetValue9": P310BP12BALANCE01CALVAR.targetValue9,
        "targetValue10": P310BP12BALANCE01CALVAR.targetValue10,
        "targetValue11": P310BP12BALANCE01CALVAR.targetValue11,
      },
    ); // List<P310BP12BALANCECALDATAclass> datadummy = [
    //   P310BP12BALANCECALDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P310BP12BALANCECALDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P310BP12BALANCECALDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P310BP12BALANCECALDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P310BP12BALANCECALDATA_GET4(
      List<P310BP12BALANCECALDATAclass> toAdd,
      Emitter<List<P310BP12BALANCECALDATAclass>> emit) async {
    List<P310BP12BALANCECALDATAclass> output = [];
    print('GetTemp');
    final response = await Dio().post(
      "${serverNRBP12}GetDataTemp",
      data: {P310BP12BALANCE01CALVAR.InstrumentName},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      // print(response.data[0]['Refresh']);
      // P300CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P310BP12BALANCECALDATAclass> outputdata = input.map((data) {
        return P310BP12BALANCECALDATAclass(
          INSTRUMENT: savenull(data['INSTRUMENT']),
          G11: data['Cal_1g_No1'],
          G12: data['Cal_1g_No2'],
          G13: data['Cal_1g_No3'],
          G501: data['Cal_50g_No1'],
          G502: data['Cal_50g_No2'],
          G503: data['Cal_50g_No3'],
          G1001: data['Cal_100g_No1'],
          G1002: data['Cal_100g_No2'],
          G1003: data['Cal_100g_No3'],
          G2001: data['Cal_200g_No1'],
          G2002: data['Cal_200g_No2'],
          G2003: data['Cal_200g_No3'],
          G1AV: data['Cal_1g_Average'],
          G50AV: data['Cal_50g_Average'],
          G100AV: data['Cal_100g_Average'],
          G200AV: data['Cal_200g_Average'],
        );
      }).toList();

      output = outputdata;
      emit(output);
      print(output);
    } else {
      output = [];
      emit(output);
    }
  }

  Future<void> _P310BP12BALANCECALDATA_GET5(
      List<P310BP12BALANCECALDATAclass> toAdd,
      Emitter<List<P310BP12BALANCECALDATAclass>> emit) async {
    List<P310BP12BALANCECALDATAclass> output = [];
    print('GetTemp');
    final response = await Dio().post(
      "${serverNRBP12}ClearDataTemp",
      data: {P310BP12BALANCE01CALVAR.InstrumentName},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      // print(response.data[0]['Refresh']);
      // P300CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P310BP12BALANCECALDATAclass> outputdata = input.map((data) {
        return P310BP12BALANCECALDATAclass(
          INSTRUMENT: savenull(data['INSTRUMENT']),
          G11: data['Cal_1g_No1'],
          G12: data['Cal_1g_No2'],
          G13: data['Cal_1g_No3'],
          G501: data['Cal_50g_No1'],
          G502: data['Cal_50g_No2'],
          G503: data['Cal_50g_No3'],
          G1001: data['Cal_100g_No1'],
          G1002: data['Cal_100g_No2'],
          G1003: data['Cal_100g_No3'],
          G2001: data['Cal_200g_No1'],
          G2002: data['Cal_200g_No2'],
          G2003: data['Cal_200g_No3'],
          G1AV: data['Cal_1g_Average'],
          G50AV: data['Cal_50g_Average'],
          G100AV: data['Cal_100g_Average'],
          G200AV: data['Cal_200g_Average'],
        );
      }).toList();

      output = outputdata;
      emit(output);
      print(output);
    } else {
      output = [];
      emit(output);
    }
  }

  Future<void> _P310BP12BALANCECALDATA_FLUSH(
      List<P310BP12BALANCECALDATAclass> toAdd,
      Emitter<List<P310BP12BALANCECALDATAclass>> emit) async {
    List<P310BP12BALANCECALDATAclass> output = [];
    emit(output);
  }
}

class P310BP12BALANCECALDATAclass {
  P310BP12BALANCECALDATAclass({
    this.TYPE = '',
    this.GETVALUETEMP = 1,
    this.GETVALUE = 0,
    this.INSTRUMENT = '',
    this.G11 = 0,
    this.G12 = 0,
    this.G13 = 0,
    this.G501 = 0,
    this.G502 = 0,
    this.G503 = 0,
    this.G1001 = 0,
    this.G1002 = 0,
    this.G1003 = 0,
    this.G2001 = 0,
    this.G2002 = 0,
    this.G2003 = 0,
    this.G1AV = 0,
    this.G50AV = 0,
    this.G100AV = 0,
    this.G200AV = 0,
    this.SWITCH = '',
    this.PASSWORD = '',
  });

  String TYPE;
  double GETVALUETEMP;
  double GETVALUE;
  String INSTRUMENT;
  double G11;
  double G12;
  double G13;
  double G501;
  double G502;
  double G503;
  double G1001;
  double G1002;
  double G1003;
  double G2001;
  double G2002;
  double G2003;
  double G1AV;
  double G50AV;
  double G100AV;
  double G200AV;
  String SWITCH;
  String PASSWORD;
}

String savenull(input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}
