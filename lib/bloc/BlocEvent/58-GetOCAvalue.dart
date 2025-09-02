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
  Future<void> _GetOCAvalue_Get(OCADATAclass toAdd, Emitter<OCADATAclass> emit) async {
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
      if (databuOCA['OCAR11'] != null) {
        output.value01 = databuOCA['OCAR11'] != null ? databuOCA['OCAR11'].toString() : '';
        output.value02 = databuOCA['OCAR12'] != null ? databuOCA['OCAR12'].toString() : '';
        output.value03 = databuOCA['OCAR13'] != null ? databuOCA['OCAR13'].toString() : '';

        output.value04 = databuOCA['OCAR21'] != null ? databuOCA['OCAR21'].toString() : '';
        output.value05 = databuOCA['OCAR22'] != null ? databuOCA['OCAR22'].toString() : '';
        output.value06 = databuOCA['OCAR23'] != null ? databuOCA['OCAR23'].toString() : '';
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
    this.value03 = '',
    this.value04 = '',
    this.value05 = '',
    this.value06 = '',
  });
  String value01;
  String value02;
  String value03;
  String value04;
  String value05;
  String value06;
}
