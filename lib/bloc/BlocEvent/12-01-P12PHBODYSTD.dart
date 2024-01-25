import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P12PHBODYSTD/P12PHBODYSTD.dart';
import '../../page/P12PHBODYSTD/P12PHBODYSTDVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P12PHBODYSTD_Event {}

class P12PHBODYSTD_GET extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_SETDATA extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_CLEARW11 extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_CAL extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_TEMP_SAVE extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_SEND_TO_SAR extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_CLEARROOM extends P12PHBODYSTD_Event {}

// class P12PHBODYSTD_CLEARW11_ADJ extends P12PHBODYSTD_Event {}

class flush extends P12PHBODYSTD_Event {}

class P12PHBODYSTD_Bloc extends Bloc<P12PHBODYSTD_Event, String> {
  P12PHBODYSTD_Bloc() : super('') {
    on<P12PHBODYSTD_GET>((event, emit) {
      return _P12PHBODYSTD_GET('', emit);
    });
    on<P12PHBODYSTD_SETDATA>((event, emit) {
      return _P12PHBODYSTD_SETDATA('', emit);
    });

    on<P12PHBODYSTD_CLEARW11>((event, emit) {
      return _P12PHBODYSTD_CLEARW11('', emit);
    });

    on<P12PHBODYSTD_CAL>((event, emit) {
      return _P12PHBODYSTD_CAL('', emit);
    });

    on<P12PHBODYSTD_TEMP_SAVE>((event, emit) {
      return _P12PHBODYSTD_TEMP_SAVE('', emit);
    });

    on<P12PHBODYSTD_SEND_TO_SAR>((event, emit) {
      return _P12PHBODYSTD_SEND_TO_SAR('', emit);
    });

    on<P12PHBODYSTD_CLEARROOM>((event, emit) {
      return _P12PHBODYSTD_CLEARROOM('', emit);
    });

//_P12PHBODYSTD_SEND_TO_SAR
//_P12PHBODYSTD_CAL
    // on<P12PHBODYSTD_CLEARW11_ADJ>((event, emit) {
    //   return _P12PHBODYSTD_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P12PHBODYSTD_GET(String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P12PHBODYSTD_SETDATA(String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "04SARBALANCEICP",
        "FUNCTION": "UPDATEDATAWEIGHT",
        "WX": P12PHBODYSTDVAR.WX
      },
    );

    emit(output);
  }

  Future<void> _P12PHBODYSTD_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "04SARBALANCEICP",
        "FUNCTION": "DELETEDATAW11",
        "DX": P12PHBODYSTDVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P12PHBODYSTD_CAL(String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "04SARBALANCEICP",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P12PHBODYSTDVAR.D01NOitem,
        "D02NOitem": P12PHBODYSTDVAR.D02NOitem,
        "VOLUME01": P12PHBODYSTDVAR.D01VOLUME,
        "VOLUME02": P12PHBODYSTDVAR.D02VOLUME,
        "Result01": P12PHBODYSTDVAR.Result01,
        "Result02": P12PHBODYSTDVAR.Result02,
        "D01W11_21": P12PHBODYSTDVAR.D01W11_21,
        "D02W11_21": P12PHBODYSTDVAR.D02W11_21,
      },
    );

    emit(output);
  }

  Future<void> _P12PHBODYSTD_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "04SARBALANCEICP",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P12PHBODYSTDVAR.D01NOitem,
        "D02NOitem": P12PHBODYSTDVAR.D02NOitem,
        "VOLUME01": P12PHBODYSTDVAR.D01VOLUME,
        "VOLUME02": P12PHBODYSTDVAR.D02VOLUME,
        "Result01": P12PHBODYSTDVAR.Result01,
        "Result02": P12PHBODYSTDVAR.Result02,
        "D01W11_21": P12PHBODYSTDVAR.D01W11_21,
        "D02W11_21": P12PHBODYSTDVAR.D02W11_21,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_ICP',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P12PHBODYSTDVAR.ReqNo,
          "UID": P12PHBODYSTDVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P12PHBODYSTDcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P12PHBODYSTDcontext,
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

  Future<void> _P12PHBODYSTD_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_ICP',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P12PHBODYSTDVAR.ReqNo,
        "UID": P12PHBODYSTDVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P12PHBODYSTD_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P12PHBODYSTD_CLEARROOM(
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
    //     "ReqNo": P3BALANCEBODY01ICPVAR.REQNO,
    //     "InstrumentName": P3BALANCEBODY01ICPVAR.InstrumentName,
    //     //-------------------
    //     "Branch": P3BALANCEBODY01ICPVAR.Branch,
    //     "Code": P3BALANCEBODY01ICPVAR.Code,
    //     "ControlRange": P3BALANCEBODY01ICPVAR.ControlRange,
    //     "CustFull": P3BALANCEBODY01ICPVAR.CustFull,
    //     "CustId": P3BALANCEBODY01ICPVAR.CustId,
    //     "CustShort": P3BALANCEBODY01ICPVAR.CustShort,
    //     "DueDate1": P3BALANCEBODY01ICPVAR.DueDate1,
    //     "Incharge": P3BALANCEBODY01ICPVAR.Incharge,
    //     "ItemName": P3BALANCEBODY01ICPVAR.ItemName,
    //     "ItemNo": P3BALANCEBODY01ICPVAR.ItemNo,
    //     "ItemReportName": P3BALANCEBODY01ICPVAR.ItemReportName,
    //     "ItemStatus": P3BALANCEBODY01ICPVAR.ItemStatus,
    //     "JobType": P3BALANCEBODY01ICPVAR.JobType,
    //     "ListDate": P3BALANCEBODY01ICPVAR.ListDate,
    //     "Mag": P3BALANCEBODY01ICPVAR.Mag,
    //     "Position": P3BALANCEBODY01ICPVAR.Position,
    //     "ProcessReportName": P3BALANCEBODY01ICPVAR.ProcessReportName,
    //     "ReceiveDate": P3BALANCEBODY01ICPVAR.ReceiveDate,
    //     "RemarkNo": P3BALANCEBODY01ICPVAR.RemarkNo,
    //     "RemarkSend": P3BALANCEBODY01ICPVAR.RemarkSend,
    //     "ReportOrder": P3BALANCEBODY01ICPVAR.ReportOrder,
    //     "ReqDate": P3BALANCEBODY01ICPVAR.ReqDate,
    //     "ReqUser": P3BALANCEBODY01ICPVAR.ReqUser,
    //     "RequestRound": P3BALANCEBODY01ICPVAR.RequestRound,
    //     "RequestSection": P3BALANCEBODY01ICPVAR.RequestSection,
    //     "RequestStatus": P3BALANCEBODY01ICPVAR.RequestStatus,
    //     "SampleCode": P3BALANCEBODY01ICPVAR.SampleCode,
    //     "SampleGroup": P3BALANCEBODY01ICPVAR.SampleGroup,
    //     "SampleName": P3BALANCEBODY01ICPVAR.SampleName,
    //     "SampleNo": P3BALANCEBODY01ICPVAR.SampleNo,
    //     "SampleRemark": P3BALANCEBODY01ICPVAR.SampleRemark,
    //     "SampleStatus": P3BALANCEBODY01ICPVAR.SampleStatus,
    //     "SampleTank": P3BALANCEBODY01ICPVAR.SampleTank,
    //     "SampleType": P3BALANCEBODY01ICPVAR.SampleType,
    //     "SamplingDate": P3BALANCEBODY01ICPVAR.SamplingDate,
    //     "SendDate": P3BALANCEBODY01ICPVAR.SendDate,
    //     "Std1": P3BALANCEBODY01ICPVAR.Std1,
    //     "Std2": P3BALANCEBODY01ICPVAR.Std2,
    //     "Std3": P3BALANCEBODY01ICPVAR.Std3,
    //     "Std4": P3BALANCEBODY01ICPVAR.Std4,
    //     "Std5": P3BALANCEBODY01ICPVAR.Std5,
    //     "Std6": P3BALANCEBODY01ICPVAR.Std6,
    //     "Std7": P3BALANCEBODY01ICPVAR.Std7,
    //     "Std8": P3BALANCEBODY01ICPVAR.Std8,
    //     "Std9": P3BALANCEBODY01ICPVAR.Std9,
    //     "StdFactor": P3BALANCEBODY01ICPVAR.StdFactor,
    //     "StdMax": P3BALANCEBODY01ICPVAR.StdMax,
    //     "StdMaxL": P3BALANCEBODY01ICPVAR.StdMaxL,
    //     "StdMin": P3BALANCEBODY01ICPVAR.StdMin,
    //     "StdMinL": P3BALANCEBODY01ICPVAR.StdMinL,
    //     "StdSymbol": P3BALANCEBODY01ICPVAR.StdSymbol,
    //     "Temp": P3BALANCEBODY01ICPVAR.Temp,
    //     "UserListAnalysis": P3BALANCEBODY01ICPVAR.UserListAnalysis,
    //     "UserReceive": P3BALANCEBODY01ICPVAR.UserReceive,
    //     "UserReject": P3BALANCEBODY01ICPVAR.UserReject,
    //     "UserRequestRecheck": P3BALANCEBODY01ICPVAR.UserRequestRecheck,
    //     "UserSend": P3BALANCEBODY01ICPVAR.UserSend,
    //     //-------------------
    //     "value": "",
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    // }