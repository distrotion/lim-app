import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P52IC01BODYSTD/P52IC01BODYSTD.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P52IC01BODYSTDGETSET_Event {}

class P52IC01BODYSTDGETSET_GET extends P52IC01BODYSTDGETSET_Event {}

class P52IC01BODYSTDGETSET_SET extends P52IC01BODYSTDGETSET_Event {}

class flush extends P52IC01BODYSTDGETSET_Event {}

class P52IC01BODYSTDGETSET_Bloc
    extends Bloc<P52IC01BODYSTDGETSET_Event, P52IC01BODYSTDGETSETCLASS> {
  P52IC01BODYSTDGETSET_Bloc() : super(P52IC01BODYSTDGETSETCLASS()) {
    on<P52IC01BODYSTDGETSET_GET>((event, emit) {
      return _P52IC01BODYSTDGETSET_GET(P52IC01BODYSTDGETSETCLASS(), emit);
    });
    on<P52IC01BODYSTDGETSET_SET>((event, emit) {
      return _P52IC01BODYSTDGETSET_SET(P52IC01BODYSTDGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P52IC01BODYSTDGETSETCLASS(), emit);
    });
  }
  Future<void> _P52IC01BODYSTDGETSET_GET(P52IC01BODYSTDGETSETCLASS toAdd,
      Emitter<P52IC01BODYSTDGETSETCLASS> emit) async {
    P52IC01BODYSTDGETSETCLASS output = P52IC01BODYSTDGETSETCLASS();

    FreeLoading(P52IC01BODYSTDcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTERSET_${USERDATA.INSMASTER}',
      data: {
        "collection": "XRFdataSTD",
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

    Navigator.pop(P52IC01BODYSTDcontext);
    emit(output);
  }

//34
//19
  Future<void> _P52IC01BODYSTDGETSET_SET(P52IC01BODYSTDGETSETCLASS toAdd,
      Emitter<P52IC01BODYSTDGETSETCLASS> emit) async {
    P52IC01BODYSTDGETSETCLASS output = P52IC01BODYSTDGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P52IC01BODYSTDGETSETCLASS toAdd,
      Emitter<P52IC01BODYSTDGETSETCLASS> emit) async {
    P52IC01BODYSTDGETSETCLASS output = P52IC01BODYSTDGETSETCLASS();
    emit(output);
  }
}

class P52IC01BODYSTDGETSETCLASS {
  P52IC01BODYSTDGETSETCLASS({
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
