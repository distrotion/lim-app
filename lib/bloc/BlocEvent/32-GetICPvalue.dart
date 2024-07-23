import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P32ICPBODYSTD/P32ICPBODYSTDVAR.dart';

//-------------------------------------------------

abstract class GetICPvalue_Event {}

class GetICPvalue_Get extends GetICPvalue_Event {}

class flush extends GetICPvalue_Event {}

class GetICPvalue_Bloc extends Bloc<GetICPvalue_Event, ICPDATAclass> {
  GetICPvalue_Bloc() : super(ICPDATAclass()) {
    on<GetICPvalue_Get>((event, emit) {
      return _GetICPvalue_Get(ICPDATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(ICPDATAclass(), emit);
    });
  }
  Future<void> _GetICPvalue_Get(
      ICPDATAclass toAdd, Emitter<ICPDATAclass> emit) async {
    ICPDATAclass output = ICPDATAclass();

    final response02 = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": P32ICPBODYSTDVAR.ReqNo,
        "ItemName": P32ICPBODYSTDVAR.ItemName,
        "SampleCode": P32ICPBODYSTDVAR.SampleCode, //.replaceAll("-", "/")
        "DILUTE": P32ICPBODYSTDVAR.D01DIL,
      },
    );
//.replaceAll("-", "/")
    if (response02.statusCode == 200) {
      var databuICP = response02.data;
      // print(databuICP);
      // output = databuICP;
      if (databuICP['ICPR1'] != null) {
        output.value01 =
            databuICP['ICPR1'] != null ? databuICP['ICPR1'].toString() : '';
        output.value02 =
            databuICP['ICPR2'] != null ? databuICP['ICPR2'].toString() : '';
      }
    }
    // print(output);
    emit(output);
  }

  Future<void> _flush(ICPDATAclass toAdd, Emitter<ICPDATAclass> emit) async {
    ICPDATAclass output = ICPDATAclass();
    emit(output);
  }
}

class ICPDATAclass {
  ICPDATAclass({
    this.value01 = '',
    this.value02 = '',
  });
  String value01;
  String value02;
}
