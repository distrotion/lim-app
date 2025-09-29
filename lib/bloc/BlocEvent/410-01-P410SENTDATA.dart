// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lim_app/page/P400CAL/P400CALVAR.dart';
import 'package:lim_app/page/P410HESBALANCE02CAL/P410HESBALANCE02CALMAIN.dart';
import '../../data/global.dart';
import '../../page/P410HESBALANCE02CAL/P410HESBALANCE02CALVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_GET extends P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_GET2 extends P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_GET3 extends P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_GET4 extends P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_GET5 extends P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_FLUSH extends P410HESBALANCECALDATA_Event {}

class P410HESBALANCECALDATA_Bloc extends Bloc<P410HESBALANCECALDATA_Event,
    List<P410HESBALANCECALDATAclass>> {
  P410HESBALANCECALDATA_Bloc() : super([]) {
    on<P410HESBALANCECALDATA_GET>((event, emit) {
      return _P410HESBALANCECALDATA_GET([], emit);
    });

    on<P410HESBALANCECALDATA_GET2>((event, emit) {
      return _P410HESBALANCECALDATA_GET2([], emit);
    });
    on<P410HESBALANCECALDATA_GET3>((event, emit) {
      return _P410HESBALANCECALDATA_GET3([], emit);
    });
    on<P410HESBALANCECALDATA_GET4>((event, emit) {
      return _P410HESBALANCECALDATA_GET4([], emit);
    });
    on<P410HESBALANCECALDATA_GET5>((event, emit) {
      return _P410HESBALANCECALDATA_GET5([], emit);
    });
    on<P410HESBALANCECALDATA_FLUSH>((event, emit) {
      return _P410HESBALANCECALDATA_FLUSH([], emit);
    });
  }

  Future<void> _P410HESBALANCECALDATA_GET(
      List<P410HESBALANCECALDATAclass> toAdd,
      Emitter<List<P410HESBALANCECALDATAclass>> emit) async {
    List<P410HESBALANCECALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    print('test');
    final response = await Dio().post(
      "${serverNRHES}SendDataCal_HES",
      data: {
        "DateTime": P400CALVAR.timefornodered,
        "UserLogin": USERDATA.NAME,
        "Branch": USERDATA.Branch,
        "status": P410HESBALANCE02CALVAR.status,
        "WeightReal": P410HESBALANCE02CALVAR.inputValue,
        "InstrumentName": P410HESBALANCE02CALVAR.InstrumentName,
        "Approve_By": P410HESBALANCE02CALVAR.Approve_By,
        "Password": P410HESBALANCE02CALVAR.password,
        "averageValue": P410HESBALANCE02CALVAR.summary1,
        "averageValue1": P410HESBALANCE02CALVAR.summary2,
        "averageValue2": P410HESBALANCE02CALVAR.summary3,
        "averageValue3": P410HESBALANCE02CALVAR.summary4,
        "targetValue": P410HESBALANCE02CALVAR.targetValue,
        "targetValue1": P410HESBALANCE02CALVAR.targetValue1,
        "targetValue2": P410HESBALANCE02CALVAR.targetValue2,
        "targetValue3": P410HESBALANCE02CALVAR.targetValue3,
        "targetValue4": P410HESBALANCE02CALVAR.targetValue4,
        "targetValue5": P410HESBALANCE02CALVAR.targetValue5,
        "targetValue6": P410HESBALANCE02CALVAR.targetValue6,
        "targetValue7": P410HESBALANCE02CALVAR.targetValue7,
        "targetValue8": P410HESBALANCE02CALVAR.targetValue8,
        "targetValue9": P410HESBALANCE02CALVAR.targetValue9,
        "targetValue10": P410HESBALANCE02CALVAR.targetValue10,
        "targetValue11": P410HESBALANCE02CALVAR.targetValue11,
      },
    );

    // var input = [];
    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    //   input = databuff;
    //   List<P410HESBALANCECALDATAclass> outputdata = input.map((data) {
    //     return P410HESBALANCECALDATAclass(
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

  Future<void> _P410HESBALANCECALDATA_GET2(
      List<P410HESBALANCECALDATAclass> toAdd,
      Emitter<List<P410HESBALANCECALDATAclass>> emit) async {
    List<P410HESBALANCECALDATAclass> output = [];
    //-------------------------------------------------------------------------------------
    FreeLoading(P410HESBALANCE02CALMAINcontext);
    final response = await Dio().post(
      "${serverNRHES}GETVALUE01_HES",
      data: {},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print('BlocEvent' + response.data[0]['value'].toString());
      // print(response.data[0]['Refresh']);
      // P400CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P410HESBALANCECALDATAclass> outputdata = input.map((data) {
        return P410HESBALANCECALDATAclass(
          GETVALUE: data['value'],
        );
      }).toList();
      output = outputdata;
      emit(output);
      Navigator.of(P410HESBALANCE02CALMAINcontext).pop();
    } else {
      output = [];
      emit(output);
    }
  }

  Future<void> _P410HESBALANCECALDATA_GET3(
      List<P410HESBALANCECALDATAclass> toAdd,
      Emitter<List<P410HESBALANCECALDATAclass>> emit) async {
    List<P410HESBALANCECALDATAclass> output = [];
    print('SentTemp');
    final response = await Dio().post(
      "${serverNRHES}SendDataTemp_HES",
      data: {
        "DateTime": P400CALVAR.timefornodered,
        "UserLogin": USERDATA.NAME,
        "Branch": USERDATA.Branch,
        "status": P410HESBALANCE02CALVAR.status,
        "WeightReal": P410HESBALANCE02CALVAR.inputValue,
        "InstrumentName": P410HESBALANCE02CALVAR.InstrumentName,
        "Approve_By": P410HESBALANCE02CALVAR.Approve_By,
        "Password": P410HESBALANCE02CALVAR.password,
        "averageValue": P410HESBALANCE02CALVAR.summary1,
        "averageValue1": P410HESBALANCE02CALVAR.summary2,
        "averageValue2": P410HESBALANCE02CALVAR.summary3,
        "averageValue3": P410HESBALANCE02CALVAR.summary4,
        "targetValue": P410HESBALANCE02CALVAR.targetValue,
        "targetValue1": P410HESBALANCE02CALVAR.targetValue1,
        "targetValue2": P410HESBALANCE02CALVAR.targetValue2,
        "targetValue3": P410HESBALANCE02CALVAR.targetValue3,
        "targetValue4": P410HESBALANCE02CALVAR.targetValue4,
        "targetValue5": P410HESBALANCE02CALVAR.targetValue5,
        "targetValue6": P410HESBALANCE02CALVAR.targetValue6,
        "targetValue7": P410HESBALANCE02CALVAR.targetValue7,
        "targetValue8": P410HESBALANCE02CALVAR.targetValue8,
        "targetValue9": P410HESBALANCE02CALVAR.targetValue9,
        "targetValue10": P410HESBALANCE02CALVAR.targetValue10,
        "targetValue11": P410HESBALANCE02CALVAR.targetValue11,
      },
    ); // List<P410HESBALANCECALDATAclass> datadummy = [
    //   P410HESBALANCECALDATAclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P410HESBALANCECALDATAclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P410HESBALANCECALDATAclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P410HESBALANCECALDATAclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P410HESBALANCECALDATA_GET4(
      List<P410HESBALANCECALDATAclass> toAdd,
      Emitter<List<P410HESBALANCECALDATAclass>> emit) async {
    List<P410HESBALANCECALDATAclass> output = [];
    print('GetTemp');
    final response = await Dio().post(
      "${serverNRHES}GetDataTemp_HES",
      data: {P410HESBALANCE02CALVAR.InstrumentName},
    );
    var input = [];
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.data);
      // print(response.data[0]['Refresh']);
      // P400CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P410HESBALANCECALDATAclass> outputdata = input.map((data) {
        return P410HESBALANCECALDATAclass(
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

  Future<void> _P410HESBALANCECALDATA_GET5(
      List<P410HESBALANCECALDATAclass> toAdd,
      Emitter<List<P410HESBALANCECALDATAclass>> emit) async {
    List<P410HESBALANCECALDATAclass> output = [];
    print('GetTemp');
    final response = await Dio().post(
      "${serverNRHES}ClearDataTemp_HES",
      data: {P410HESBALANCE02CALVAR.InstrumentName},
    );
    var input = [];
    if (response.statusCode == 200) {
      // print(response.statusCode);
      // print(response.data);
      // print(response.data[0]['Refresh']);
      // P400CALVAR.Refresh = response.data[0]['Refresh'];
      var databuff = response.data;
      input = databuff;
      List<P410HESBALANCECALDATAclass> outputdata = input.map((data) {
        return P410HESBALANCECALDATAclass(
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

  Future<void> _P410HESBALANCECALDATA_FLUSH(
      List<P410HESBALANCECALDATAclass> toAdd,
      Emitter<List<P410HESBALANCECALDATAclass>> emit) async {
    List<P410HESBALANCECALDATAclass> output = [];
    emit(output);
  }
}

class P410HESBALANCECALDATAclass {
  P410HESBALANCECALDATAclass({
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
