import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P1BALANCEREQGETSTR_Event {}

class P1BALANCEREQGETSTR_ROOM extends P1BALANCEREQGETSTR_Event {}

class P1BALANCEREQGETSTR_CLEARROOM extends P1BALANCEREQGETSTR_Event {}

class flush extends P1BALANCEREQGETSTR_Event {}

class P1BALANCEREQGETSTR_Bloc extends Bloc<P1BALANCEREQGETSTR_Event, String> {
  P1BALANCEREQGETSTR_Bloc() : super('') {
    on<P1BALANCEREQGETSTR_ROOM>((event, emit) {
      return _P1BALANCEREQGETSTR_ROOM('', emit);
    });
    on<P1BALANCEREQGETSTR_CLEARROOM>((event, emit) {
      return _P1BALANCEREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P1BALANCEREQGETSTR_ROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${serverN}/GETREGISTER_${USERDATA.INSMASTER}',
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

  Future<void> _P1BALANCEREQGETSTR_CLEARROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${serverN}/CLEARREGISTER_${USERDATA.INSMASTER}',
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
