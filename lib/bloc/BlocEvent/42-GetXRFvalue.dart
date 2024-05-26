import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P42XRFBODYSTD/P42XRFBODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetXRFvalue_Event {}

class GetXRFvalue_Get extends GetXRFvalue_Event {}

class flush extends GetXRFvalue_Event {}

class GetXRFvalue_Bloc extends Bloc<GetXRFvalue_Event, XRFDATAclass> {
  GetXRFvalue_Bloc() : super(XRFDATAclass()) {
    on<GetXRFvalue_Get>((event, emit) {
      return _GetXRFvalue_Get(XRFDATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(XRFDATAclass(), emit);
    });
  }
  Future<void> _GetXRFvalue_Get(
      XRFDATAclass toAdd, Emitter<XRFDATAclass> emit) async {
    XRFDATAclass output = XRFDATAclass();

    final response01 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P42XRFBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "NO": "1",
      },
    );

    if (response01.statusCode == 200) {
      var databuXRF = response01.data;
      // print(databuXRF);
      // output = databuXRF;
      if (databuXRF['ppm'] != null) {
        output.value01 =
            databuXRF['ppm'] != null ? databuXRF['ppm'].toString() : '';
      }
    }

    final response02 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P42XRFBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "NO": "2",
      },
    );

    if (response02.statusCode == 200) {
      var databuXRF = response02.data;
      // print(databuXRF);
      // output = databuXRF;
      if (databuXRF['ppm'] != null) {
        output.value02 =
            databuXRF['ppm'] != null ? databuXRF['ppm'].toString() : '';
      }
    }
    // print(output);
    emit(output);
  }

  Future<void> _flush(XRFDATAclass toAdd, Emitter<XRFDATAclass> emit) async {
    XRFDATAclass output = XRFDATAclass();
    emit(output);
  }
}

class XRFDATAclass {
  XRFDATAclass({
    this.value01 = '',
    this.value02 = '',
  });
  String value01;
  String value02;
}
