import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P33TOCBODYSTD/P32TOCBODYSTD.dart';
import '../../page/P33TOCBODYSTD/P32TOCBODYSTDVAR.dart';

import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_GET extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_SETDATA extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_CLEARW11 extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_CAL extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_TEMP_SAVE extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_SEND_TO_SAR extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_CLEARROOM extends P33TOCBODYSTD_Event {}

// class P33TOCBODYSTD_CLEARW11_ADJ extends P33TOCBODYSTD_Event {}

class flush extends P33TOCBODYSTD_Event {}

class P33TOCBODYSTD_Bloc extends Bloc<P33TOCBODYSTD_Event, String> {
  P33TOCBODYSTD_Bloc() : super('') {
    on<P33TOCBODYSTD_GET>((event, emit) {
      return _P33TOCBODYSTD_GET('', emit);
    });
    on<P33TOCBODYSTD_SETDATA>((event, emit) {
      return _P33TOCBODYSTD_SETDATA('', emit);
    });

    on<P33TOCBODYSTD_CLEARW11>((event, emit) {
      return _P33TOCBODYSTD_CLEARW11('', emit);
    });

    on<P33TOCBODYSTD_CAL>((event, emit) {
      return _P33TOCBODYSTD_CAL('', emit);
    });

    on<P33TOCBODYSTD_TEMP_SAVE>((event, emit) {
      return _P33TOCBODYSTD_TEMP_SAVE('', emit);
    });

    on<P33TOCBODYSTD_SEND_TO_SAR>((event, emit) {
      return _P33TOCBODYSTD_SEND_TO_SAR('', emit);
    });

    on<P33TOCBODYSTD_CLEARROOM>((event, emit) {
      return _P33TOCBODYSTD_CLEARROOM('', emit);
    });

//_P33TOCBODYSTD_SEND_TO_SAR
//_P33TOCBODYSTD_CAL
    // on<P33TOCBODYSTD_CLEARW11_ADJ>((event, emit) {
    //   return _P33TOCBODYSTD_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P33TOCBODYSTD_GET(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P33TOCBODYSTD_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "37SARTOCSTD",
        "FUNCTION": "UPDATEDATAPPM",
        "WX": "ALL"
      },
    );

    emit(output);
  }

  Future<void> _P33TOCBODYSTD_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "37SARTOCSTD",
        "FUNCTION": "DELETEDATAW11",
        "DX": P33TOCBODYSTDVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P33TOCBODYSTD_CAL(String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "37SARTOCSTD",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P33TOCBODYSTDVAR.D01NOitem,
        "D02NOitem": P33TOCBODYSTDVAR.D02NOitem,
        "VOLUME01": P33TOCBODYSTDVAR.D01VOLUME,
        "VOLUME02": P33TOCBODYSTDVAR.D02VOLUME,
        "Result01": P33TOCBODYSTDVAR.Result01,
        "Result02": P33TOCBODYSTDVAR.Result02,
        "D01W11_21": P33TOCBODYSTDVAR.D01W11_21,
        "D02W11_21": P33TOCBODYSTDVAR.D02W11_21,
      },
    );

    emit(output);
  }

  Future<void> _P33TOCBODYSTD_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "37SARTOCSTD",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P33TOCBODYSTDVAR.D01NOitem,
        "D02NOitem": P33TOCBODYSTDVAR.D02NOitem,
        "VOLUME01": P33TOCBODYSTDVAR.D01VOLUME,
        "VOLUME02": P33TOCBODYSTDVAR.D02VOLUME,
        "Result01": P33TOCBODYSTDVAR.Result01,
        "Result02": P33TOCBODYSTDVAR.Result02,
        "D01W11_21": P33TOCBODYSTDVAR.D01W11_21,
        "D02W11_21": P33TOCBODYSTDVAR.D02W11_21,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_TOC',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P33TOCBODYSTDVAR.ReqNo,
          "UID": P33TOCBODYSTDVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P33TOCBODYSTDcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P33TOCBODYSTDcontext,
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

  Future<void> _P33TOCBODYSTD_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_TOC',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P33TOCBODYSTDVAR.ReqNo,
        "UID": P33TOCBODYSTDVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P33TOCBODYSTD_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P33TOCBODYSTD_CLEARROOM(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/CLEARREGISTER_${USERDATA.INSMASTER}',
      data: {},
    );

    if (response.statusCode == 200) {
      var databuTOC = response.data;

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
    //     "ReqNo": P3BALANCEBODY01TOCVAR.REQNO,
    //     "InstrumentName": P3BALANCEBODY01TOCVAR.InstrumentName,
    //     //-------------------
    //     "Branch": P3BALANCEBODY01TOCVAR.Branch,
    //     "Code": P3BALANCEBODY01TOCVAR.Code,
    //     "ControlRange": P3BALANCEBODY01TOCVAR.ControlRange,
    //     "CustFull": P3BALANCEBODY01TOCVAR.CustFull,
    //     "CustId": P3BALANCEBODY01TOCVAR.CustId,
    //     "CustShort": P3BALANCEBODY01TOCVAR.CustShort,
    //     "DueDate1": P3BALANCEBODY01TOCVAR.DueDate1,
    //     "Incharge": P3BALANCEBODY01TOCVAR.Incharge,
    //     "ItemName": P3BALANCEBODY01TOCVAR.ItemName,
    //     "ItemNo": P3BALANCEBODY01TOCVAR.ItemNo,
    //     "ItemReportName": P3BALANCEBODY01TOCVAR.ItemReportName,
    //     "ItemStatus": P3BALANCEBODY01TOCVAR.ItemStatus,
    //     "JobType": P3BALANCEBODY01TOCVAR.JobType,
    //     "ListDate": P3BALANCEBODY01TOCVAR.ListDate,
    //     "Mag": P3BALANCEBODY01TOCVAR.Mag,
    //     "Position": P3BALANCEBODY01TOCVAR.Position,
    //     "ProcessReportName": P3BALANCEBODY01TOCVAR.ProcessReportName,
    //     "ReceiveDate": P3BALANCEBODY01TOCVAR.ReceiveDate,
    //     "RemarkNo": P3BALANCEBODY01TOCVAR.RemarkNo,
    //     "RemarkSend": P3BALANCEBODY01TOCVAR.RemarkSend,
    //     "ReportOrder": P3BALANCEBODY01TOCVAR.ReportOrder,
    //     "ReqDate": P3BALANCEBODY01TOCVAR.ReqDate,
    //     "ReqUser": P3BALANCEBODY01TOCVAR.ReqUser,
    //     "RequestRound": P3BALANCEBODY01TOCVAR.RequestRound,
    //     "RequestSection": P3BALANCEBODY01TOCVAR.RequestSection,
    //     "RequestStatus": P3BALANCEBODY01TOCVAR.RequestStatus,
    //     "SampleCode": P3BALANCEBODY01TOCVAR.SampleCode,
    //     "SampleGroup": P3BALANCEBODY01TOCVAR.SampleGroup,
    //     "SampleName": P3BALANCEBODY01TOCVAR.SampleName,
    //     "SampleNo": P3BALANCEBODY01TOCVAR.SampleNo,
    //     "SampleRemark": P3BALANCEBODY01TOCVAR.SampleRemark,
    //     "SampleStatus": P3BALANCEBODY01TOCVAR.SampleStatus,
    //     "SampleTank": P3BALANCEBODY01TOCVAR.SampleTank,
    //     "SampleType": P3BALANCEBODY01TOCVAR.SampleType,
    //     "SamplingDate": P3BALANCEBODY01TOCVAR.SamplingDate,
    //     "SendDate": P3BALANCEBODY01TOCVAR.SendDate,
    //     "Std1": P3BALANCEBODY01TOCVAR.Std1,
    //     "Std2": P3BALANCEBODY01TOCVAR.Std2,
    //     "Std3": P3BALANCEBODY01TOCVAR.Std3,
    //     "Std4": P3BALANCEBODY01TOCVAR.Std4,
    //     "Std5": P3BALANCEBODY01TOCVAR.Std5,
    //     "Std6": P3BALANCEBODY01TOCVAR.Std6,
    //     "Std7": P3BALANCEBODY01TOCVAR.Std7,
    //     "Std8": P3BALANCEBODY01TOCVAR.Std8,
    //     "Std9": P3BALANCEBODY01TOCVAR.Std9,
    //     "StdFactor": P3BALANCEBODY01TOCVAR.StdFactor,
    //     "StdMax": P3BALANCEBODY01TOCVAR.StdMax,
    //     "StdMaxL": P3BALANCEBODY01TOCVAR.StdMaxL,
    //     "StdMin": P3BALANCEBODY01TOCVAR.StdMin,
    //     "StdMinL": P3BALANCEBODY01TOCVAR.StdMinL,
    //     "StdSymbol": P3BALANCEBODY01TOCVAR.StdSymbol,
    //     "Temp": P3BALANCEBODY01TOCVAR.Temp,
    //     "UserListAnalysis": P3BALANCEBODY01TOCVAR.UserListAnalysis,
    //     "UserReceive": P3BALANCEBODY01TOCVAR.UserReceive,
    //     "UserReject": P3BALANCEBODY01TOCVAR.UserReject,
    //     "UserRequestRecheck": P3BALANCEBODY01TOCVAR.UserRequestRecheck,
    //     "UserSend": P3BALANCEBODY01TOCVAR.UserSend,
    //     //-------------------
    //     "value": "",
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuTOC = response.data;
    // }