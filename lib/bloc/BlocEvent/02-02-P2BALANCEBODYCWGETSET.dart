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

    FreeLoading(P2BALANCEBODYCWcontext);

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTERSET_${USERDATA.INSMASTER}',
      data: {
        "collection": "BALANCEdataCoatingweight",
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
        if (databuff[0]['data01_area'] != null) {
          output.D01area = databuff[0]['data01_area']['area'] != null
              ? databuff[0]['data01_area']['area'].toString()
              : '';
        }
        output.D01NOitem = databuff[0]['D01NOitem'] != null
            ? databuff[0]['D01NOitem'].toString()
            : '';

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
        // if (databuff[0]['data02_area'] != null) {
        //   output.D02area = databuff[0]['data02_area']['area'] != null
        //       ? databuff[0]['data02_area']['area'].toString()
        //       : '';
        // }

        // output.D02NOitem = databuff[0]['D02NOitem'] != null
        //     ? databuff[0]['D02NOitem'].toString()
        //     : '';

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

    Navigator.pop(P2BALANCEBODYCWcontext);
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
    //
    this.D01W11 = '',
    this.D01W21 = '',
    this.D01area = '',
    this.D01ANS = '',
    this.D01NOitem = '',
    // this.D02W11 = '',
    // this.D02W21 = '',
    // this.D02area = '',
    // this.D02ANS = '',
    // this.D02NOitem = '',
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
  String D01area;
  String D01ANS;
  String D01NOitem;
  // String D02W11;
  // String D02W21;
  // String D02area;
  // String D02ANS;
  // String D02NOitem;

  String UID;
  String ItemName;

  String SamplingDate;
  String DueDate1;
  String SampleName;
}
