import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P54ICS8100BODYSTD/P54ICS8100BODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetICS8100value_Event {}

class GetICS8100value_Get extends GetICS8100value_Event {}

class flush extends GetICS8100value_Event {}

class GetICS8100value_Bloc
    extends Bloc<GetICS8100value_Event, ICS8100DATAclass> {
  GetICS8100value_Bloc() : super(ICS8100DATAclass()) {
    on<GetICS8100value_Get>((event, emit) {
      return _GetICS8100value_Get(ICS8100DATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(ICS8100DATAclass(), emit);
    });
  }
  Future<void> _GetICS8100value_Get(
      ICS8100DATAclass toAdd, Emitter<ICS8100DATAclass> emit) async {
    ICS8100DATAclass output = ICS8100DATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        // "barcode": P54ICS8100BODYSTDVAR.ReqNo,
        "NO": P54ICS8100BODYSTDVAR.RemarkNo,
        "barcode": P54ICS8100BODYSTDVAR.SampleCode,
        // "D01W11_21": P54ICS8100BODYSTDVAR.D01VOLUME,
        // "D02W11_21": P54ICS8100BODYSTDVAR.D02VOLUME,
        "D01W11_21": P54ICS8100BODYSTDVAR.D01NOitem,
        "D02W11_21": P54ICS8100BODYSTDVAR.D02NOitem,
      },
    );

    if (response01.statusCode == 200) {
      var databuICS8100 = response01.data;
      print(databuICS8100);
      // output = databuICS8100;
      // if (databuICS8100['TiICS8100R1'] != null) {
      output.FluorideR1 = databuICS8100['FluorideR1'] != null
          ? databuICS8100['FluorideR1'].toString()
          : '';
      output.FluorideR2 = databuICS8100['FluorideR2'] != null
          ? databuICS8100['FluorideR2'].toString()
          : '';

      output.ChlorideR1 = databuICS8100['ChlorideR1'] != null
          ? databuICS8100['ChlorideR1'].toString()
          : '';

      output.ChlorideR2 = databuICS8100['ChlorideR2'] != null
          ? databuICS8100['ChlorideR2'].toString()
          : '';

      output.NitrateR1 = databuICS8100['NitrateR1'] != null
          ? databuICS8100['NitrateR1'].toString()
          : '';
      output.NitrateR2 = databuICS8100['NitrateR2'] != null
          ? databuICS8100['NitrateR2'].toString()
          : '';

      output.SulphateR1 = databuICS8100['SulphateR1'] != null
          ? databuICS8100['SulphateR1'].toString()
          : '';
      output.SulphateR2 = databuICS8100['SulphateR2'] != null
          ? databuICS8100['SulphateR2'].toString()
          : '';

      output.PhosphateR1 = databuICS8100['PhosphateR1'] != null
          ? databuICS8100['PhosphateR1'].toString()
          : '';
      output.PhosphateR2 = databuICS8100['PhosphateR2'] != null
          ? databuICS8100['PhosphateR2'].toString()
          : '';

      output.P2O7R1 = databuICS8100['P2O7R1'] != null
          ? databuICS8100['P2O7R1'].toString()
          : '';
      output.P2O7R2 = databuICS8100['P2O7R2'] != null
          ? databuICS8100['P2O7R2'].toString()
          : '';
      // }
    }

    // final response02 = await Dio().post(
    //   '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
    //   data: {
    //     "barcode": P54ICS8100BODYSTDVAR.ReqNo,
    //     "NO": "2",
    //   },
    // );

    // if (response02.statusCode == 200) {
    //   var databuICS8100 = response02.data;
    //   // print(databuICS8100);
    //   // output = databuICS8100;
    //   if (databuICS8100['ppm'] != null) {
    //     output.value02 =
    //         databuICS8100['ppm'] != null ? databuICS8100['ppm'].toString() : '';
    //   }
    // }
    // print(output);
    emit(output);
  }

  Future<void> _flush(
      ICS8100DATAclass toAdd, Emitter<ICS8100DATAclass> emit) async {
    ICS8100DATAclass output = ICS8100DATAclass();
    emit(output);
  }
}

class ICS8100DATAclass {
  ICS8100DATAclass({
    this.FluorideR1 = '',
    this.ChlorideR1 = '',
    this.NitrateR1 = '',
    this.SulphateR1 = '',
    this.PhosphateR1 = '',
    this.P2O7R1 = '',
    this.FluorideR2 = '',
    this.ChlorideR2 = '',
    this.NitrateR2 = '',
    this.SulphateR2 = '',
    this.PhosphateR2 = '',
    this.P2O7R2 = '',
  });
  String FluorideR1;
  String ChlorideR1;
  String NitrateR1;
  String SulphateR1;
  String PhosphateR1;
  String P2O7R1;

  String FluorideR2;
  String ChlorideR2;
  String NitrateR2;
  String SulphateR2;
  String PhosphateR2;

  String P2O7R2;
}
