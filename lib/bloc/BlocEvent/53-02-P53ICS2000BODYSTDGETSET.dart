import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P53ICS2000BODYSTD/P53ICS2000BODYSTD.dart';
import '../../widget/common/Loading.dart';

//-------------------------------------------------

abstract class P53ICS2000BODYSTDGETSET_Event {}

class P53ICS2000BODYSTDGETSET_GET extends P53ICS2000BODYSTDGETSET_Event {}

class P53ICS2000BODYSTDGETSET_SET extends P53ICS2000BODYSTDGETSET_Event {}

class flush extends P53ICS2000BODYSTDGETSET_Event {}

class P53ICS2000BODYSTDGETSET_Bloc extends Bloc<P53ICS2000BODYSTDGETSET_Event, P53ICS2000BODYSTDGETSETCLASS> {
  P53ICS2000BODYSTDGETSET_Bloc() : super(P53ICS2000BODYSTDGETSETCLASS()) {
    on<P53ICS2000BODYSTDGETSET_GET>((event, emit) {
      return _P53ICS2000BODYSTDGETSET_GET(P53ICS2000BODYSTDGETSETCLASS(), emit);
    });
    on<P53ICS2000BODYSTDGETSET_SET>((event, emit) {
      return _P53ICS2000BODYSTDGETSET_SET(P53ICS2000BODYSTDGETSETCLASS(), emit);
    });
    on<flush>((event, emit) {
      return _flush(P53ICS2000BODYSTDGETSETCLASS(), emit);
    });
  }
  Future<void> _P53ICS2000BODYSTDGETSET_GET(
      P53ICS2000BODYSTDGETSETCLASS toAdd, Emitter<P53ICS2000BODYSTDGETSETCLASS> emit) async {
    P53ICS2000BODYSTDGETSETCLASS output = P53ICS2000BODYSTDGETSETCLASS();

    FreeLoading(P53ICS2000BODYSTDcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTERSET_${USERDATA.INSMASTER}',
      data: {
        "collection": "ICS2000dataSTD",
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print(databuff);
      if (databuff.length > 0) {
        output.ReqNo = databuff[0]['ReqNo'] != null ? databuff[0]['ReqNo'].toString() : '';

        output.InstrumentName =
            databuff[0]['InstrumentName'] != null ? databuff[0]['InstrumentName'].toString() : '';

        output.CustShort = databuff[0]['CustShort'] != null ? databuff[0]['CustShort'].toString() : '';
        output.UID = databuff[0]['UID'] != null ? databuff[0]['UID'].toString() : '';

        output.ItemName = databuff[0]['ItemName'] != null ? databuff[0]['ItemName'].toString() : '';

        if (databuff[0]['data01'] != null) {
          var data01W11 = databuff[0]['data01']['W11'];

          if (data01W11 != null && data01W11 is Map) {
            if (output.ItemName.contains("T-F")) {
              output.D01W11 = data01W11['FluorideR1']?.toString() ?? '';
            } else if (output.ItemName.contains("Cl")) {
              output.D01W11 = data01W11['ChlorideR1']?.toString() ?? '';
            } else if (output.ItemName.contains("NO3")) {
              output.D01W11 = data01W11['NitrateR1']?.toString() ?? '';
            } else if (output.ItemName.contains("SO4")) {
              output.D01W11 = data01W11['SulphateR1']?.toString() ?? '';
            } else if (output.ItemName.contains("PO4")) {
              output.D01W11 = data01W11['PhosphateR1']?.toString() ?? '';
            } else if (output.ItemName.contains("P2O7")) {
              output.D01W11 = data01W11['P2O7R1']?.toString() ?? '';
            }
          } else {
            output.D01W11 = '';
          }
        }

        if (databuff[0]['data02'] != null) {
          var data02W11 = databuff[0]['data02']['W11'];

          if (data02W11 != null && data02W11 is Map) {
            if (output.ItemName.contains("T-F")) {
              output.D02W11 = data02W11['FluorideR2']?.toString() ?? '';
            } else if (output.ItemName.contains("Cl")) {
              output.D02W11 = data02W11['ChlorideR2']?.toString() ?? '';
            } else if (output.ItemName.contains("NO3")) {
              output.D02W11 = data02W11['NitrateR2']?.toString() ?? '';
            } else if (output.ItemName.contains("SO4")) {
              output.D02W11 = data02W11['SulphateR2']?.toString() ?? '';
            } else if (output.ItemName.contains("PO4")) {
              output.D02W11 = data02W11['PhosphateR2']?.toString() ?? '';
            } else if (output.ItemName.contains("P2O7")) {
              output.D02W11 = data02W11['P2O7R2']?.toString() ?? '';
            }
          } else {
            output.D02W11 = '';
          }
        }

        // if (databuff[0]['data01'] != null) {
        //   output.D01W11 = databuff[0]['data01']['W11'] != null
        //       ? databuff[0]['data01']['W11'].toString()
        //       : '';
        // }
        // if (databuff[0]['data01'] != null) {
        //   output.D01W21 = databuff[0]['data01']['W21'] != null
        //       ? databuff[0]['data01']['W21'].toString()
        //       : '';
        // }
        // if (databuff[0]['data01_volum'] != null) {
        //   output.D01VOLUME = databuff[0]['data01_volum']['volum'] != null
        //       ? databuff[0]['data01_volum']['volum'].toString()
        //       : '';
        // }
        // output.D01NOitem = databuff[0]['D01NOitem'] != null
        //     ? databuff[0]['D01NOitem'].toString()
        //     : '';

        // if (databuff[0]['data02'] != null) {
        //   output.D02W11 = databuff[0]['data02']['W11'] != null
        //       ? databuff[0]['data02']['W11'].toString()
        //       : '';
        // }
        // if (databuff[0]['data02'] != null) {
        //   output.D02W21 = databuff[0]['data02']['W21'] != null
        //       ? databuff[0]['data02']['W21'].toString()
        //       : '';
        // }
        // if (databuff[0]['data02_volum'] != null) {
        //   output.D02VOLUME = databuff[0]['data02_volum']['volum'] != null
        //       ? databuff[0]['data02_volum']['volum'].toString()
        //       : '';
        // }

        // output.D02NOitem = databuff[0]['D02NOitem'] != null
        //     ? databuff[0]['D02NOitem'].toString()
        //     : '';

        output.SamplingDate =
            databuff[0]['SamplingDate'] != null ? databuff[0]['SamplingDate'].toString() : '';

        output.DueDate1 = databuff[0]['DueDate1'] != null ? databuff[0]['DueDate1'].toString() : '';

        output.SampleName = databuff[0]['SampleName'] != null ? databuff[0]['SampleName'].toString() : '';

        output.Mag = databuff[0]['Mag'] != null ? databuff[0]['Mag'].toString() : '';
        output.RemarkNo = databuff[0]['RemarkNo'] != null ? databuff[0]['RemarkNo'].toString() : '';
        output.SampleCode = databuff[0]['SampleCode'] != null ? databuff[0]['SampleCode'].toString() : '';
        if (databuff[0]['SARDATA'] != null) {
          if (databuff[0]['SARDATA'].length > 0) {
            output.D01NOitem = databuff[0]['SARDATA'][0]['DilutionTime_1'] != null
                ? databuff[0]['SARDATA'][0]['DilutionTime_1'].toString()
                : '';
            output.D02NOitem = databuff[0]['SARDATA'][0]['DilutionTime_2'] != null
                ? databuff[0]['SARDATA'][0]['DilutionTime_2'].toString()
                : '';
          }
        }
      }
    }

    Navigator.pop(P53ICS2000BODYSTDcontext);
    emit(output);
  }

//34
//19
  Future<void> _P53ICS2000BODYSTDGETSET_SET(
      P53ICS2000BODYSTDGETSETCLASS toAdd, Emitter<P53ICS2000BODYSTDGETSETCLASS> emit) async {
    P53ICS2000BODYSTDGETSETCLASS output = P53ICS2000BODYSTDGETSETCLASS();

    emit(output);
  }

  Future<void> _flush(P53ICS2000BODYSTDGETSETCLASS toAdd, Emitter<P53ICS2000BODYSTDGETSETCLASS> emit) async {
    P53ICS2000BODYSTDGETSETCLASS output = P53ICS2000BODYSTDGETSETCLASS();
    emit(output);
  }
}

class P53ICS2000BODYSTDGETSETCLASS {
  P53ICS2000BODYSTDGETSETCLASS({
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
