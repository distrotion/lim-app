import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P2BALANCEBODYCW01/P2BALANCEBODYCW01.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P2BALANCEBODYCW01GETSET_Event {}

class P2BALANCEBODYCW01GETSET_GET extends P2BALANCEBODYCW01GETSET_Event {}

class P2BALANCEBODYCW01GETSET_SET extends P2BALANCEBODYCW01GETSET_Event {}

class flush extends P2BALANCEBODYCW01GETSET_Event {}

class P2BALANCEBODYCW01GETSET_Bloc
    extends Bloc<P2BALANCEBODYCW01GETSET_Event, P2BALANCEBODYCW01GETSETCLASS> {
  P2BALANCEBODYCW01GETSET_Bloc() : super(P2BALANCEBODYCW01GETSETCLASS()) {
    on<P2BALANCEBODYCW01GETSET_GET>((event, emit) {
      return _P2BALANCEBODYCW01GETSET_GET(P2BALANCEBODYCW01GETSETCLASS(), emit);
    });
    on<P2BALANCEBODYCW01GETSET_SET>((event, emit) {
      return _P2BALANCEBODYCW01GETSET_SET(P2BALANCEBODYCW01GETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P2BALANCEBODYCW01GETSETCLASS(), emit);
    });
  }
  Future<void> _P2BALANCEBODYCW01GETSET_GET(P2BALANCEBODYCW01GETSETCLASS toAdd,
      Emitter<P2BALANCEBODYCW01GETSETCLASS> emit) async {
    P2BALANCEBODYCW01GETSETCLASS output = P2BALANCEBODYCW01GETSETCLASS();

    FreeLoading(P02BALANCEBODYCW01context);

    final response = await Dio().post(
      '${serverN}/balance01GETREGISTERSET_C',
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
        output.UID =
            databuff[0]['UID'] != null ? databuff[0]['UID'].toString() : '';

        output.ItemName = databuff[0]['ItemName'] != null
            ? databuff[0]['ItemName'].toString()
            : '';
        output.NOitem = databuff[0]['NOitem'] != null
            ? databuff[0]['NOitem'].toString()
            : '';
        //ItemName

        if (databuff[0]['data'] != null) {
          output.W11 = databuff[0]['data']['W11'] != null
              ? databuff[0]['data']['W11'].toString()
              : '';
        }
        if (databuff[0]['data'] != null) {
          output.W12 = databuff[0]['data']['W12'] != null
              ? databuff[0]['data']['W12'].toString()
              : '';
        }
        if (databuff[0]['data'] != null) {
          output.W13 = databuff[0]['data']['W13'] != null
              ? databuff[0]['data']['W13'].toString()
              : '';
        }
        if (databuff[0]['data'] != null) {
          output.W14 = databuff[0]['data']['W14'] != null
              ? databuff[0]['data']['W14'].toString()
              : '';
        }
      }
    }

    Navigator.pop(P02BALANCEBODYCW01context);
    emit(output);
  }

//34
//19
  Future<void> _P2BALANCEBODYCW01GETSET_SET(P2BALANCEBODYCW01GETSETCLASS toAdd,
      Emitter<P2BALANCEBODYCW01GETSETCLASS> emit) async {
    P2BALANCEBODYCW01GETSETCLASS output = P2BALANCEBODYCW01GETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P2BALANCEBODYCW01GETSETCLASS toAdd,
      Emitter<P2BALANCEBODYCW01GETSETCLASS> emit) async {
    P2BALANCEBODYCW01GETSETCLASS output = P2BALANCEBODYCW01GETSETCLASS();
    emit(output);
  }
}

class P2BALANCEBODYCW01GETSETCLASS {
  P2BALANCEBODYCW01GETSETCLASS({
    this.ReqNo = '',
    this.InstrumentName = '',
    this.CustShort = '',
    this.W11 = '',
    this.W12 = '',
    this.W13 = '',
    this.W14 = '',
    this.UID = '',
    this.ItemName = '',
    this.NOitem = '',
  });
  String ReqNo;
  String InstrumentName;
  String CustShort;

  String W11;
  String W12;
  String W13;
  String W14;
  String UID;
  String ItemName;

  String NOitem;
}
