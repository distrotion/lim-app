import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P3BALANCEBODYICP01/P3BALANCEBODYICP01.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P3BALANCEBODYICP01GETSET_Event {}

class P3BALANCEBODYICP01GETSET_GET extends P3BALANCEBODYICP01GETSET_Event {}

class P3BALANCEBODYICP01GETSET_SET extends P3BALANCEBODYICP01GETSET_Event {}

class flush extends P3BALANCEBODYICP01GETSET_Event {}

class P3BALANCEBODYICP01GETSET_Bloc extends Bloc<P3BALANCEBODYICP01GETSET_Event,
    P3BALANCEBODYICP01GETSETCLASS> {
  P3BALANCEBODYICP01GETSET_Bloc() : super(P3BALANCEBODYICP01GETSETCLASS()) {
    on<P3BALANCEBODYICP01GETSET_GET>((event, emit) {
      return _P3BALANCEBODYICP01GETSET_GET(
          P3BALANCEBODYICP01GETSETCLASS(), emit);
    });
    on<P3BALANCEBODYICP01GETSET_SET>((event, emit) {
      return _P3BALANCEBODYICP01GETSET_SET(
          P3BALANCEBODYICP01GETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P3BALANCEBODYICP01GETSETCLASS(), emit);
    });
  }
  Future<void> _P3BALANCEBODYICP01GETSET_GET(
      P3BALANCEBODYICP01GETSETCLASS toAdd,
      Emitter<P3BALANCEBODYICP01GETSETCLASS> emit) async {
    P3BALANCEBODYICP01GETSETCLASS output = P3BALANCEBODYICP01GETSETCLASS();

    FreeLoading(P03BALANCEBODYICP01context);

    final response = await Dio().post(
      'http://172.23.10.40:2600/balance01GETREGISTERSET_S',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);
      if (databuff.length > 0) {
        output.ReqNo =
            databuff[0]['ReqNo'] != null ? databuff[0]['ReqNo'].toString() : '';

        output.InstrumentName = databuff[0]['InstrumentName'] != null
            ? databuff[0]['InstrumentName'].toString()
            : '';

        output.CustShort = databuff[0]['CustShort'] != null
            ? databuff[0]['CustShort'].toString()
            : '';
        if (databuff[0]['data'] != null) {
          output.W11 = databuff[0]['data']['W11'] != null
              ? databuff[0]['data']['W11'].toString()
              : '';
        }
        if (databuff[0]['data_adj'] != null) {
          output.W11_adj = databuff[0]['data_adj']['W11'] != null
              ? databuff[0]['data_adj']['W11'].toString()
              : '';
        }
      }
    }

    Navigator.pop(P03BALANCEBODYICP01context);
    emit(output);
  }

//34
//19
  Future<void> _P3BALANCEBODYICP01GETSET_SET(
      P3BALANCEBODYICP01GETSETCLASS toAdd,
      Emitter<P3BALANCEBODYICP01GETSETCLASS> emit) async {
    P3BALANCEBODYICP01GETSETCLASS output = P3BALANCEBODYICP01GETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P3BALANCEBODYICP01GETSETCLASS toAdd,
      Emitter<P3BALANCEBODYICP01GETSETCLASS> emit) async {
    P3BALANCEBODYICP01GETSETCLASS output = P3BALANCEBODYICP01GETSETCLASS();
    emit(output);
  }
}

class P3BALANCEBODYICP01GETSETCLASS {
  P3BALANCEBODYICP01GETSETCLASS({
    this.ReqNo = '',
    this.InstrumentName = '',
    this.CustShort = '',
    this.W11 = '',
    this.W11_adj = '',
  });
  String ReqNo;
  String InstrumentName;
  String CustShort;

  String W11;
  String W11_adj;
}
