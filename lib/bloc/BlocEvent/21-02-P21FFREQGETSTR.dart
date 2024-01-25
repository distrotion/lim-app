import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P21FFREQGETSTR_Event {}

class P21FFREQGETSTR_ROOM extends P21FFREQGETSTR_Event {}

class P21FFREQGETSTR_CLEARROOM extends P21FFREQGETSTR_Event {}

class flush extends P21FFREQGETSTR_Event {}

class P21FFREQGETSTR_Bloc extends Bloc<P21FFREQGETSTR_Event, String> {
  P21FFREQGETSTR_Bloc() : super('') {
    on<P21FFREQGETSTR_ROOM>((event, emit) {
      return _P21FFREQGETSTR_ROOM('', emit);
    });
    on<P21FFREQGETSTR_CLEARROOM>((event, emit) {
      return _P21FFREQGETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P21FFREQGETSTR_ROOM(String toAdd, Emitter<String> emit) async {
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

  Future<void> _P21FFREQGETSTR_CLEARROOM(
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
