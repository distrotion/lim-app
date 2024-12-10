import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P53ICS2000BODYSTD/P53ICS2000BODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetICS2000value_Event {}

class GetICS2000value_Get extends GetICS2000value_Event {}

class flush extends GetICS2000value_Event {}

class GetICS2000value_Bloc
    extends Bloc<GetICS2000value_Event, ICS2000DATAclass> {
  GetICS2000value_Bloc() : super(ICS2000DATAclass()) {
    on<GetICS2000value_Get>((event, emit) {
      return _GetICS2000value_Get(ICS2000DATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(ICS2000DATAclass(), emit);
    });
  }
  Future<void> _GetICS2000value_Get(
      ICS2000DATAclass toAdd, Emitter<ICS2000DATAclass> emit) async {
    ICS2000DATAclass output = ICS2000DATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        // "barcode": P53ICS2000BODYSTDVAR.ReqNo,
        "NO": P53ICS2000BODYSTDVAR.RemarkNo,
        "barcode": P53ICS2000BODYSTDVAR.SampleCode,
      },
    );

    if (response01.statusCode == 200) {
      var databuICS2000 = response01.data;
      print(databuICS2000);
      // output = databuICS2000;
      // if (databuICS2000['TiICS2000R1'] != null) {
      output.FluorideR1 = databuICS2000['FluorideR1'] != null
          ? databuICS2000['FluorideR1'].toString()
          : '';
      output.FluorideR2 = databuICS2000['FluorideR2'] != null
          ? databuICS2000['FluorideR2'].toString()
          : '';

      output.ChlorideR1 = databuICS2000['ChlorideR1'] != null
          ? databuICS2000['ChlorideR1'].toString()
          : '';

      output.ChlorideR2 = databuICS2000['ChlorideR2'] != null
          ? databuICS2000['ChlorideR2'].toString()
          : '';

      output.NitrateR1 = databuICS2000['NitrateR1'] != null
          ? databuICS2000['NitrateR1'].toString()
          : '';
      output.NitrateR2 = databuICS2000['NitrateR2'] != null
          ? databuICS2000['NitrateR2'].toString()
          : '';

      output.SulphateR1 = databuICS2000['SulphateR1'] != null
          ? databuICS2000['SulphateR1'].toString()
          : '';
      output.SulphateR2 = databuICS2000['SulphateR2'] != null
          ? databuICS2000['SulphateR2'].toString()
          : '';

      output.PhosphateR1 = databuICS2000['PhosphateR1'] != null
          ? databuICS2000['PhosphateR1'].toString()
          : '';
      output.PhosphateR2 = databuICS2000['PhosphateR2'] != null
          ? databuICS2000['PhosphateR2'].toString()
          : '';

      output.P2O7R1 = databuICS2000['P2O7R1'] != null
          ? databuICS2000['P2O7R1'].toString()
          : '';
      output.P2O7R2 = databuICS2000['P2O7R2'] != null
          ? databuICS2000['P2O7R2'].toString()
          : '';
      // }
    }

    // final response02 = await Dio().post(
    //   '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
    //   data: {
    //     "barcode": P53ICS2000BODYSTDVAR.ReqNo,
    //     "NO": "2",
    //   },
    // );

    // if (response02.statusCode == 200) {
    //   var databuICS2000 = response02.data;
    //   // print(databuICS2000);
    //   // output = databuICS2000;
    //   if (databuICS2000['ppm'] != null) {
    //     output.value02 =
    //         databuICS2000['ppm'] != null ? databuICS2000['ppm'].toString() : '';
    //   }
    // }
    // print(output);
    emit(output);
  }

  Future<void> _flush(
      ICS2000DATAclass toAdd, Emitter<ICS2000DATAclass> emit) async {
    ICS2000DATAclass output = ICS2000DATAclass();
    emit(output);
  }
}

class ICS2000DATAclass {
  ICS2000DATAclass({
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
