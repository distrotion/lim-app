import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P58OCABODYSTD/P58OCABODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetOCAvalue_Event {}

class GetOCAvalue_Get extends GetOCAvalue_Event {}

class flush extends GetOCAvalue_Event {}

class GetOCAvalue_Bloc extends Bloc<GetOCAvalue_Event, OCADATAclass> {
  GetOCAvalue_Bloc() : super(OCADATAclass()) {
    on<GetOCAvalue_Get>((event, emit) {
      return _GetOCAvalue_Get(OCADATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(OCADATAclass(), emit);
    });
  }
  Future<void> _GetOCAvalue_Get(
      OCADATAclass toAdd, Emitter<OCADATAclass> emit) async {
    OCADATAclass output = OCADATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        // "barcode": P58OCABODYSTDVAR.ReqNo,
        "NO": P58OCABODYSTDVAR.RemarkNo,
        "barcode": P58OCABODYSTDVAR.SampleCode,
      },
    );

    if (response01.statusCode == 200) {
      var databuOCA = response01.data;
      print(databuOCA);
      // output = databuOCA;
      if (databuOCA['TiOCAR1'] != null) {
        output.value01 =
            databuOCA['TiOCAR1'] != null ? databuOCA['TiOCAR1'].toString() : '';
        output.value02 =
            databuOCA['TiOCAR2'] != null ? databuOCA['TiOCAR2'].toString() : '';
      }
    }

    // final response02 = await Dio().post(
    //   '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
    //   data: {
    //     "barcode": P58OCABODYSTDVAR.ReqNo,
    //     "NO": "2",
    //   },
    // );

    // if (response02.statusCode == 200) {
    //   var databuOCA = response02.data;
    //   // print(databuOCA);
    //   // output = databuOCA;
    //   if (databuOCA['ppm'] != null) {
    //     output.value02 =
    //         databuOCA['ppm'] != null ? databuOCA['ppm'].toString() : '';
    //   }
    // }
    // print(output);
    emit(output);
  }

  Future<void> _flush(OCADATAclass toAdd, Emitter<OCADATAclass> emit) async {
    OCADATAclass output = OCADATAclass();
    emit(output);
  }
}

class OCADATAclass {
  OCADATAclass({
    this.value01 = '',
    this.value02 = '',
  });
  String value01;
  String value02;
}
