import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P58OCABODYSTD/P58OCABODYSTD.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P58OCABODYSTDGETSET_Event {}

class P58OCABODYSTDGETSET_GET extends P58OCABODYSTDGETSET_Event {}

class P58OCABODYSTDGETSET_SET extends P58OCABODYSTDGETSET_Event {}

class flush extends P58OCABODYSTDGETSET_Event {}

class P58OCABODYSTDGETSET_Bloc
    extends Bloc<P58OCABODYSTDGETSET_Event, P58OCABODYSTDGETSETCLASS> {
  P58OCABODYSTDGETSET_Bloc() : super(P58OCABODYSTDGETSETCLASS()) {
    on<P58OCABODYSTDGETSET_GET>((event, emit) {
      return _P58OCABODYSTDGETSET_GET(P58OCABODYSTDGETSETCLASS(), emit);
    });
    on<P58OCABODYSTDGETSET_SET>((event, emit) {
      return _P58OCABODYSTDGETSET_SET(P58OCABODYSTDGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P58OCABODYSTDGETSETCLASS(), emit);
    });
  }
  Future<void> _P58OCABODYSTDGETSET_GET(P58OCABODYSTDGETSETCLASS toAdd,
      Emitter<P58OCABODYSTDGETSETCLASS> emit) async {
    P58OCABODYSTDGETSETCLASS output = P58OCABODYSTDGETSETCLASS();

    FreeLoading(P58OCABODYSTDcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTERSET_${USERDATA.INSMASTER}',
      data: {
        "collection": "OCAdataSTD",
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

    Navigator.pop(P58OCABODYSTDcontext);
    emit(output);
  }

//34
//19
  Future<void> _P58OCABODYSTDGETSET_SET(P58OCABODYSTDGETSETCLASS toAdd,
      Emitter<P58OCABODYSTDGETSETCLASS> emit) async {
    P58OCABODYSTDGETSETCLASS output = P58OCABODYSTDGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P58OCABODYSTDGETSETCLASS toAdd,
      Emitter<P58OCABODYSTDGETSETCLASS> emit) async {
    P58OCABODYSTDGETSETCLASS output = P58OCABODYSTDGETSETCLASS();
    emit(output);
  }
}

class P58OCABODYSTDGETSETCLASS {
  P58OCABODYSTDGETSETCLASS({
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
