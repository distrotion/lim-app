import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P41XRFREQGETSTR_Event {}

class P41XRFREQGETSTR_ROOM extends P41XRFREQGETSTR_Event {}

class P41XRFREQGETSTR_CLEARROOM extends P41XRFREQGETSTR_Event {}

class flush extends P41XRFREQGETSTR_Event {}

class P41XRFREQGETSTR_Bloc extends Bloc<P41XRFREQGETSTR_Event, String> {
  P41XRFREQGETSTR_Bloc() : super('') {
    on<P41XRFREQGETSTR_ROOM>((event, emit) {
      return _P41XRFREQGETSTR_ROOM('', emit);
    });
    on<P41XRFREQGETSTR_CLEARROOM>((event, emit) {
      return _P41XRFREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P41XRFREQGETSTR_ROOM(String toAdd, Emitter<String> emit) async {
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

  Future<void> _P41XRFREQGETSTR_CLEARROOM(
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
