import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P33TOCBODYSTD/P32TOCBODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetTOCvalue_Event {}

class GetTOCvalue_Get extends GetTOCvalue_Event {}

class flush extends GetTOCvalue_Event {}

class GetTOCvalue_Bloc extends Bloc<GetTOCvalue_Event, TOCDATAclass> {
  GetTOCvalue_Bloc() : super(TOCDATAclass()) {
    on<GetTOCvalue_Get>((event, emit) {
      return _GetTOCvalue_Get(TOCDATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(TOCDATAclass(), emit);
    });
  }
  Future<void> _GetTOCvalue_Get(
      TOCDATAclass toAdd, Emitter<TOCDATAclass> emit) async {
    TOCDATAclass output = TOCDATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P33TOCBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "NO": "1",
      },
    );

    if (response01.statusCode == 200) {
      var databuTOC = response01.data;
      // print(databuTOC);
      // output = databuTOC;
      if (databuTOC['ppm'] != null) {
        output.value01 =
            databuTOC['ppm'] != null ? databuTOC['ppm'].toString() : '';
      }
    }

    final response02 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P33TOCBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "NO": "2",
      },
    );

    if (response02.statusCode == 200) {
      var databuTOC = response02.data;
      // print(databuTOC);
      // output = databuTOC;
      if (databuTOC['ppm'] != null) {
        output.value02 =
            databuTOC['ppm'] != null ? databuTOC['ppm'].toString() : '';
      }
    }
    // print(output);
    emit(output);
  }

  Future<void> _flush(TOCDATAclass toAdd, Emitter<TOCDATAclass> emit) async {
    TOCDATAclass output = TOCDATAclass();
    emit(output);
  }
}

class TOCDATAclass {
  TOCDATAclass({
    this.value01 = '',
    this.value02 = '',
  });
  String value01;
  String value02;
}
