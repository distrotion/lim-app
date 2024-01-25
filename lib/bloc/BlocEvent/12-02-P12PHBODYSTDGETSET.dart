import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P12PHBODYSTD/P12PHBODYSTD.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P12PHBODYSTDGETSET_Event {}

class P12PHBODYSTDGETSET_GET extends P12PHBODYSTDGETSET_Event {}

class P12PHBODYSTDGETSET_SET extends P12PHBODYSTDGETSET_Event {}

class flush extends P12PHBODYSTDGETSET_Event {}

class P12PHBODYSTDGETSET_Bloc
    extends Bloc<P12PHBODYSTDGETSET_Event, P12PHBODYSTDGETSETCLASS> {
  P12PHBODYSTDGETSET_Bloc() : super(P12PHBODYSTDGETSETCLASS()) {
    on<P12PHBODYSTDGETSET_GET>((event, emit) {
      return _P12PHBODYSTDGETSET_GET(P12PHBODYSTDGETSETCLASS(), emit);
    });
    on<P12PHBODYSTDGETSET_SET>((event, emit) {
      return _P12PHBODYSTDGETSET_SET(P12PHBODYSTDGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P12PHBODYSTDGETSETCLASS(), emit);
    });
  }
  Future<void> _P12PHBODYSTDGETSET_GET(P12PHBODYSTDGETSETCLASS toAdd,
      Emitter<P12PHBODYSTDGETSETCLASS> emit) async {
    P12PHBODYSTDGETSETCLASS output = P12PHBODYSTDGETSETCLASS();

    FreeLoading(P12PHBODYSTDcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTERSET_${USERDATA.INSMASTER}',
      data: {
        "collection": "PHdataSTD",
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
      }
    }

    Navigator.pop(P12PHBODYSTDcontext);
    emit(output);
  }

//34
//19
  Future<void> _P12PHBODYSTDGETSET_SET(P12PHBODYSTDGETSETCLASS toAdd,
      Emitter<P12PHBODYSTDGETSETCLASS> emit) async {
    P12PHBODYSTDGETSETCLASS output = P12PHBODYSTDGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P12PHBODYSTDGETSETCLASS toAdd,
      Emitter<P12PHBODYSTDGETSETCLASS> emit) async {
    P12PHBODYSTDGETSETCLASS output = P12PHBODYSTDGETSETCLASS();
    emit(output);
  }
}

class P12PHBODYSTDGETSETCLASS {
  P12PHBODYSTDGETSETCLASS({
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
}
