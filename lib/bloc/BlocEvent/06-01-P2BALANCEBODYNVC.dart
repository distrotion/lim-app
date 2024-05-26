import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P6BALANCEBODYNVC/P6BALANCEBODYNVC.dart';
import '../../page/P6BALANCEBODYNVC/P6BALANCEBODYNVCVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_GET extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_SETDATA extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_CLEARW11 extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_CAL extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_TEMP_SAVE extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_SEND_TO_SAR extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_CLEARROOM extends P6BALANCEBODYNVC_Event {}

// class P6BALANCEBODYNVC_CLEARW11_ADJ extends P6BALANCEBODYNVC_Event {}

class flush extends P6BALANCEBODYNVC_Event {}

class P6BALANCEBODYNVC_Bloc extends Bloc<P6BALANCEBODYNVC_Event, String> {
  P6BALANCEBODYNVC_Bloc() : super('') {
    on<P6BALANCEBODYNVC_GET>((event, emit) {
      return _P6BALANCEBODYNVC_GET('', emit);
    });
    on<P6BALANCEBODYNVC_SETDATA>((event, emit) {
      return _P6BALANCEBODYNVC_SETDATA('', emit);
    });

    on<P6BALANCEBODYNVC_CLEARW11>((event, emit) {
      return _P6BALANCEBODYNVC_CLEARW11('', emit);
    });

    on<P6BALANCEBODYNVC_CAL>((event, emit) {
      return _P6BALANCEBODYNVC_CAL('', emit);
    });

    on<P6BALANCEBODYNVC_TEMP_SAVE>((event, emit) {
      return _P6BALANCEBODYNVC_TEMP_SAVE('', emit);
    });

    on<P6BALANCEBODYNVC_SEND_TO_SAR>((event, emit) {
      return _P6BALANCEBODYNVC_SEND_TO_SAR('', emit);
    });

    on<P6BALANCEBODYNVC_CLEARROOM>((event, emit) {
      return _P6BALANCEBODYNVC_CLEARROOM('', emit);
    });

//_P6BALANCEBODYNVC_SEND_TO_SAR
//_P6BALANCEBODYNVC_CAL
    // on<P6BALANCEBODYNVC_CLEARW11_ADJ>((event, emit) {
    //   return _P6BALANCEBODYNVC_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P6BALANCEBODYNVC_GET(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P6BALANCEBODYNVC_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "06SARBALANCENVC",
        "FUNCTION": "UPDATEDATAWEIGHT",
        "WX": P6BALANCEBODYNVCVAR.WX
      },
    );

    emit(output);
  }

  Future<void> _P6BALANCEBODYNVC_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "06SARBALANCENVC",
        "FUNCTION": "DELETEDATAW11",
        "DX": P6BALANCEBODYNVCVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P6BALANCEBODYNVC_CAL(String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "06SARBALANCENVC",
        "FUNCTION": "UPDATEDATAAREA",
        "D01NOitem": P6BALANCEBODYNVCVAR.D01NOitem,
        "D02NOitem": P6BALANCEBODYNVCVAR.D02NOitem,
        "Result01": P6BALANCEBODYNVCVAR.Result01,
        "Result02": P6BALANCEBODYNVCVAR.Result02,
      },
    );

    emit(output);
  }

  Future<void> _P6BALANCEBODYNVC_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "06SARBALANCENVC",
        "FUNCTION": "UPDATEDATAAREA",
        "D01NOitem": P6BALANCEBODYNVCVAR.D01NOitem,
        "D02NOitem": P6BALANCEBODYNVCVAR.D02NOitem,
        "Result01": P6BALANCEBODYNVCVAR.Result01,
        "Result02": P6BALANCEBODYNVCVAR.Result02,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_NVC',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P6BALANCEBODYNVCVAR.ReqNo,
          "UID": P6BALANCEBODYNVCVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P6BALANCEBODYNVCcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P6BALANCEBODYNVCcontext,
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

  Future<void> _P6BALANCEBODYNVC_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_SLUDGE',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P6BALANCEBODYNVCVAR.ReqNo,
        "UID": P6BALANCEBODYNVCVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P6BALANCEBODYNVC_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P6BALANCEBODYNVC_CLEARROOM(
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
