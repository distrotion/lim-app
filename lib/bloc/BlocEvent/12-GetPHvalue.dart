import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class GetPHvalue_Event {}

class GetPHvalue_Get extends GetPHvalue_Event {}

class flush extends GetPHvalue_Event {}

class GetPHvalue_Bloc extends Bloc<GetPHvalue_Event, PHDATAclass> {
  GetPHvalue_Bloc() : super(PHDATAclass()) {
    on<GetPHvalue_Get>((event, emit) {
      return _GetPHvalue_Get(PHDATAclass(), emit);
    });
    on<flush>((event, emit) {
      return _flush(PHDATAclass(), emit);
    });
  }
  Future<void> _GetPHvalue_Get(
      PHDATAclass toAdd, Emitter<PHDATAclass> emit) async {
    PHDATAclass output = PHDATAclass();
    print('${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}');
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/getvalue_${USERDATA.INSMASTER}',
      data: {
        "barcode": "",
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);
      // output = databuff;
      if (databuff['ph'] != null) {
        output.value = databuff['ph'] != null ? databuff['ph'].toString() : '';
      }
      if (databuff['temp'] != null) {
        output.temp =
            databuff['temp'] != null ? databuff['temp'].toString() : '';
      }
    }
    print(output);
    emit(output);
  }

  Future<void> _flush(PHDATAclass toAdd, Emitter<PHDATAclass> emit) async {
    PHDATAclass output = PHDATAclass();
    emit(output);
  }
}

class PHDATAclass {
  PHDATAclass({
    this.value = '',
    this.temp = '',
  });
  String value;
  String temp;
}
