import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

//-------------------------------------------------

abstract class P1BALANCEREQ01GETSTR_Event {}

class P1BALANCEREQ01GETSTR_ROOM extends P1BALANCEREQ01GETSTR_Event {}

class P1BALANCEREQ01GETSTR_CLEARROOM extends P1BALANCEREQ01GETSTR_Event {}

class flush extends P1BALANCEREQ01GETSTR_Event {}

class P1BALANCEREQ01GETSTR_Bloc
    extends Bloc<P1BALANCEREQ01GETSTR_Event, String> {
  P1BALANCEREQ01GETSTR_Bloc() : super('') {
    on<P1BALANCEREQ01GETSTR_ROOM>((event, emit) {
      return _P1BALANCEREQ01GETSTR_ROOM('', emit);
    });
    on<P1BALANCEREQ01GETSTR_CLEARROOM>((event, emit) {
      return _P1BALANCEREQ01GETSTR_CLEARROOM('', emit);
    });
    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P1BALANCEREQ01GETSTR_ROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${serverN}/balance01GETREGISTER',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuff = response.data;

      output = databuff['REQNO'];
    }

    emit(output);
  }

  Future<void> _P1BALANCEREQ01GETSTR_CLEARROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${serverN}/balance01CLEARREGISTER',
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
