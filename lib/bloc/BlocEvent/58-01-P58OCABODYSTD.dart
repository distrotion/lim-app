import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P58OCABODYSTD/P58OCABODYSTD.dart';
import '../../page/P58OCABODYSTD/P58OCABODYSTDVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P58OCABODYSTD_Event {}

class P58OCABODYSTD_GET extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_SETDATA extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_CLEARW11 extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_CAL extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_TEMP_SAVE extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_SEND_TO_SAR extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_CLEARROOM extends P58OCABODYSTD_Event {}

// class P58OCABODYSTD_CLEARW11_ADJ extends P58OCABODYSTD_Event {}

class flush extends P58OCABODYSTD_Event {}

class P58OCABODYSTD_Bloc extends Bloc<P58OCABODYSTD_Event, String> {
  P58OCABODYSTD_Bloc() : super('') {
    on<P58OCABODYSTD_GET>((event, emit) {
      return _P58OCABODYSTD_GET('', emit);
    });
    on<P58OCABODYSTD_SETDATA>((event, emit) {
      return _P58OCABODYSTD_SETDATA('', emit);
    });

    on<P58OCABODYSTD_CLEARW11>((event, emit) {
      return _P58OCABODYSTD_CLEARW11('', emit);
    });

    on<P58OCABODYSTD_CAL>((event, emit) {
      return _P58OCABODYSTD_CAL('', emit);
    });

    on<P58OCABODYSTD_TEMP_SAVE>((event, emit) {
      return _P58OCABODYSTD_TEMP_SAVE('', emit);
    });

    on<P58OCABODYSTD_SEND_TO_SAR>((event, emit) {
      return _P58OCABODYSTD_SEND_TO_SAR('', emit);
    });

    on<P58OCABODYSTD_CLEARROOM>((event, emit) {
      return _P58OCABODYSTD_CLEARROOM('', emit);
    });

//_P58OCABODYSTD_SEND_TO_SAR
//_P58OCABODYSTD_CAL
    // on<P58OCABODYSTD_CLEARW11_ADJ>((event, emit) {
    //   return _P58OCABODYSTD_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P58OCABODYSTD_GET(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P58OCABODYSTD_SETDATA(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {"IP": webHOOK, "TYPE": "42SAROCASTD", "FUNCTION": "UPDATEDATAPPM", "WX": "ALL"},
    );

    emit(output);
  }

  Future<void> _P58OCABODYSTD_CLEARW11(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "42SAROCASTD",
        "FUNCTION": "DELETEDATAW11",
        "DX": P58OCABODYSTDVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P58OCABODYSTD_CAL(String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "42SAROCASTD",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P58OCABODYSTDVAR.D01NOitem,
        "D02NOitem": P58OCABODYSTDVAR.D02NOitem,
        "VOLUME01": P58OCABODYSTDVAR.D01VOLUME,
        "VOLUME02": P58OCABODYSTDVAR.D02VOLUME,
        "Result01": P58OCABODYSTDVAR.Result01,
        "Result02": P58OCABODYSTDVAR.Result02,
        "D01W11_21": P58OCABODYSTDVAR.D01W11_21,
        "D02W11_21": P58OCABODYSTDVAR.D02W11_21,
      },
    );

    emit(output);
  }

  Future<void> _P58OCABODYSTD_TEMP_SAVE(String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "42SAROCASTD",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P58OCABODYSTDVAR.D01NOitem,
        "D02NOitem": P58OCABODYSTDVAR.D02NOitem,
        "VOLUME01": P58OCABODYSTDVAR.D01VOLUME,
        "VOLUME02": P58OCABODYSTDVAR.D02VOLUME,
        "Result01": P58OCABODYSTDVAR.Result01,
        "Result02": P58OCABODYSTDVAR.Result02,
        "D01W11_21": P58OCABODYSTDVAR.D01W11_21,
        "D02W11_21": P58OCABODYSTDVAR.D02W11_21,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_OCA',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P58OCABODYSTDVAR.ReqNo,
          "UID": P58OCABODYSTDVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P58OCABODYSTDcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P58OCABODYSTDcontext,
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

  Future<void> _P58OCABODYSTD_SEND_TO_SAR(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_OCA',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P58OCABODYSTDVAR.ReqNo,
        "UID": P58OCABODYSTDVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P58OCABODYSTD_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P58OCABODYSTD_CLEARROOM(String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/CLEARREGISTER_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuUV = response.data;

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
    //     "ReqNo": P3BALANCEBODY01UVVAR.REQNO,
    //     "InstrumentName": P3BALANCEBODY01UVVAR.InstrumentName,
    //     //-------------------
    //     "Branch": P3BALANCEBODY01UVVAR.Branch,
    //     "Code": P3BALANCEBODY01UVVAR.Code,
    //     "ControlRange": P3BALANCEBODY01UVVAR.ControlRange,
    //     "CustFull": P3BALANCEBODY01UVVAR.CustFull,
    //     "CustId": P3BALANCEBODY01UVVAR.CustId,
    //     "CustShort": P3BALANCEBODY01UVVAR.CustShort,
    //     "DueDate1": P3BALANCEBODY01UVVAR.DueDate1,
    //     "Incharge": P3BALANCEBODY01UVVAR.Incharge,
    //     "ItemName": P3BALANCEBODY01UVVAR.ItemName,
    //     "ItemNo": P3BALANCEBODY01UVVAR.ItemNo,
    //     "ItemReportName": P3BALANCEBODY01UVVAR.ItemReportName,
    //     "ItemStatus": P3BALANCEBODY01UVVAR.ItemStatus,
    //     "JobType": P3BALANCEBODY01UVVAR.JobType,
    //     "ListDate": P3BALANCEBODY01UVVAR.ListDate,
    //     "Mag": P3BALANCEBODY01UVVAR.Mag,
    //     "Position": P3BALANCEBODY01UVVAR.Position,
    //     "ProcessReportName": P3BALANCEBODY01UVVAR.ProcessReportName,
    //     "ReceiveDate": P3BALANCEBODY01UVVAR.ReceiveDate,
    //     "RemarkNo": P3BALANCEBODY01UVVAR.RemarkNo,
    //     "RemarkSend": P3BALANCEBODY01UVVAR.RemarkSend,
    //     "ReportOrder": P3BALANCEBODY01UVVAR.ReportOrder,
    //     "ReqDate": P3BALANCEBODY01UVVAR.ReqDate,
    //     "ReqUser": P3BALANCEBODY01UVVAR.ReqUser,
    //     "RequestRound": P3BALANCEBODY01UVVAR.RequestRound,
    //     "RequestSection": P3BALANCEBODY01UVVAR.RequestSection,
    //     "RequestStatus": P3BALANCEBODY01UVVAR.RequestStatus,
    //     "SampleCode": P3BALANCEBODY01UVVAR.SampleCode,
    //     "SampleGroup": P3BALANCEBODY01UVVAR.SampleGroup,
    //     "SampleName": P3BALANCEBODY01UVVAR.SampleName,
    //     "SampleNo": P3BALANCEBODY01UVVAR.SampleNo,
    //     "SampleRemark": P3BALANCEBODY01UVVAR.SampleRemark,
    //     "SampleStatus": P3BALANCEBODY01UVVAR.SampleStatus,
    //     "SampleTank": P3BALANCEBODY01UVVAR.SampleTank,
    //     "SampleType": P3BALANCEBODY01UVVAR.SampleType,
    //     "SamplingDate": P3BALANCEBODY01UVVAR.SamplingDate,
    //     "SendDate": P3BALANCEBODY01UVVAR.SendDate,
    //     "Std1": P3BALANCEBODY01UVVAR.Std1,
    //     "Std2": P3BALANCEBODY01UVVAR.Std2,
    //     "Std3": P3BALANCEBODY01UVVAR.Std3,
    //     "Std4": P3BALANCEBODY01UVVAR.Std4,
    //     "Std5": P3BALANCEBODY01UVVAR.Std5,
    //     "Std6": P3BALANCEBODY01UVVAR.Std6,
    //     "Std7": P3BALANCEBODY01UVVAR.Std7,
    //     "Std8": P3BALANCEBODY01UVVAR.Std8,
    //     "Std9": P3BALANCEBODY01UVVAR.Std9,
    //     "StdFactor": P3BALANCEBODY01UVVAR.StdFactor,
    //     "StdMax": P3BALANCEBODY01UVVAR.StdMax,
    //     "StdMaxL": P3BALANCEBODY01UVVAR.StdMaxL,
    //     "StdMin": P3BALANCEBODY01UVVAR.StdMin,
    //     "StdMinL": P3BALANCEBODY01UVVAR.StdMinL,
    //     "StdSymbol": P3BALANCEBODY01UVVAR.StdSymbol,
    //     "Temp": P3BALANCEBODY01UVVAR.Temp,
    //     "UserListAnalysis": P3BALANCEBODY01UVVAR.UserListAnalysis,
    //     "UserReceive": P3BALANCEBODY01UVVAR.UserReceive,
    //     "UserReject": P3BALANCEBODY01UVVAR.UserReject,
    //     "UserRequestRecheck": P3BALANCEBODY01UVVAR.UserRequestRecheck,
    //     "UserSend": P3BALANCEBODY01UVVAR.UserSend,
    //     //-------------------
    //     "value": "",
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuUV = response.data;
    // }