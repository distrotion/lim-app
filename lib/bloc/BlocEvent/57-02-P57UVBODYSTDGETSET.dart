import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P57UVBODYSTD/P57UVBODYSTD.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P57UVBODYSTDGETSET_Event {}

class P57UVBODYSTDGETSET_GET extends P57UVBODYSTDGETSET_Event {}

class P57UVBODYSTDGETSET_SET extends P57UVBODYSTDGETSET_Event {}

class flush extends P57UVBODYSTDGETSET_Event {}

class P57UVBODYSTDGETSET_Bloc
    extends Bloc<P57UVBODYSTDGETSET_Event, P57UVBODYSTDGETSETCLASS> {
  P57UVBODYSTDGETSET_Bloc() : super(P57UVBODYSTDGETSETCLASS()) {
    on<P57UVBODYSTDGETSET_GET>((event, emit) {
      return _P57UVBODYSTDGETSET_GET(P57UVBODYSTDGETSETCLASS(), emit);
    });
    on<P57UVBODYSTDGETSET_SET>((event, emit) {
      return _P57UVBODYSTDGETSET_SET(P57UVBODYSTDGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P57UVBODYSTDGETSETCLASS(), emit);
    });
  }
  Future<void> _P57UVBODYSTDGETSET_GET(P57UVBODYSTDGETSETCLASS toAdd,
      Emitter<P57UVBODYSTDGETSETCLASS> emit) async {
    P57UVBODYSTDGETSETCLASS output = P57UVBODYSTDGETSETCLASS();

    FreeLoading(P57UVBODYSTDcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTERSET_${USERDATA.INSMASTER}',
      data: {
        "collection": "UVdataSTD",
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
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

        if (databuff[0]['data01'] != null) {
          output.D01W11 = databuff[0]['data01']['W11'] != null
              ? databuff[0]['data01']['W11'].toString()
              : '';
        }
        if (databuff[0]['data01'] != null) {
          output.D01W21 = databuff[0]['data01']['W21'] != null
              ? databuff[0]['data01']['W21'].toString()
              : '';
        }
        if (databuff[0]['data01_volum'] != null) {
          output.D01VOLUME = databuff[0]['data01_volum']['volum'] != null
              ? databuff[0]['data01_volum']['volum'].toString()
              : '';
        }
        output.D01NOitem = databuff[0]['D01NOitem'] != null
            ? databuff[0]['D01NOitem'].toString()
            : '';

        if (databuff[0]['data02'] != null) {
          output.D02W11 = databuff[0]['data02']['W11'] != null
              ? databuff[0]['data02']['W11'].toString()
              : '';
        }
        if (databuff[0]['data02'] != null) {
          output.D02W21 = databuff[0]['data02']['W21'] != null
              ? databuff[0]['data02']['W21'].toString()
              : '';
        }
        if (databuff[0]['data02_volum'] != null) {
          output.D02VOLUME = databuff[0]['data02_volum']['volum'] != null
              ? databuff[0]['data02_volum']['volum'].toString()
              : '';
        }

        output.D02NOitem = databuff[0]['D02NOitem'] != null
            ? databuff[0]['D02NOitem'].toString()
            : '';

        output.SamplingDate = databuff[0]['SamplingDate'] != null
            ? databuff[0]['SamplingDate'].toString()
            : '';

        output.DueDate1 = databuff[0]['DueDate1'] != null
            ? databuff[0]['DueDate1'].toString()
            : '';

        output.SampleName = databuff[0]['SampleName'] != null
            ? databuff[0]['SampleName'].toString()
            : '';

        output.Mag =
            databuff[0]['Mag'] != null ? databuff[0]['Mag'].toString() : '';
        output.RemarkNo = databuff[0]['RemarkNo'] != null
            ? databuff[0]['RemarkNo'].toString()
            : '';
        output.SampleCode = databuff[0]['SampleCode'] != null
            ? databuff[0]['SampleCode'].toString()
            : '';
      }
    }

    Navigator.pop(P57UVBODYSTDcontext);
    emit(output);
  }

//34
//19
  Future<void> _P57UVBODYSTDGETSET_SET(P57UVBODYSTDGETSETCLASS toAdd,
      Emitter<P57UVBODYSTDGETSETCLASS> emit) async {
    P57UVBODYSTDGETSETCLASS output = P57UVBODYSTDGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P57UVBODYSTDGETSETCLASS toAdd,
      Emitter<P57UVBODYSTDGETSETCLASS> emit) async {
    P57UVBODYSTDGETSETCLASS output = P57UVBODYSTDGETSETCLASS();
    emit(output);
  }
}

class P57UVBODYSTDGETSETCLASS {
  P57UVBODYSTDGETSETCLASS({
    this.ReqNo = '',
    this.InstrumentName = '',
    this.CustShort = '',
    //
    this.D01W11 = '',
    this.D01W21 = '',
    this.D01VOLUME = '',
    this.D01ANS = '',
    this.D01NOitem = '',
    this.D02W11 = '',
    this.D02W21 = '',
    this.D02VOLUME = '',
    this.D02ANS = '',
    this.D02NOitem = '',
    //
    this.UID = '',
    this.ItemName = '',
    this.SamplingDate = '',
    this.DueDate1 = '',
    this.SampleName = '',
    this.Mag = '',
    this.RemarkNo = '',
    this.SampleCode = '',
  });
  String ReqNo;
  String InstrumentName;
  String CustShort;

  String D01W11;
  String D01W21;
  String D01VOLUME;
  String D01ANS;
  String D01NOitem;
  String D02W11;
  String D02W21;
  String D02VOLUME;
  String D02ANS;
  String D02NOitem;

  String UID;
  String ItemName;

  String SamplingDate;
  String DueDate1;
  String SampleName;
  String Mag;
  String RemarkNo;
  String SampleCode;
}
