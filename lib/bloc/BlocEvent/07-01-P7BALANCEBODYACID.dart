import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P7BALANCEBODYACID/P7BALANCEBODYACID.dart';
import '../../page/P7BALANCEBODYACID/P7BALANCEBODYACIDVAR.dart';
import '../../widget/common/popup.dart';
import '../cubit/NotificationEvent.dart';

//-------------------------------------------------

abstract class P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_GET extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_SETDATA extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_CLEARW11 extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_CAL extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_TEMP_SAVE extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_SEND_TO_SAR extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_CLEARROOM extends P7BALANCEBODYACID_Event {}

// class P7BALANCEBODYACID_CLEARW11_ADJ extends P7BALANCEBODYACID_Event {}

class flush extends P7BALANCEBODYACID_Event {}

class P7BALANCEBODYACID_Bloc extends Bloc<P7BALANCEBODYACID_Event, String> {
  P7BALANCEBODYACID_Bloc() : super('') {
    on<P7BALANCEBODYACID_GET>((event, emit) {
      return _P7BALANCEBODYACID_GET('', emit);
    });
    on<P7BALANCEBODYACID_SETDATA>((event, emit) {
      return _P7BALANCEBODYACID_SETDATA('', emit);
    });

    on<P7BALANCEBODYACID_CLEARW11>((event, emit) {
      return _P7BALANCEBODYACID_CLEARW11('', emit);
    });

    on<P7BALANCEBODYACID_CAL>((event, emit) {
      return _P7BALANCEBODYACID_CAL('', emit);
    });

    on<P7BALANCEBODYACID_TEMP_SAVE>((event, emit) {
      return _P7BALANCEBODYACID_TEMP_SAVE('', emit);
    });

    on<P7BALANCEBODYACID_SEND_TO_SAR>((event, emit) {
      return _P7BALANCEBODYACID_SEND_TO_SAR('', emit);
    });

    on<P7BALANCEBODYACID_CLEARROOM>((event, emit) {
      return _P7BALANCEBODYACID_CLEARROOM('', emit);
    });

//_P7BALANCEBODYACID_SEND_TO_SAR
//_P7BALANCEBODYACID_CAL
    // on<P7BALANCEBODYACID_CLEARW11_ADJ>((event, emit) {
    //   return _P7BALANCEBODYACID_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P7BALANCEBODYACID_GET(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P7BALANCEBODYACID_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "TYPE": "07SARBALANCEACID",
        "FUNCTION": "UPDATEDATAWEIGHT",
        "WX": P7BALANCEBODYACIDVAR.WX
      },
    );

    emit(output);
  }

  Future<void> _P7BALANCEBODYACID_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "07SARBALANCEACID",
        "FUNCTION": "DELETEDATAW11",
        "DX": P7BALANCEBODYACIDVAR.DX,
      },
    );

    emit(output);
  }

  Future<void> _P7BALANCEBODYACID_CAL(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "07SARBALANCEACID",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P7BALANCEBODYACIDVAR.D01NOitem,
        "D02NOitem": P7BALANCEBODYACIDVAR.D02NOitem,
        "VOLUME01": P7BALANCEBODYACIDVAR.D01VOLUME,
        "VOLUME02": P7BALANCEBODYACIDVAR.D02VOLUME,
        "Result01": P7BALANCEBODYACIDVAR.Result01,
        "Result02": P7BALANCEBODYACIDVAR.Result02,
        "D01W11_21": P7BALANCEBODYACIDVAR.D01W11_21,
        "D02W11_21": P7BALANCEBODYACIDVAR.D02W11_21,
      },
    );

    emit(output);
  }

  Future<void> _P7BALANCEBODYACID_TEMP_SAVE(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final responseR = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/ACTION_${USERDATA.INSMASTER}',
      data: {
        "IP": webHOOK,
        "USER": USERDATA.NAME,
        "TYPE": "07SARBALANCEACID",
        "FUNCTION": "UPDATEDATAVOLUME",
        "D01NOitem": P7BALANCEBODYACIDVAR.D01NOitem,
        "D02NOitem": P7BALANCEBODYACIDVAR.D02NOitem,
        "VOLUME01": P7BALANCEBODYACIDVAR.D01VOLUME,
        "VOLUME02": P7BALANCEBODYACIDVAR.D02VOLUME,
        "Result01": P7BALANCEBODYACIDVAR.Result01,
        "Result02": P7BALANCEBODYACIDVAR.Result02,
        "D01W11_21": P7BALANCEBODYACIDVAR.D01W11_21,
        "D02W11_21": P7BALANCEBODYACIDVAR.D02W11_21,
      },
    ).then((value) async {
      final response = await Dio().post(
        '${selectBLANCE(USERDATA.Branch)}/TEMPSAVETOSAR_ACID',
        data: {
          "USER": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "REQNO": P7BALANCEBODYACIDVAR.ReqNo,
          "UID": P7BALANCEBODYACIDVAR.UID,
        },
      );
      if (response.statusCode == 200) {
        WORNINGpop(
          P7BALANCEBODYACIDcontext,
          [
            "Temp Save",
            "SUCCESS",
          ],
          100,
          100,
        );
      } else {
        WORNINGpop(
          P7BALANCEBODYACIDcontext,
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

  Future<void> _P7BALANCEBODYACID_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${selectBLANCE(USERDATA.Branch)}/SENDTOSAR_ACID',
      data: {
        "USER": USERDATA.NAME,
        "REQNO": P7BALANCEBODYACIDVAR.ReqNo,
        "UID": P7BALANCEBODYACIDVAR.UID,
      },
    );

    emit(output);
  }

  // Future<void> _P7BALANCEBODYACID_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${selectBLANCE(USERDATA.Branch)}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

  Future<void> _P7BALANCEBODYACID_CLEARROOM(
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
    //     "ReqNo": P7BALANCEBODY01ACIDVAR.REQNO,
    //     "InstrumentName": P7BALANCEBODY01ACIDVAR.InstrumentName,
    //     //-------------------
    //     "Branch": P7BALANCEBODY01ACIDVAR.Branch,
    //     "Code": P7BALANCEBODY01ACIDVAR.Code,
    //     "ControlRange": P7BALANCEBODY01ACIDVAR.ControlRange,
    //     "CustFull": P7BALANCEBODY01ACIDVAR.CustFull,
    //     "CustId": P7BALANCEBODY01ACIDVAR.CustId,
    //     "CustShort": P7BALANCEBODY01ACIDVAR.CustShort,
    //     "DueDate1": P7BALANCEBODY01ACIDVAR.DueDate1,
    //     "Incharge": P7BALANCEBODY01ACIDVAR.Incharge,
    //     "ItemName": P7BALANCEBODY01ACIDVAR.ItemName,
    //     "ItemNo": P7BALANCEBODY01ACIDVAR.ItemNo,
    //     "ItemReportName": P7BALANCEBODY01ACIDVAR.ItemReportName,
    //     "ItemStatus": P7BALANCEBODY01ACIDVAR.ItemStatus,
    //     "JobType": P7BALANCEBODY01ACIDVAR.JobType,
    //     "ListDate": P7BALANCEBODY01ACIDVAR.ListDate,
    //     "Mag": P7BALANCEBODY01ACIDVAR.Mag,
    //     "Position": P7BALANCEBODY01ACIDVAR.Position,
    //     "ProcessReportName": P7BALANCEBODY01ACIDVAR.ProcessReportName,
    //     "ReceiveDate": P7BALANCEBODY01ACIDVAR.ReceiveDate,
    //     "RemarkNo": P7BALANCEBODY01ACIDVAR.RemarkNo,
    //     "RemarkSend": P7BALANCEBODY01ACIDVAR.RemarkSend,
    //     "ReportOrder": P7BALANCEBODY01ACIDVAR.ReportOrder,
    //     "ReqDate": P7BALANCEBODY01ACIDVAR.ReqDate,
    //     "ReqUser": P7BALANCEBODY01ACIDVAR.ReqUser,
    //     "RequestRound": P7BALANCEBODY01ACIDVAR.RequestRound,
    //     "RequestSection": P7BALANCEBODY01ACIDVAR.RequestSection,
    //     "RequestStatus": P7BALANCEBODY01ACIDVAR.RequestStatus,
    //     "SampleCode": P7BALANCEBODY01ACIDVAR.SampleCode,
    //     "SampleGroup": P7BALANCEBODY01ACIDVAR.SampleGroup,
    //     "SampleName": P7BALANCEBODY01ACIDVAR.SampleName,
    //     "SampleNo": P7BALANCEBODY01ACIDVAR.SampleNo,
    //     "SampleRemark": P7BALANCEBODY01ACIDVAR.SampleRemark,
    //     "SampleStatus": P7BALANCEBODY01ACIDVAR.SampleStatus,
    //     "SampleTank": P7BALANCEBODY01ACIDVAR.SampleTank,
    //     "SampleType": P7BALANCEBODY01ACIDVAR.SampleType,
    //     "SamplingDate": P7BALANCEBODY01ACIDVAR.SamplingDate,
    //     "SendDate": P7BALANCEBODY01ACIDVAR.SendDate,
    //     "Std1": P7BALANCEBODY01ACIDVAR.Std1,
    //     "Std2": P7BALANCEBODY01ACIDVAR.Std2,
    //     "Std3": P7BALANCEBODY01ACIDVAR.Std3,
    //     "Std4": P7BALANCEBODY01ACIDVAR.Std4,
    //     "Std5": P7BALANCEBODY01ACIDVAR.Std5,
    //     "Std6": P7BALANCEBODY01ACIDVAR.Std6,
    //     "Std7": P7BALANCEBODY01ACIDVAR.Std7,
    //     "Std8": P7BALANCEBODY01ACIDVAR.Std8,
    //     "Std9": P7BALANCEBODY01ACIDVAR.Std9,
    //     "StdFactor": P7BALANCEBODY01ACIDVAR.StdFactor,
    //     "StdMax": P7BALANCEBODY01ACIDVAR.StdMax,
    //     "StdMaxL": P7BALANCEBODY01ACIDVAR.StdMaxL,
    //     "StdMin": P7BALANCEBODY01ACIDVAR.StdMin,
    //     "StdMinL": P7BALANCEBODY01ACIDVAR.StdMinL,
    //     "StdSymbol": P7BALANCEBODY01ACIDVAR.StdSymbol,
    //     "Temp": P7BALANCEBODY01ACIDVAR.Temp,
    //     "UserListAnalysis": P7BALANCEBODY01ACIDVAR.UserListAnalysis,
    //     "UserReceive": P7BALANCEBODY01ACIDVAR.UserReceive,
    //     "UserReject": P7BALANCEBODY01ACIDVAR.UserReject,
    //     "UserRequestRecheck": P7BALANCEBODY01ACIDVAR.UserRequestRecheck,
    //     "UserSend": P7BALANCEBODY01ACIDVAR.UserSend,
    //     //-------------------
    //     "value": "",
    //   },
    // );

    // if (response.statusCode == 200) {
    //   var databuff = response.data;
    // }