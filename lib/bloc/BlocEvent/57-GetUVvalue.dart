import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P57UVBODYSTD/P57UVBODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetUVvalue_Event {}

class GetUVvalue_Get extends GetUVvalue_Event {}

class flush extends GetUVvalue_Event {}

class GetUVvalue_Bloc extends Bloc<GetUVvalue_Event, UVDATAclass> {
  GetUVvalue_Bloc() : super(UVDATAclass()) {
    on<GetUVvalue_Get>((event, emit) {
      return _GetUVvalue_Get(UVDATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(UVDATAclass(), emit);
    });
  }
  Future<void> _GetUVvalue_Get(
      UVDATAclass toAdd, Emitter<UVDATAclass> emit) async {
    UVDATAclass output = UVDATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        // "barcode": P57UVBODYSTDVAR.ReqNo,
        "NO": P57UVBODYSTDVAR.RemarkNo,
        "barcode": P57UVBODYSTDVAR.SampleCode,
      },
    );

    if (response01.statusCode == 200) {
      var databuUV = response01.data;
      print(databuUV);
      // output = databuUV;
      if (databuUV['TiUVR1'] != null) {
        output.value01 =
            databuUV['TiUVR1'] != null ? databuUV['TiUVR1'].toString() : '';
        output.value02 =
            databuUV['TiUVR2'] != null ? databuUV['TiUVR2'].toString() : '';
      }
    }

    // final response02 = await Dio().post(
    //   '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
    //   data: {
    //     "barcode": P57UVBODYSTDVAR.ReqNo,
    //     "NO": "2",
    //   },
    // );

    // if (response02.statusCode == 200) {
    //   var databuUV = response02.data;
    //   // print(databuUV);
    //   // output = databuUV;
    //   if (databuUV['ppm'] != null) {
    //     output.value02 =
    //         databuUV['ppm'] != null ? databuUV['ppm'].toString() : '';
    //   }
    // }
    // print(output);
    emit(output);
  }

  Future<void> _flush(UVDATAclass toAdd, Emitter<UVDATAclass> emit) async {
    UVDATAclass output = UVDATAclass();
    emit(output);
  }
}

class UVDATAclass {
  UVDATAclass({
    this.value01 = '',
    this.value02 = '',
  });
  String value01;
  String value02;
}
