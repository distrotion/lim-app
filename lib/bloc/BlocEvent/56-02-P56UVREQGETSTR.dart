import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P56UVREQGETSTR_Event {}

class P56UVREQGETSTR_ROOM extends P56UVREQGETSTR_Event {}

class P56UVREQGETSTR_CLEARROOM extends P56UVREQGETSTR_Event {}

class flush extends P56UVREQGETSTR_Event {}

class P56UVREQGETSTR_Bloc extends Bloc<P56UVREQGETSTR_Event, String> {
  P56UVREQGETSTR_Bloc() : super('') {
    on<P56UVREQGETSTR_ROOM>((event, emit) {
      return _P56UVREQGETSTR_ROOM('', emit);
    });
    on<P56UVREQGETSTR_CLEARROOM>((event, emit) {
      return _P56UVREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P56UVREQGETSTR_ROOM(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/GETREGISTER_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
      print("--->${databuff['UID']}");
      output =
          "${databuff['REQNO']}${databuff['UID'] != "" ? '(' : ''}${databuff['UID']}${databuff['UID'] != "" ? ')' : ''}";
    }

    emit(output);
  }

  Future<void> _P56UVREQGETSTR_CLEARROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/CLEARREGISTER_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuff = response.data;

      output = '';
    }

    emit(output);
  }

  Future<void> _flush(String toAdd, Emitter<String> emit) async {
    emit('');
  }
}
