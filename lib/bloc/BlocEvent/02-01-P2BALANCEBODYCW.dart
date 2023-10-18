import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P2BALANCEBODYCW/P2BALANCEBODYCW.dart';
import '../../page/P2BALANCEBODYCW/P2BALANCEBODYCWVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_GET extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_SETDATA extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_CLEARW11 extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_CAL extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_TEMP_SAVE extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_SEND_TO_SAR extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_CLEARROOM extends P2BALANCEBODYCW_Event {}

// class P2BALANCEBODYCW_CLEARW11_ADJ extends P2BALANCEBODYCW_Event {}

class flush extends P2BALANCEBODYCW_Event {}

class P2BALANCEBODYCW_Bloc extends Bloc<P2BALANCEBODYCW_Event, String> {
  P2BALANCEBODYCW_Bloc() : super('') {
    on<P2BALANCEBODYCW_GET>((event, emit) {
      return _P2BALANCEBODYCW_GET('', emit);
    });
    on<P2BALANCEBODYCW_SETDATA>((event, emit) {
      return _P2BALANCEBODYCW_SETDATA('', emit);
    });

    on<P2BALANCEBODYCW_CLEARW11>((event, emit) {
      return _P2BALANCEBODYCW_CLEARW11('', emit);
    });

    on<P2BALANCEBODYCW_CAL>((event, emit) {
      return _P2BALANCEBODYCW_CAL('', emit);
    });

    on<P2BALANCEBODYCW_TEMP_SAVE>((event, emit) {
      return _P2BALANCEBODYCW_TEMP_SAVE('', emit);
    });

    on<P2BALANCEBODYCW_SEND_TO_SAR>((event, emit) {
      return _P2BALANCEBODYCW_SEND_TO_SAR('', emit);
    });

    on<P2BALANCEBODYCW_CLEARROOM>((event, emit) {
      return _P2BALANCEBODYCW_CLEARROOM('', emit);
    });

//_P2BALANCEBODYCW_SEND_TO_SAR
//_P2BALANCEBODYCW_CAL
    // on<P2BALANCEBODYCW_CLEARW11_ADJ>((event, emit) {
    //   return _P2BALANCEBODYCW_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P2BALANCEBODYCW_GET(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P2BALANCEBODYCW_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "02SARBALANCECW",
        "FUNCTION": "UPDATEDATAWEIGHT",
        "WX": P2BALANCEBODYCWVAR.WX
      },
    );

    emit(output);
  }

  Future<void> _P2BALANCEBODYCW_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "02SARBALANCECW",
        "FUNCTION": "DELETEDATAW11",
        "DX": P2BALANCEBODYCWVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P2BALANCEBODYCW_CAL(String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "02SARBALANCECW",
        "FUNCTION": "UPDATEDATAAREA",
        "D01NOitem": P2BALANCEBODYCWVAR.D01NOitem,
        "areaE01": P2BALANCEBODYCWVAR.D01area,
        "Result01": P2BALANCEBODYCWVAR.Result01,
        "D01W11_21": P2BALANCEBODYCWVAR.D01W11_21,
      },
    );

    emit(output);
  }

  Future<void> _P2BALANCEBODYCW_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "02SARBALANCECW",
        "FUNCTION": "UPDATEDATAAREA",
        "D01NOitem": P2BALANCEBODYCWVAR.D01NOitem,
        "areaE01": P2BALANCEBODYCWVAR.D01area,
        "Result01": P2BALANCEBODYCWVAR.Result01,
        "D01W11_21": P2BALANCEBODYCWVAR.D01W11_21,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_CW',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P2BALANCEBODYCWVAR.ReqNo,
          "UID": P2BALANCEBODYCWVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P2BALANCEBODYCWcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P2BALANCEBODYCWcontext,
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

  Future<void> _P2BALANCEBODYCW_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_SLUDGE',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P2BALANCEBODYCWVAR.ReqNo,
        "UID": P2BALANCEBODYCWVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P2BALANCEBODYCW_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P2BALANCEBODYCW_CLEARROOM(
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
