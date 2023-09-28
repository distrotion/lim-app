import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P2BALANCEBODYCW/P2BALANCEBODYCW.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P2BALANCEBODYCWGETSET_Event {}

class P2BALANCEBODYCWGETSET_GET extends P2BALANCEBODYCWGETSET_Event {}

class P2BALANCEBODYCWGETSET_SET extends P2BALANCEBODYCWGETSET_Event {}

class flush extends P2BALANCEBODYCWGETSET_Event {}

class P2BALANCEBODYCWGETSET_Bloc
    extends Bloc<P2BALANCEBODYCWGETSET_Event, P2BALANCEBODYCWGETSETCLASS> {
  P2BALANCEBODYCWGETSET_Bloc() : super(P2BALANCEBODYCWGETSETCLASS()) {
    on<P2BALANCEBODYCWGETSET_GET>((event, emit) {
      return _P2BALANCEBODYCWGETSET_GET(P2BALANCEBODYCWGETSETCLASS(), emit);
    });
    on<P2BALANCEBODYCWGETSET_SET>((event, emit) {
      return _P2BALANCEBODYCWGETSET_SET(P2BALANCEBODYCWGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P2BALANCEBODYCWGETSETCLASS(), emit);
    });
  }
  Future<void> _P2BALANCEBODYCWGETSET_GET(P2BALANCEBODYCWGETSETCLASS toAdd,
      Emitter<P2BALANCEBODYCWGETSETCLASS> emit) async {
    P2BALANCEBODYCWGETSETCLASS output = P2BALANCEBODYCWGETSETCLASS();

    FreeLoading(P02BALANCEBODYCWcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/balance01GETREGISTERSET_C',
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

    Navigator.pop(P02BALANCEBODYCWcontext);
    emit(output);
  }

//34
//19
  Future<void> _P2BALANCEBODYCWGETSET_SET(P2BALANCEBODYCWGETSETCLASS toAdd,
      Emitter<P2BALANCEBODYCWGETSETCLASS> emit) async {
    P2BALANCEBODYCWGETSETCLASS output = P2BALANCEBODYCWGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P2BALANCEBODYCWGETSETCLASS toAdd,
      Emitter<P2BALANCEBODYCWGETSETCLASS> emit) async {
    P2BALANCEBODYCWGETSETCLASS output = P2BALANCEBODYCWGETSETCLASS();
    emit(output);
  }
}

class P2BALANCEBODYCWGETSETCLASS {
  P2BALANCEBODYCWGETSETCLASS({
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
