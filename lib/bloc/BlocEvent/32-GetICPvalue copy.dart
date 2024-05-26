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
        "barcode": P32ICPBODYSTDVAR.ReqNo.replaceAll("-", "/"),
        "ItemName": P32ICPBODYSTDVAR.ItemName,
      },
    );

    if (response02.statusCode == 200) {
      var databuICP = response02.data;
      // print(databuICP);
      // output = databuICP;
      if (databuICP['ICP1'] != null) {
        output.value01 =
            databuICP['ICP1'] != null ? databuICP['ICP1'].toString() : '';
      }
      if (databuICP['ICP2'] != null) {
        output.value02 =
            databuICP['ICP2'] != null ? databuICP['ICP2'].toString() : '';
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
