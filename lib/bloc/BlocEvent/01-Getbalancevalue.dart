import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class Getbalancevalue_Event {}

class Getbalancevalue_Get extends Getbalancevalue_Event {}

class flush extends Getbalancevalue_Event {}

class Getbalancevalue_Bloc extends Bloc<Getbalancevalue_Event, String> {
  Getbalancevalue_Bloc() : super('') {
    on<Getbalancevalue_Get>((event, emit) {
      return _Getbalancevalue_Get('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _Getbalancevalue_Get(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${serverN}/getvalue_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);
      output = databuff['value'];
    }
    emit(output);
  }

  Future<void> _flush(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
