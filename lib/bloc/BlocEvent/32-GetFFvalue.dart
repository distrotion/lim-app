import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P32ICPBODYSTD/P32ICPBODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetFFvalue_Event {}

class GetFFvalue_Get extends GetFFvalue_Event {}

class flush extends GetFFvalue_Event {}

class GetFFvalue_Bloc extends Bloc<GetFFvalue_Event, FFDATAclass> {
  GetFFvalue_Bloc() : super(FFDATAclass()) {
    on<GetFFvalue_Get>((event, emit) {
      return _GetFFvalue_Get(FFDATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(FFDATAclass(), emit);
    });
  }
  Future<void> _GetFFvalue_Get(
      FFDATAclass toAdd, Emitter<FFDATAclass> emit) async {
    FFDATAclass output = FFDATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P32ICPBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "NO": "1",
      },
    );

    if (response01.statusCode == 200) {
      var databuff = response01.data;
      // print(databuff);
      // output = databuff;
      if (databuff['ppm'] != null) {
        output.value01 =
            databuff['ppm'] != null ? databuff['ppm'].toString() : '';
      }
    }

    final response02 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P32ICPBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "NO": "2",
      },
    );

    if (response02.statusCode == 200) {
      var databuff = response02.data;
      // print(databuff);
      // output = databuff;
      if (databuff['ppm'] != null) {
        output.value02 =
            databuff['ppm'] != null ? databuff['ppm'].toString() : '';
      }
    }
    // print(output);
    emit(output);
  }

  Future<void> _flush(FFDATAclass toAdd, Emitter<FFDATAclass> emit) async {
    FFDATAclass output = FFDATAclass();
    emit(output);
  }
}

class FFDATAclass {
  FFDATAclass({
    this.value01 = '',
    this.value02 = '',
  });
  String value01;
  String value02;
}
