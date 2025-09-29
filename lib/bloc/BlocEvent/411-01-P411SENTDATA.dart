// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lim_app/page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALMAIN.dart';
import 'package:lim_app/page/P400CAL/P400CALVAR.dart';
import '../../data/global.dart';
import '../../page/P411HESBALANCE03CAL/P411HESBALANCE03CALMAIN.dart';
import '../../page/P411HESBALANCE03CAL/P411HESBALANCE03CALVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_GET extends P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_GET2 extends P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_GET3 extends P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_GET4 extends P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_GET5 extends P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_FLUSH extends P411HESBALANCECALDATA_Event {}

class P411HESBALANCECALDATA_Bloc extends Bloc<P411HESBALANCECALDATA_Event,
    List<P411HESBALANCECALDATAclass>> {
  P411HESBALANCECALDATA_Bloc() : super([]) {
    on<P411HESBALANCECALDATA_GET>((event, emit) {
      return _P411HESBALANCECALDATA_GET([], emit);
    });

    on<P411HESBALANCECALDATA_GET2>((event, emit) {
      return _P411HESBALANCECALDATA_GET2([], emit);
    });
    on<P411HESBALANCECALDATA_GET3>((event, emit) {
      return _P411HESBALANCECALDATA_GET3([], emit);
    });
    on<P411HESBALANCECALDATA_GET4>((event, emit) {
      return _P411HESBALANCECALDATA_GET4([], emit);
    });
    on<P411HESBALANCECALDATA_GET5>((event, emit) {
      return _P411HESBALANCECALDATA_GET5([], emit);
    });
    on<P411HESBALANCECALDATA_FLUSH>((event, emit) {
      return _P411HESBALANCECALDATA_FLUSH([], emit);
    });
  }

  Future<void> _P411HESBALANCECALDATA_GET(
      List<P411HESBALANCECALDATAclass> toAdd,
      Emitter<List<P411HESBALANCECALDATAclass>> emit) async {
    List<P411HESBALANCECALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    print('test');
    final response = await Dio().post(
      "${serverNRHES}SendDataCal_HES",
      data: {
        "DateTime": P400CALVAR.timefornodered,
        "UserLogin": USERDATA.NAME,
        "Branch": USERDATA.Branch,
        "status": P411HESBALANCE03CALVAR.status,
        "WeightReal": P411HESBALANCE03CALVAR.inputValue,
        "InstrumentName": P411HESBALANCE03CALVAR.InstrumentName,
        "Approve_By": P411HESBALANCE03CALVAR.Approve_By,
        "Password": P411HESBALANCE03CALVAR.password,
        "averageValue": P411HESBALANCE03CALVAR.summary1,
        "averageValue1": P411HESBALANCE03CALVAR.summary2,
        "averageValue2": P411HESBALANCE03CALVAR.summary3,
        "averageValue3": P411HESBALANCE03CALVAR.summary4,
        "targetValue": P411HESBALANCE03CALVAR.targetValue,
        "targetValue1": P411HESBALANCE03CALVAR.targetValue1,
        "targetValue2": P411HESBALANCE03CALVAR.targetValue2,
        "targetValue3": P411HESBALANCE03CALVAR.targetValue3,
        "targetValue4": P411HESBALANCE03CALVAR.targetValue4,
        "targetValue5": P411HESBALANCE03CALVAR.targetValue5,
        "targetValue6": P411HESBALANCE03CALVAR.targetValue6,
        "targetValue7": P411HESBALANCE03CALVAR.targetValue7,
        "targetValue8": P411HESBALANCE03CALVAR.targetValue8,
        "targetValue9": P411HESBALANCE03CALVAR.targetValue9,
        "targetValue10": P411HESBALANCE03CALVAR.targetValue10,
        "targetValue11": P411HESBALANCE03CALVAR.targetValue11,
      },
    );

    print("1");
    // var input = [];
    // if (response.statusCode == 200) {
    //   print(response.statusCode);
    //   print(response.data);
    //   var databuff = response.data;
    //   input = databuff;

    //   // var input = dummyCusService;

    //   // List<P411HESBALANCECALDATAclass> outputdata = input.map((data) {
    //   //   return P411HESBALANCECALDATAclass(
    //   //     TYPE: 'Group ${savenull(data['Type'])}',
    //   //   );
    //   // }).toList();
    //   print(databuff);
    //   output = databuff;
    //   emit(output);

    // } else {
    //   print("where is my server");
    // output = [];
    // emit(output);
    // }
  }

  Future<void> _P411HESBALANCECALDATA_GET2(
      List<P411HESBALANCECALDATAclass> toAdd,
      Emitter<List<P411HESBALANCECALDATAclass>> emit) async {
    List<P411HESBALANCECALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    FreeLoading(P411HESBALANCE03CALMAINcontext);
    final response = await Dio().post(
      "${serverNRHES}GETVALUE03_HES",
      data: {},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print('BlocEvent' + response.data[0]['value'].toString());
      // print(response.data[0]['Refresh']);
      // P400CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P411HESBALANCECALDATAclass> outputdata = input.map((data) {
        return P411HESBALANCECALDATAclass(
          GETVALUE: data['value'],
        );
      }).toList();
      output = outputdata;
      emit(output);
      Navigator.of(P411HESBALANCE03CALMAINcontext).pop();
      print('Bloc Event ส่งให้ :' + output[0].GETVALUE.toString());
    } else {
      output = [];
      emit(output);
    }
  }

  Future<void> _P411HESBALANCECALDATA_GET3(
      List<P411HESBALANCECALDATAclass> toAdd,
      Emitter<List<P411HESBALANCECALDATAclass>> emit) async {
    List<P411HESBALANCECALDATAclass> output = [];
    print('SentTemp');
    final response = await Dio().post(
      "${serverNRHES}SendDataTemp_HES",
      data: {
        "DateTime": P400CALVAR.timefornodered,
        "UserLogin": USERDATA.NAME,
        "Branch": USERDATA.Branch,
        "status": P411HESBALANCE03CALVAR.status,
        "WeightReal": P411HESBALANCE03CALVAR.inputValue,
        "InstrumentName": P411HESBALANCE03CALVAR.InstrumentName,
        "Approve_By": P411HESBALANCE03CALVAR.Approve_By,
        "Password": P411HESBALANCE03CALVAR.password,
        "averageValue": P411HESBALANCE03CALVAR.summary1,
        "averageValue1": P411HESBALANCE03CALVAR.summary2,
        "averageValue2": P411HESBALANCE03CALVAR.summary3,
        "averageValue3": P411HESBALANCE03CALVAR.summary4,
        "targetValue": P411HESBALANCE03CALVAR.targetValue,
        "targetValue1": P411HESBALANCE03CALVAR.targetValue1,
        "targetValue2": P411HESBALANCE03CALVAR.targetValue2,
        "targetValue3": P411HESBALANCE03CALVAR.targetValue3,
        "targetValue4": P411HESBALANCE03CALVAR.targetValue4,
        "targetValue5": P411HESBALANCE03CALVAR.targetValue5,
        "targetValue6": P411HESBALANCE03CALVAR.targetValue6,
        "targetValue7": P411HESBALANCE03CALVAR.targetValue7,
        "targetValue8": P411HESBALANCE03CALVAR.targetValue8,
        "targetValue9": P411HESBALANCE03CALVAR.targetValue9,
        "targetValue10": P411HESBALANCE03CALVAR.targetValue10,
        "targetValue11": P411HESBALANCE03CALVAR.targetValue11,
      },
    ); // List<P411HESBALANCECALDATAclass> datadummy = [
    //   P411HESBALANCECALDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P411HESBALANCECALDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P411HESBALANCECALDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P411HESBALANCECALDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P411HESBALANCECALDATA_GET4(
      List<P411HESBALANCECALDATAclass> toAdd,
      Emitter<List<P411HESBALANCECALDATAclass>> emit) async {
    List<P411HESBALANCECALDATAclass> output = [];
    print('GetTemp');
    final response = await Dio().post(
      "${serverNRHES}GetDataTemp_HES",
      data: {P411HESBALANCE03CALVAR.InstrumentName},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print('ข้อมูล Temp มา' + response.data);
      // print(response.data[0]['Refresh']);
      // P400CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P411HESBALANCECALDATAclass> outputdata = input.map((data) {
        return P411HESBALANCECALDATAclass(
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

  Future<void> _P411HESBALANCECALDATA_GET5(
      List<P411HESBALANCECALDATAclass> toAdd,
      Emitter<List<P411HESBALANCECALDATAclass>> emit) async {
    List<P411HESBALANCECALDATAclass> output = [];
    print('GetTemp');
    final response = await Dio().post(
      "${serverNRHES}ClearDataTemp_HES",
      data: {P411HESBALANCE03CALVAR.InstrumentName},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      // print(response.data[0]['Refresh']);
      // P400CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P411HESBALANCECALDATAclass> outputdata = input.map((data) {
        return P411HESBALANCECALDATAclass(
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

  Future<void> _P411HESBALANCECALDATA_FLUSH(
      List<P411HESBALANCECALDATAclass> toAdd,
      Emitter<List<P411HESBALANCECALDATAclass>> emit) async {
    List<P411HESBALANCECALDATAclass> output = [];
    emit(output);
  }
}

class P411HESBALANCECALDATAclass {
  P411HESBALANCECALDATAclass({
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
