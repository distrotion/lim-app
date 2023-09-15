import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P4BALANCEBODYSLUDGE/P4BALANCEBODYSLUDGEmain.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P4BALANCEBODYSLUDGEGETSET_Event {}

class P4BALANCEBODYSLUDGEGETSET_GET extends P4BALANCEBODYSLUDGEGETSET_Event {}

class P4BALANCEBODYSLUDGEGETSET_SET extends P4BALANCEBODYSLUDGEGETSET_Event {}

class flush extends P4BALANCEBODYSLUDGEGETSET_Event {}

class P4BALANCEBODYSLUDGEGETSET_Bloc extends Bloc<
    P4BALANCEBODYSLUDGEGETSET_Event, P4BALANCEBODYSLUDGEGETSETCLASS> {
  P4BALANCEBODYSLUDGEGETSET_Bloc() : super(P4BALANCEBODYSLUDGEGETSETCLASS()) {
    on<P4BALANCEBODYSLUDGEGETSET_GET>((event, emit) {
      return _P4BALANCEBODYSLUDGEGETSET_GET(
          P4BALANCEBODYSLUDGEGETSETCLASS(), emit);
    });
    on<P4BALANCEBODYSLUDGEGETSET_SET>((event, emit) {
      return _P4BALANCEBODYSLUDGEGETSET_SET(
          P4BALANCEBODYSLUDGEGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P4BALANCEBODYSLUDGEGETSETCLASS(), emit);
    });
  }
  Future<void> _P4BALANCEBODYSLUDGEGETSET_GET(
      P4BALANCEBODYSLUDGEGETSETCLASS toAdd,
      Emitter<P4BALANCEBODYSLUDGEGETSETCLASS> emit) async {
    P4BALANCEBODYSLUDGEGETSETCLASS output = P4BALANCEBODYSLUDGEGETSETCLASS();

    FreeLoading(P4BALANCEBODYSLUDGEcontext);

    final response = await Dio().post(
      '${serverN}/balance01GETREGISTERSET_STD',
      data: {
        "collection": "BALANCEdataSLUDGE",
      },
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

        // if (databuff[0]['data'] != null) {
        //   output.W11 = databuff[0]['data']['W11'] != null
        //       ? databuff[0]['data']['W11'].toString()
        //       : '';
        // }
        // if (databuff[0]['data'] != null) {
        //   output.W12 = databuff[0]['data']['W12'] != null
        //       ? databuff[0]['data']['W12'].toString()
        //       : '';
        // }
        // if (databuff[0]['data'] != null) {
        //   output.W13 = databuff[0]['data']['W13'] != null
        //       ? databuff[0]['data']['W13'].toString()
        //       : '';
        // }
        // if (databuff[0]['data'] != null) {
        //   output.W14 = databuff[0]['data']['W14'] != null
        //       ? databuff[0]['data']['W14'].toString()
        //       : '';
        // }
      }
    }

    Navigator.pop(P4BALANCEBODYSLUDGEcontext);
    emit(output);
  }

//34
//19
  Future<void> _P4BALANCEBODYSLUDGEGETSET_SET(
      P4BALANCEBODYSLUDGEGETSETCLASS toAdd,
      Emitter<P4BALANCEBODYSLUDGEGETSETCLASS> emit) async {
    P4BALANCEBODYSLUDGEGETSETCLASS output = P4BALANCEBODYSLUDGEGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P4BALANCEBODYSLUDGEGETSETCLASS toAdd,
      Emitter<P4BALANCEBODYSLUDGEGETSETCLASS> emit) async {
    P4BALANCEBODYSLUDGEGETSETCLASS output = P4BALANCEBODYSLUDGEGETSETCLASS();
    emit(output);
  }
}

class P4BALANCEBODYSLUDGEGETSETCLASS {
  P4BALANCEBODYSLUDGEGETSETCLASS({
    this.ReqNo = '',
    this.InstrumentName = '',
    this.CustShort = '',
    this.W1_11 = '',
    this.W1_21 = '',
    this.W1_VOLUME = '',
    this.W1_ANS = '',
    this.W2_11 = '',
    this.W2_21 = '',
    this.W2_VOLUME = '',
    this.W2_ANS = '',
    this.UID = '',
    this.ItemName = '',
    this.NOitem = '',
  });
  String ReqNo;
  String InstrumentName;
  String CustShort;

  String W1_11;
  String W1_21;
  String W1_VOLUME;
  String W1_ANS;
  String W2_11;
  String W2_21;
  String W2_VOLUME;
  String W2_ANS;

  String UID;
  String ItemName;

  String NOitem;
}
