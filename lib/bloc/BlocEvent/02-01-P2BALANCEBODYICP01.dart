import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P2BALANCEBODYCW01/P2BALANCEBODY01CWVAR.dart';

//-------------------------------------------------

abstract class P2BALANCEBODYCW01_Event {}

class P2BALANCEBODYCW01_GET extends P2BALANCEBODYCW01_Event {}

class P2BALANCEBODYCW01_SETDATA extends P2BALANCEBODYCW01_Event {}

class P2BALANCEBODYCW01_CLEARW11 extends P2BALANCEBODYCW01_Event {}

class P2BALANCEBODYCW01_CAL extends P2BALANCEBODYCW01_Event {}

class P2BALANCEBODYCW01_SEND_TO_SAR extends P2BALANCEBODYCW01_Event {}

// class P2BALANCEBODYCW01_CLEARW11_ADJ extends P2BALANCEBODYCW01_Event {}

class flush extends P2BALANCEBODYCW01_Event {}

class P2BALANCEBODYCW01_Bloc extends Bloc<P2BALANCEBODYCW01_Event, String> {
  P2BALANCEBODYCW01_Bloc() : super('') {
    on<P2BALANCEBODYCW01_GET>((event, emit) {
      return _P2BALANCEBODYCW01_GET('', emit);
    });
    on<P2BALANCEBODYCW01_SETDATA>((event, emit) {
      return _P2BALANCEBODYCW01_SETDATA('', emit);
    });

    on<P2BALANCEBODYCW01_CLEARW11>((event, emit) {
      return _P2BALANCEBODYCW01_CLEARW11('', emit);
    });

    on<P2BALANCEBODYCW01_CAL>((event, emit) {
      return _P2BALANCEBODYCW01_CAL('', emit);
    });
    on<P2BALANCEBODYCW01_SEND_TO_SAR>((event, emit) {
      return _P2BALANCEBODYCW01_SEND_TO_SAR('', emit);
    });

//_P2BALANCEBODYCW01_SEND_TO_SAR
//_P2BALANCEBODYCW01_CAL
    // on<P2BALANCEBODYCW01_CLEARW11_ADJ>((event, emit) {
    //   return _P2BALANCEBODYCW01_CLEARW11_ADJ('', emit);
    // });

    on<flush>((event, emit) {
      return _flush('', emit);
    });
  }
  Future<void> _P2BALANCEBODYCW01_GET(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    emit(output);
  }

  Future<void> _P2BALANCEBODYCW01_SETDATA(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${serverN}/balance01UPDATEDATA_C',
      data: {},
    );

    emit(output);
  }

  Future<void> _P2BALANCEBODYCW01_CLEARW11(
      String toAdd, Emitter<String> emit) async {
    String output = '';

    final response = await Dio().post(
      '${serverN}/balance01CLEARDATA_C',
      data: {},
    );

    emit(output);
  }

  Future<void> _P2BALANCEBODYCW01_CAL(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final response = await Dio().post(
      '${serverN}/balance01ARER',
      data: {
        "AREA": P2BALANCEBODY01CWVAR.area,
        "NOitem": P2BALANCEBODY01CWVAR.NOitem,
      },
    );

    emit(output);
  }

  Future<void> _P2BALANCEBODYCW01_SEND_TO_SAR(
      String toAdd, Emitter<String> emit) async {
    String output = '';
    print("------------>");
    final response = await Dio().post(
      '${serverN}/balance01SENDTOSAR',
      data: {
        "AREA": P2BALANCEBODY01CWVAR.area,
        "USER": USERDATA.NAME,
        "NOitem": P2BALANCEBODY01CWVAR.NOitem,
      },
    );

    emit(output);
  }

  // Future<void> _P2BALANCEBODYCW01_CLEARW11_ADJ(
  //     String toAdd, Emitter<String> emit) async {
  //   String output = '';

  //   final response = await Dio().post(
  //     '${serverN}/balance01CLEARDATA_ADJ',
  //     data: {},
  //   );

  //   emit(output);
  // }

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