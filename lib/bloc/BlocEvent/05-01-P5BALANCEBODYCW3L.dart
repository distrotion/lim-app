import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P5BALANCEBODYCW3L/P5BALANCEBODYCW3L.dart';
import '../../page/P5BALANCEBODYCW3L/P5BALANCEBODYCW3LVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_GET extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_SETDATA extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_CLEARW11 extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_CAL extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_TEMP_SAVE extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_SEND_TO_SAR extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_CLEARROOM extends P5BALANCEBODYCW3L_Event {}

// class P5BALANCEBODYCW3L_CLEARW11_ADJ extends P5BALANCEBODYCW3L_Event {}

class flush extends P5BALANCEBODYCW3L_Event {}

class P5BALANCEBODYCW3L_Bloc extends Bloc<P5BALANCEBODYCW3L_Event, String> {
  P5BALANCEBODYCW3L_Bloc() : super('') {
    on<P5BALANCEBODYCW3L_GET>((event, emit) {
      return _P5BALANCEBODYCW3L_GET('', emit);
    });
    on<P5BALANCEBODYCW3L_SETDATA>((event, emit) {
      return _P5BALANCEBODYCW3L_SETDATA('', emit);
    });

    on<P5BALANCEBODYCW3L_CLEARW11>((event, emit) {
      return _P5BALANCEBODYCW3L_CLEARW11('', emit);
    });

    on<P5BALANCEBODYCW3L_CAL>((event, emit) {
      return _P5BALANCEBODYCW3L_CAL('', emit);
    });

    on<P5BALANCEBODYCW3L_TEMP_SAVE>((event, emit) {
      return _P5BALANCEBODYCW3L_TEMP_SAVE('', emit);
    });

    on<P5BALANCEBODYCW3L_SEND_TO_SAR>((event, emit) {
      return _P5BALANCEBODYCW3L_SEND_TO_SAR('', emit);
    });

    on<P5BALANCEBODYCW3L_CLEARROOM>((event, emit) {
      return _P5BALANCEBODYCW3L_CLEARROOM('', emit);
    });

//_P5BALANCEBODYCW3L_SEND_TO_SAR
//_P5BALANCEBODYCW3L_CAL
    // on<P5BALANCEBODYCW3L_CLEARW11_ADJ>((event, emit) {
    //   return _P5BALANCEBODYCW3L_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P5BALANCEBODYCW3L_GET(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P5BALANCEBODYCW3L_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "05SARBALANCECW3L",
        "FUNCTION": "UPDATEDATAWEIGHT",
        "WX": P5BALANCEBODYCW3LVAR.WX
      },
    );

    emit(output);
  }

  Future<void> _P5BALANCEBODYCW3L_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "05SARBALANCECW3L",
        "FUNCTION": "DELETEDATAW11",
        "DX": P5BALANCEBODYCW3LVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P5BALANCEBODYCW3L_CAL(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>xxxxxx");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "05SARBALANCECW3L",
        "FUNCTION": "UPDATEDATAAREA",
        "D01NOitem": P5BALANCEBODYCW3LVAR.D01NOitem,
        "areaE01": P5BALANCEBODYCW3LVAR.D01area,
        "Result01": P5BALANCEBODYCW3LVAR.Result01,
        "Result02": P5BALANCEBODYCW3LVAR.Result02,
        "Result03": P5BALANCEBODYCW3LVAR.Result03,
        "D01W11_21": P5BALANCEBODYCW3LVAR.D01W11_21,
        "D01W21_31": P5BALANCEBODYCW3LVAR.D01W21_31,
        "D01W31_41": P5BALANCEBODYCW3LVAR.D01W31_41,
      },
    );

    emit(output);
  }

  Future<void> _P5BALANCEBODYCW3L_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "05SARBALANCECW3L",
        "FUNCTION": "UPDATEDATAAREA",
        "D01NOitem": P5BALANCEBODYCW3LVAR.D01NOitem,
        "areaE01": P5BALANCEBODYCW3LVAR.D01area,
        "Result01": P5BALANCEBODYCW3LVAR.Result01,
        "Result02": P5BALANCEBODYCW3LVAR.Result02,
        "Result03": P5BALANCEBODYCW3LVAR.Result03,
        "D01W11_21": P5BALANCEBODYCW3LVAR.D01W11_21,
        "D01W21_31": P5BALANCEBODYCW3LVAR.D01W21_31,
        "D01W31_41": P5BALANCEBODYCW3LVAR.D01W31_41,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_CW3L',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P5BALANCEBODYCW3LVAR.ReqNo,
          "UID": P5BALANCEBODYCW3LVAR.UID,
          "D01NOitem": P5BALANCEBODYCW3LVAR.D01NOitem,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P5BALANCEBODYCW3Lcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P5BALANCEBODYCW3Lcontext,
          [
            "Temp Save",
            "ERROR",
          ],
          100,
          100,
        );
      }
    });

    emit(output);
  }

  Future<void> _P5BALANCEBODYCW3L_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_SLUDGE',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P5BALANCEBODYCW3LVAR.ReqNo,
        "UID": P5BALANCEBODYCW3LVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P5BALANCEBODYCW3L_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P5BALANCEBODYCW3L_CLEARROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/CLEARREGISTER_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuff = response.data;

      output = "";
    }

    emit(output);
  }

  Future<void> _flush(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }
}
