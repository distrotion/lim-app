import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P31ICPREQGETSTR_Event {}

class P31ICPREQGETSTR_ROOM extends P31ICPREQGETSTR_Event {}

class P31ICPREQGETSTR_CLEARROOM extends P31ICPREQGETSTR_Event {}

class flush extends P31ICPREQGETSTR_Event {}

class P31ICPREQGETSTR_Bloc extends Bloc<P31ICPREQGETSTR_Event, String> {
  P31ICPREQGETSTR_Bloc() : super('') {
    on<P31ICPREQGETSTR_ROOM>((event, emit) {
      return _P31ICPREQGETSTR_ROOM('', emit);
    });
    on<P31ICPREQGETSTR_CLEARROOM>((event, emit) {
      return _P31ICPREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P31ICPREQGETSTR_ROOM(String toAdd, Emitter<String> emit) async {
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

  Future<void> _P31ICPREQGETSTR_CLEARROOM(
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
