// ignore_for_file: camel_case_types, non_constant_identifier_names, avoid_print, use_build_context_synchronously, file_names

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lim_app/page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALMAIN.dart';
import 'package:lim_app/page/P400CAL/P400CALVAR.dart';
import '../../data/global.dart';
import '../../page/P310BP12BALANCE01CAL/P310BP12BALANCE01CALVAR.dart';
import '../../page/P420CALDATALOG/P420CALDATALOGVAR.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P420HESBALANCEDATALOG_Event {}

class P420HESBALANCEDATALOG_GET extends P420HESBALANCEDATALOG_Event {}

class P420HESBALANCEDATALOG_GET2 extends P420HESBALANCEDATALOG_Event {}

class P420HESBALANCEDATALOG_GET3 extends P420HESBALANCEDATALOG_Event {}

class P420HESBALANCEDATALOG_FLUSH extends P420HESBALANCEDATALOG_Event {}

class P420HESBALANCEDATALOG_Bloc extends Bloc<P420HESBALANCEDATALOG_Event,
    List<P420HESBALANCEDATALOGclass>> {
  P420HESBALANCEDATALOG_Bloc() : super([]) {
    on<P420HESBALANCEDATALOG_GET>((event, emit) {
      return _P420HESBALANCEDATALOG_GET([], emit);
    });

    on<P420HESBALANCEDATALOG_GET2>((event, emit) {
      return _P420HESBALANCEDATALOG_GET2([], emit);
    });
    on<P420HESBALANCEDATALOG_GET3>((event, emit) {
      return _P420HESBALANCEDATALOG_GET3([], emit);
    });
    on<P420HESBALANCEDATALOG_FLUSH>((event, emit) {
      return _P420HESBALANCEDATALOG_FLUSH([], emit);
    });
    final List<List<String>> data;
  }

  Future<void> _P420HESBALANCEDATALOG_GET(
      List<P420HESBALANCEDATALOGclass> toAdd,
      Emitter<List<P420HESBALANCEDATALOGclass>> emit) async {
    List<P420HESBALANCEDATALOGclass> output = [];
    //-------------------------------------------------------------------------------------
    final response = await Dio().post(
      "${serverNRHES}GETDATALOG_HES",
      data: {
        "DateTime": P400CALVAR.timefornodered,
        "InstrumentName": P420CALDATALOGVAR.InstrumentName,
      },
    );
    var input = [];
    if (response.statusCode == 200) {
      print(response.statusCode);
      // print(response.data);
      var databuff = response.data;
      input = databuff;

      // var input = dummyCusService;

      List<P420HESBALANCEDATALOGclass> outputdata = input.map((data) {
        return P420HESBALANCEDATALOGclass(
          DATETIME: (data['DateTime'] != null &&
                  data['DateTime'].toString().length >= 16)
              ? data['DateTime'].toString().substring(0, 16)
              : '',
          CAL_1G_NO1: savenull(data['Cal_1g_No1']),
          CAL_1G_NO2: savenull(data['Cal_1g_No2']),
          CAL_1G_NO3: savenull(data['Cal_1g_No3']),
          CAL_1G_AVERAGE: savenull(data['Cal_1g_Average']),
          CAL_50G_NO1: savenull(data['Cal_50g_No1']),
          CAL_50G_NO2: savenull(data['Cal_50g_No2']),
          CAL_50G_NO3: savenull(data['Cal_50g_No3']),
          CAL_50G_AVERAGE: savenull(data['Cal_50g_Average']),
          CAL_100G_NO1: savenull(data['Cal_100g_No1']),
          CAL_100G_NO2: savenull(data['Cal_100g_No2']),
          CAL_100G_NO3: savenull(data['Cal_100g_No3']),
          CAL_100G_AVERAGE: savenull(data['Cal_100g_Average']),
          CAL_200G_NO1: savenull(data['Cal_200g_No1']),
          CAL_200G_NO2: savenull(data['Cal_200g_No2']),
          CAL_200G_NO3: savenull(data['Cal_200g_No3']),
          CAL_200G_AVERAGE: savenull(data['Cal_200g_Average']),
          CHECK_BY: savenull(data['Check_By']),
          APPROVE_BY: savenull(data['Approve_By']),
          STATUS: savenull(data['Status']),
        );
      }).toList();

      output = outputdata;
      emit(output);
    } else {
      output = [];
      emit(output);
    }
  }

  Future<void> _P420HESBALANCEDATALOG_GET2(
      List<P420HESBALANCEDATALOGclass> toAdd,
      Emitter<List<P420HESBALANCEDATALOGclass>> emit) async {
    // List<P420HESBALANCEDATALOGclass> output = [];
    //-------------------------------------------------------------------------------------
    // var input = dummydatainput2;

    // List<P420HESBALANCEDATALOGclass> outputdata = input
    //     .where((data) =>
    //         data['location'] == 'ESIE1' &&
    //         data['plant'] == 'YES' &&
    //         data['step01'] == 'YES')
    //     .map((data) {
    //   return P420HESBALANCEDATALOGclass(
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

  Future<void> _P420HESBALANCEDATALOG_GET3(
      List<P420HESBALANCEDATALOGclass> toAdd,
      Emitter<List<P420HESBALANCEDATALOGclass>> emit) async {
    // List<P420HESBALANCEDATALOGclass> output = [];
    //-------------------------------------------------------------------------------------
    // List<P420HESBALANCEDATALOGclass> datadummy = [
    //   P420HESBALANCEDATALOGclass(
    //     PLANT: "PH PO:1234",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //   ),
    //   P420HESBALANCEDATALOGclass(
    //     PLANT: "PH PO:5555",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //     STEP03: "YES",
    //     STEP04: "YES",
    //   ),
    //   P420HESBALANCEDATALOGclass(
    //     PLANT: "PH PO:5556",
    //     STEP01: "YES",
    //     STEP02: "YES",
    //   ),
    //   P420HESBALANCEDATALOGclass(
    //     PLANT: "PH PO:9999",
    //   ),
    // ];

    // //-------------------------------------------------------------------------------------
    // output = datadummy;
    // emit(output);
  }

  Future<void> _P420HESBALANCEDATALOG_FLUSH(
      List<P420HESBALANCEDATALOGclass> toAdd,
      Emitter<List<P420HESBALANCEDATALOGclass>> emit) async {
    List<P420HESBALANCEDATALOGclass> output = [];
    emit(output);
  }
}

class P420HESBALANCEDATALOGclass {
  P420HESBALANCEDATALOGclass(
      {this.DATETIME = '',
      this.CAL_1G_NO1 = '',
      this.CAL_1G_NO2 = '',
      this.CAL_1G_NO3 = '',
      this.CAL_1G_AVERAGE = '',
      this.CAL_50G_NO1 = '',
      this.CAL_50G_NO2 = '',
      this.CAL_50G_NO3 = '',
      this.CAL_50G_AVERAGE = '',
      this.CAL_100G_NO1 = '',
      this.CAL_100G_NO2 = '',
      this.CAL_100G_NO3 = '',
      this.CAL_100G_AVERAGE = '',
      this.CAL_200G_NO1 = '',
      this.CAL_200G_NO2 = '',
      this.CAL_200G_NO3 = '',
      this.CAL_200G_AVERAGE = '',
      this.CHECK_BY = '',
      this.APPROVE_BY = '',
      this.STATUS = ''});

  String DATETIME;
  String CAL_1G_NO1;
  String CAL_1G_NO2;
  String CAL_1G_NO3;
  String CAL_1G_AVERAGE;
  String CAL_50G_NO1;
  String CAL_50G_NO2;
  String CAL_50G_NO3;
  String CAL_50G_AVERAGE;
  String CAL_100G_NO1;
  String CAL_100G_NO2;
  String CAL_100G_NO3;
  String CAL_100G_AVERAGE;
  String CAL_200G_NO1;
  String CAL_200G_NO2;
  String CAL_200G_NO3;
  String CAL_200G_AVERAGE;
  String CHECK_BY;
  String APPROVE_BY;
  String STATUS;
}

String savenull(input) {
  String output = '';
  if (input != null) {
    output = input.toString();
  }
  return output;
}

String formatDate(String? date) {
  if (date == null || date.isEmpty) return '';
  if (date == 'CLOSE LINE') return 'CLOSE LINE';
  try {
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(date);
    return DateFormat('dd-MMM').format(parsedDate);
  } catch (e) {
    return '';
  }
}
