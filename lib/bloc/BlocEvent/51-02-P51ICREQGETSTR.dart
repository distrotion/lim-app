import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P51ICREQGETSTR_Event {}

class P51ICREQGETSTR_ROOM extends P51ICREQGETSTR_Event {}

class P51ICREQGETSTR_CLEARROOM extends P51ICREQGETSTR_Event {}

class flush extends P51ICREQGETSTR_Event {}

class P51ICREQGETSTR_Bloc extends Bloc<P51ICREQGETSTR_Event, String> {
  P51ICREQGETSTR_Bloc() : super('') {
    on<P51ICREQGETSTR_ROOM>((event, emit) {
      return _P51ICREQGETSTR_ROOM('', emit);
    });
    on<P51ICREQGETSTR_CLEARROOM>((event, emit) {
      return _P51ICREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P51ICREQGETSTR_ROOM(String toAdd, Emitter<String> emit) async {
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

  Future<void> _P51ICREQGETSTR_CLEARROOM(
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
