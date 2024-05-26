import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P8BALANCEBODYSSM/P8BALANCEBODYSSM.dart';
import '../../page/P8BALANCEBODYSSM/P8BALANCEBODYSSMVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_GET extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_SETDATA extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_CLEARW11 extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_CAL extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_TEMP_SAVE extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_SEND_TO_SAR extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_CLEARROOM extends P8BALANCEBODYSSM_Event {}

// class P8BALANCEBODYSSM_CLEARW11_ADJ extends P8BALANCEBODYSSM_Event {}

class flush extends P8BALANCEBODYSSM_Event {}

class P8BALANCEBODYSSM_Bloc extends Bloc<P8BALANCEBODYSSM_Event, String> {
  P8BALANCEBODYSSM_Bloc() : super('') {
    on<P8BALANCEBODYSSM_GET>((event, emit) {
      return _P8BALANCEBODYSSM_GET('', emit);
    });
    on<P8BALANCEBODYSSM_SETDATA>((event, emit) {
      return _P8BALANCEBODYSSM_SETDATA('', emit);
    });

    on<P8BALANCEBODYSSM_CLEARW11>((event, emit) {
      return _P8BALANCEBODYSSM_CLEARW11('', emit);
    });

    on<P8BALANCEBODYSSM_CAL>((event, emit) {
      return _P8BALANCEBODYSSM_CAL('', emit);
    });

    on<P8BALANCEBODYSSM_TEMP_SAVE>((event, emit) {
      return _P8BALANCEBODYSSM_TEMP_SAVE('', emit);
    });

    on<P8BALANCEBODYSSM_SEND_TO_SAR>((event, emit) {
      return _P8BALANCEBODYSSM_SEND_TO_SAR('', emit);
    });

    on<P8BALANCEBODYSSM_CLEARROOM>((event, emit) {
      return _P8BALANCEBODYSSM_CLEARROOM('', emit);
    });

//_P8BALANCEBODYSSM_SEND_TO_SAR
//_P8BALANCEBODYSSM_CAL
    // on<P8BALANCEBODYSSM_CLEARW11_ADJ>((event, emit) {
    //   return _P8BALANCEBODYSSM_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P8BALANCEBODYSSM_GET(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P8BALANCEBODYSSM_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "04SARBALANCESSM",
        "FUNCTION": "UPDATEDATAWEIGHT",
        "WX": P8BALANCEBODYSSMVAR.WX
      },
    );

    emit(output);
  }

  Future<void> _P8BALANCEBODYSSM_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "04SARBALANCESSM",
        "FUNCTION": "DELETEDATAW11",
        "DX": P8BALANCEBODYSSMVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P8BALANCEBODYSSM_CAL(String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "04SARBALANCESSM",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P8BALANCEBODYSSMVAR.D01NOitem,
        "D02NOitem": P8BALANCEBODYSSMVAR.D02NOitem,
        "VOLUME01": P8BALANCEBODYSSMVAR.D01VOLUME,
        "VOLUME02": P8BALANCEBODYSSMVAR.D02VOLUME,
        "Result01": P8BALANCEBODYSSMVAR.Result01,
        "Result02": P8BALANCEBODYSSMVAR.Result02,
        "D01W11_21": P8BALANCEBODYSSMVAR.D01W11_21,
        "D02W11_21": P8BALANCEBODYSSMVAR.D02W11_21,
      },
    );

    emit(output);
  }

  Future<void> _P8BALANCEBODYSSM_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "04SARBALANCESSM",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P8BALANCEBODYSSMVAR.D01NOitem,
        "D02NOitem": P8BALANCEBODYSSMVAR.D02NOitem,
        "VOLUME01": P8BALANCEBODYSSMVAR.D01VOLUME,
        "VOLUME02": P8BALANCEBODYSSMVAR.D02VOLUME,
        "Result01": P8BALANCEBODYSSMVAR.Result01,
        "Result02": P8BALANCEBODYSSMVAR.Result02,
        "D01W11_21": P8BALANCEBODYSSMVAR.D01W11_21,
        "D02W11_21": P8BALANCEBODYSSMVAR.D02W11_21,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_SSM',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P8BALANCEBODYSSMVAR.ReqNo,
          "UID": P8BALANCEBODYSSMVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P8BALANCEBODYSSMcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P8BALANCEBODYSSMcontext,
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

  Future<void> _P8BALANCEBODYSSM_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_SSM',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P8BALANCEBODYSSMVAR.ReqNo,
        "UID": P8BALANCEBODYSSMVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P8BALANCEBODYSSM_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P8BALANCEBODYSSM_CLEARROOM(
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



    // final response = await Dio().post(
    //   '${serverG}02SARBALANCE01SINGLESHOT/GENREQ',
    //   data: {
    //     "ReqNo": P8BALANCEBODY01SSMVAR.REQNO,
    //     "InstrumentName": P8BALANCEBODY01SSMVAR.InstrumentName,
    //     //-------------------
    //     "Branch": P8BALANCEBODY01SSMVAR.Branch,
    //     "Code": P8BALANCEBODY01SSMVAR.Code,
    //     "ControlRange": P8BALANCEBODY01SSMVAR.ControlRange,
    //     "CustFull": P8BALANCEBODY01SSMVAR.CustFull,
    //     "CustId": P8BALANCEBODY01SSMVAR.CustId,
    //     "CustShort": P8BALANCEBODY01SSMVAR.CustShort,
    //     "DueDate1": P8BALANCEBODY01SSMVAR.DueDate1,
    //     "Incharge": P8BALANCEBODY01SSMVAR.Incharge,
    //     "ItemName": P8BALANCEBODY01SSMVAR.ItemName,
    //     "ItemNo": P8BALANCEBODY01SSMVAR.ItemNo,
    //     "ItemReportName": P8BALANCEBODY01SSMVAR.ItemReportName,
    //     "ItemStatus": P8BALANCEBODY01SSMVAR.ItemStatus,
    //     "JobType": P8BALANCEBODY01SSMVAR.JobType,
    //     "ListDate": P8BALANCEBODY01SSMVAR.ListDate,
    //     "Mag": P8BALANCEBODY01SSMVAR.Mag,
    //     "Position": P8BALANCEBODY01SSMVAR.Position,
    //     "ProcessReportName": P8BALANCEBODY01SSMVAR.ProcessReportName,
    //     "ReceiveDate": P8BALANCEBODY01SSMVAR.ReceiveDate,
    //     "RemarkNo": P8BALANCEBODY01SSMVAR.RemarkNo,
    //     "RemarkSend": P8BALANCEBODY01SSMVAR.RemarkSend,
    //     "ReportOrder": P8BALANCEBODY01SSMVAR.ReportOrder,
    //     "ReqDate": P8BALANCEBODY01SSMVAR.ReqDate,
    //     "ReqUser": P8BALANCEBODY01SSMVAR.ReqUser,
    //     "RequestRound": P8BALANCEBODY01SSMVAR.RequestRound,
    //     "RequestSection": P8BALANCEBODY01SSMVAR.RequestSection,
    //     "RequestStatus": P8BALANCEBODY01SSMVAR.RequestStatus,
    //     "SampleCode": P8BALANCEBODY01SSMVAR.SampleCode,
    //     "SampleGroup": P8BALANCEBODY01SSMVAR.SampleGroup,
    //     "SampleName": P8BALANCEBODY01SSMVAR.SampleName,
    //     "SampleNo": P8BALANCEBODY01SSMVAR.SampleNo,
    //     "SampleRemark": P8BALANCEBODY01SSMVAR.SampleRemark,
    //     "SampleStatus": P8BALANCEBODY01SSMVAR.SampleStatus,
    //     "SampleTank": P8BALANCEBODY01SSMVAR.SampleTank,
    //     "SampleType": P8BALANCEBODY01SSMVAR.SampleType,
    //     "SamplingDate": P8BALANCEBODY01SSMVAR.SamplingDate,
    //     "SendDate": P8BALANCEBODY01SSMVAR.SendDate,
    //     "Std1": P8BALANCEBODY01SSMVAR.Std1,
    //     "Std2": P8BALANCEBODY01SSMVAR.Std2,
    //     "Std3": P8BALANCEBODY01SSMVAR.Std3,
    //     "Std4": P8BALANCEBODY01SSMVAR.Std4,
    //     "Std5": P8BALANCEBODY01SSMVAR.Std5,
    //     "Std6": P8BALANCEBODY01SSMVAR.Std6,
    //     "Std7": P8BALANCEBODY01SSMVAR.Std7,
    //     "Std8": P8BALANCEBODY01SSMVAR.Std8,
    //     "Std9": P8BALANCEBODY01SSMVAR.Std9,
    //     "StdFactor": P8BALANCEBODY01SSMVAR.StdFactor,
    //     "StdMax": P8BALANCEBODY01SSMVAR.StdMax,
    //     "StdMaxL": P8BALANCEBODY01SSMVAR.StdMaxL,
    //     "StdMin": P8BALANCEBODY01SSMVAR.StdMin,
    //     "StdMinL": P8BALANCEBODY01SSMVAR.StdMinL,
    //     "StdSymbol": P8BALANCEBODY01SSMVAR.StdSymbol,
    //     "Temp": P8BALANCEBODY01SSMVAR.Temp,
    //     "UserListAnalysis": P8BALANCEBODY01SSMVAR.UserListAnalysis,
    //     "UserReceive": P8BALANCEBODY01SSMVAR.UserReceive,
    //     "UserReject": P8BALANCEBODY01SSMVAR.UserReject,
    //     "UserRequestRecheck": P8BALANCEBODY01SSMVAR.UserRequestRecheck,
    //     "UserSend": P8BALANCEBODY01SSMVAR.UserSend,
    //     //-------------------
    //     "value": "",
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    // }