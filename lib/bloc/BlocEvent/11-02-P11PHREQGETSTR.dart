import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P11PHREQGETSTR_Event {}

class P11PHREQGETSTR_ROOM extends P11PHREQGETSTR_Event {}

class P11PHREQGETSTR_CLEARROOM extends P11PHREQGETSTR_Event {}

class flush extends P11PHREQGETSTR_Event {}

class P11PHREQGETSTR_Bloc extends Bloc<P11PHREQGETSTR_Event, String> {
  P11PHREQGETSTR_Bloc() : super('') {
    on<P11PHREQGETSTR_ROOM>((event, emit) {
      return _P11PHREQGETSTR_ROOM('', emit);
    });
    on<P11PHREQGETSTR_CLEARROOM>((event, emit) {
      return _P11PHREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P11PHREQGETSTR_ROOM(String toAdd, Emitter<String> emit) async {
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

  Future<void> _P11PHREQGETSTR_CLEARROOM(
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
