import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

import '../../page/P54ICS8100BODYSTD/P54ICS8100BODYSTD.dart';
import '../../page/P54ICS8100BODYSTD/P54ICS8100BODYSTDVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_GET extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_SETDATA extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_CLEARW11 extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_CAL extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_TEMP_SAVE extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_SEND_TO_SAR extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_CLEARROOM extends P54ICS8100BODYSTD_Event {}

// class P54ICS8100BODYSTD_CLEARW11_ADJ extends P54ICS8100BODYSTD_Event {}

class flush extends P54ICS8100BODYSTD_Event {}

class P54ICS8100BODYSTD_Bloc extends Bloc<P54ICS8100BODYSTD_Event, String> {
  P54ICS8100BODYSTD_Bloc() : super('') {
    on<P54ICS8100BODYSTD_GET>((event, emit) {
      return _P54ICS8100BODYSTD_GET('', emit);
    });
    on<P54ICS8100BODYSTD_SETDATA>((event, emit) {
      return _P54ICS8100BODYSTD_SETDATA('', emit);
    });

    on<P54ICS8100BODYSTD_CLEARW11>((event, emit) {
      return _P54ICS8100BODYSTD_CLEARW11('', emit);
    });

    on<P54ICS8100BODYSTD_CAL>((event, emit) {
      return _P54ICS8100BODYSTD_CAL('', emit);
    });

    on<P54ICS8100BODYSTD_TEMP_SAVE>((event, emit) {
      return _P54ICS8100BODYSTD_TEMP_SAVE('', emit);
    });

    on<P54ICS8100BODYSTD_SEND_TO_SAR>((event, emit) {
      return _P54ICS8100BODYSTD_SEND_TO_SAR('', emit);
    });

    on<P54ICS8100BODYSTD_CLEARROOM>((event, emit) {
      return _P54ICS8100BODYSTD_CLEARROOM('', emit);
    });

//_P54ICS8100BODYSTD_SEND_TO_SAR
//_P54ICS8100BODYSTD_CAL
    // on<P54ICS8100BODYSTD_CLEARW11_ADJ>((event, emit) {
    //   return _P54ICS8100BODYSTD_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P54ICS8100BODYSTD_GET(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P54ICS8100BODYSTD_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "53SARIC8100EXSTD",
        "FUNCTION": "UPDATEDATAPPM",
        "WX": "ALL",
        "ITEM": P54ICS8100BODYSTDVAR.itemName,
        "D01NOitem": P54ICS8100BODYSTDVAR.D01NOitem,
        "D02NOitem": P54ICS8100BODYSTDVAR.D02NOitem,
        "VOLUME01": P54ICS8100BODYSTDVAR.D01VOLUME,
        "VOLUME02": P54ICS8100BODYSTDVAR.D02VOLUME,
        "Result01": P54ICS8100BODYSTDVAR.Result01,
        "Result02": P54ICS8100BODYSTDVAR.Result02,
        "D01W11_21": P54ICS8100BODYSTDVAR.D01VOLUME,
        "D02W11_21": P54ICS8100BODYSTDVAR.D02VOLUME,
      },
    );

    emit(output);
  }

  Future<void> _P54ICS8100BODYSTD_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "53SARIC8100EXSTD",
        "FUNCTION": "DELETEDATAW11",
        "DX": P54ICS8100BODYSTDVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P54ICS8100BODYSTD_CAL(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "53SARIC8100EXSTD",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P54ICS8100BODYSTDVAR.D01NOitem,
        "D02NOitem": P54ICS8100BODYSTDVAR.D02NOitem,
        "VOLUME01": P54ICS8100BODYSTDVAR.D01VOLUME,
        "VOLUME02": P54ICS8100BODYSTDVAR.D02VOLUME,
        "Result01": P54ICS8100BODYSTDVAR.Result01,
        "Result02": P54ICS8100BODYSTDVAR.Result02,
        "D01W11_21": P54ICS8100BODYSTDVAR.D01VOLUME,
        "D02W11_21": P54ICS8100BODYSTDVAR.D02VOLUME,
      },
    );

    emit(output);
  }

  Future<void> _P54ICS8100BODYSTD_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    // print("--------->2");

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "53SARIC8100EXSTD",
        "FUNCTION": "UPDATEDATAVOLUME",
        "ITEM": P54ICS8100BODYSTDVAR.itemName,
        "D01NOitem": P54ICS8100BODYSTDVAR.D01NOitem,
        "D02NOitem": P54ICS8100BODYSTDVAR.D02NOitem,
        "VOLUME01": P54ICS8100BODYSTDVAR.D01VOLUME,
        "VOLUME02": P54ICS8100BODYSTDVAR.D02VOLUME,
        "Result01": P54ICS8100BODYSTDVAR.Result01,
        "Result02": P54ICS8100BODYSTDVAR.Result02,
        "D01W11_21": P54ICS8100BODYSTDVAR.D01VOLUME,
        "D02W11_21": P54ICS8100BODYSTDVAR.D02VOLUME,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_ICS8100',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P54ICS8100BODYSTDVAR.ReqNo,
          "UID": P54ICS8100BODYSTDVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P54ICS8100BODYSTDcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P54ICS8100BODYSTDcontext,
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

  Future<void> _P54ICS8100BODYSTD_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_XRF',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P54ICS8100BODYSTDVAR.ReqNo,
        "UID": P54ICS8100BODYSTDVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P54ICS8100BODYSTD_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P54ICS8100BODYSTD_CLEARROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/CLEARREGISTER_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuXRF = response.data;

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
    //     "ReqNo": P3BALANCEBODY01XRFVAR.REQNO,
    //     "InstrumentName": P3BALANCEBODY01XRFVAR.InstrumentName,
    //     //-------------------
    //     "Branch": P3BALANCEBODY01XRFVAR.Branch,
    //     "Code": P3BALANCEBODY01XRFVAR.Code,
    //     "ControlRange": P3BALANCEBODY01XRFVAR.ControlRange,
    //     "CustFull": P3BALANCEBODY01XRFVAR.CustFull,
    //     "CustId": P3BALANCEBODY01XRFVAR.CustId,
    //     "CustShort": P3BALANCEBODY01XRFVAR.CustShort,
    //     "DueDate1": P3BALANCEBODY01XRFVAR.DueDate1,
    //     "Incharge": P3BALANCEBODY01XRFVAR.Incharge,
    //     "ItemName": P3BALANCEBODY01XRFVAR.ItemName,
    //     "ItemNo": P3BALANCEBODY01XRFVAR.ItemNo,
    //     "ItemReportName": P3BALANCEBODY01XRFVAR.ItemReportName,
    //     "ItemStatus": P3BALANCEBODY01XRFVAR.ItemStatus,
    //     "JobType": P3BALANCEBODY01XRFVAR.JobType,
    //     "ListDate": P3BALANCEBODY01XRFVAR.ListDate,
    //     "Mag": P3BALANCEBODY01XRFVAR.Mag,
    //     "Position": P3BALANCEBODY01XRFVAR.Position,
    //     "ProcessReportName": P3BALANCEBODY01XRFVAR.ProcessReportName,
    //     "ReceiveDate": P3BALANCEBODY01XRFVAR.ReceiveDate,
    //     "RemarkNo": P3BALANCEBODY01XRFVAR.RemarkNo,
    //     "RemarkSend": P3BALANCEBODY01XRFVAR.RemarkSend,
    //     "ReportOrder": P3BALANCEBODY01XRFVAR.ReportOrder,
    //     "ReqDate": P3BALANCEBODY01XRFVAR.ReqDate,
    //     "ReqUser": P3BALANCEBODY01XRFVAR.ReqUser,
    //     "RequestRound": P3BALANCEBODY01XRFVAR.RequestRound,
    //     "RequestSection": P3BALANCEBODY01XRFVAR.RequestSection,
    //     "RequestStatus": P3BALANCEBODY01XRFVAR.RequestStatus,
    //     "SampleCode": P3BALANCEBODY01XRFVAR.SampleCode,
    //     "SampleGroup": P3BALANCEBODY01XRFVAR.SampleGroup,
    //     "SampleName": P3BALANCEBODY01XRFVAR.SampleName,
    //     "SampleNo": P3BALANCEBODY01XRFVAR.SampleNo,
    //     "SampleRemark": P3BALANCEBODY01XRFVAR.SampleRemark,
    //     "SampleStatus": P3BALANCEBODY01XRFVAR.SampleStatus,
    //     "SampleTank": P3BALANCEBODY01XRFVAR.SampleTank,
    //     "SampleType": P3BALANCEBODY01XRFVAR.SampleType,
    //     "SamplingDate": P3BALANCEBODY01XRFVAR.SamplingDate,
    //     "SendDate": P3BALANCEBODY01XRFVAR.SendDate,
    //     "Std1": P3BALANCEBODY01XRFVAR.Std1,
    //     "Std2": P3BALANCEBODY01XRFVAR.Std2,
    //     "Std3": P3BALANCEBODY01XRFVAR.Std3,
    //     "Std4": P3BALANCEBODY01XRFVAR.Std4,
    //     "Std5": P3BALANCEBODY01XRFVAR.Std5,
    //     "Std6": P3BALANCEBODY01XRFVAR.Std6,
    //     "Std7": P3BALANCEBODY01XRFVAR.Std7,
    //     "Std8": P3BALANCEBODY01XRFVAR.Std8,
    //     "Std9": P3BALANCEBODY01XRFVAR.Std9,
    //     "StdFactor": P3BALANCEBODY01XRFVAR.StdFactor,
    //     "StdMax": P3BALANCEBODY01XRFVAR.StdMax,
    //     "StdMaxL": P3BALANCEBODY01XRFVAR.StdMaxL,
    //     "StdMin": P3BALANCEBODY01XRFVAR.StdMin,
    //     "StdMinL": P3BALANCEBODY01XRFVAR.StdMinL,
    //     "StdSymbol": P3BALANCEBODY01XRFVAR.StdSymbol,
    //     "Temp": P3BALANCEBODY01XRFVAR.Temp,
    //     "UserListAnalysis": P3BALANCEBODY01XRFVAR.UserListAnalysis,
    //     "UserReceive": P3BALANCEBODY01XRFVAR.UserReceive,
    //     "UserReject": P3BALANCEBODY01XRFVAR.UserReject,
    //     "UserRequestRecheck": P3BALANCEBODY01XRFVAR.UserRequestRecheck,
    //     "UserSend": P3BALANCEBODY01XRFVAR.UserSend,
    //     //-------------------
    //     "value": "",
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuXRF = response.data;
    // }