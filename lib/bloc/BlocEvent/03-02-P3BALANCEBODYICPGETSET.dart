import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P3BALANCEBODYICP/P3BALANCEBODYICP.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P3BALANCEBODYICPGETSET_Event {}

class P3BALANCEBODYICPGETSET_GET extends P3BALANCEBODYICPGETSET_Event {}

class P3BALANCEBODYICPGETSET_SET extends P3BALANCEBODYICPGETSET_Event {}

class flush extends P3BALANCEBODYICPGETSET_Event {}

class P3BALANCEBODYICPGETSET_Bloc
    extends Bloc<P3BALANCEBODYICPGETSET_Event, P3BALANCEBODYICPGETSETCLASS> {
  P3BALANCEBODYICPGETSET_Bloc() : super(P3BALANCEBODYICPGETSETCLASS()) {
    on<P3BALANCEBODYICPGETSET_GET>((event, emit) {
      return _P3BALANCEBODYICPGETSET_GET(P3BALANCEBODYICPGETSETCLASS(), emit);
    });
    on<P3BALANCEBODYICPGETSET_SET>((event, emit) {
      return _P3BALANCEBODYICPGETSET_SET(P3BALANCEBODYICPGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P3BALANCEBODYICPGETSETCLASS(), emit);
    });
  }
  Future<void> _P3BALANCEBODYICPGETSET_GET(P3BALANCEBODYICPGETSETCLASS toAdd,
      Emitter<P3BALANCEBODYICPGETSETCLASS> emit) async {
    P3BALANCEBODYICPGETSETCLASS output = P3BALANCEBODYICPGETSETCLASS();

    FreeLoading(P03BALANCEBODYICPcontext);

    final response = await Dio().post(
      '${serverN}/balance01GETREGISTERSET_S',
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

    Navigator.pop(P03BALANCEBODYICPcontext);
    emit(output);
  }

//34
//19
  Future<void> _P3BALANCEBODYICPGETSET_SET(P3BALANCEBODYICPGETSETCLASS toAdd,
      Emitter<P3BALANCEBODYICPGETSETCLASS> emit) async {
    P3BALANCEBODYICPGETSETCLASS output = P3BALANCEBODYICPGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P3BALANCEBODYICPGETSETCLASS toAdd,
      Emitter<P3BALANCEBODYICPGETSETCLASS> emit) async {
    P3BALANCEBODYICPGETSETCLASS output = P3BALANCEBODYICPGETSETCLASS();
    emit(output);
  }
}

class P3BALANCEBODYICPGETSETCLASS {
  P3BALANCEBODYICPGETSETCLASS({
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
