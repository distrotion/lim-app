import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/P1BALANCEREQ01/P1BALANCEREQ01VAR.dart';

//-------------------------------------------------

abstract class P1BALANCEREQ01GET_Event {}

class GETDATALISTFROMSAR extends P1BALANCEREQ01GET_Event {}

class GENNEWREQNO extends P1BALANCEREQ01GET_Event {}
//_GENNEWREQNO

class flush extends P1BALANCEREQ01GET_Event {}

class P1BALANCEREQ01GET_Bloc
    extends Bloc<P1BALANCEREQ01GET_Event, List<dataset>> {
  P1BALANCEREQ01GET_Bloc() : super([]) {
    on<GETDATALISTFROMSAR>((event, emit) {
      return _GETDATALISTFROMSAR([], emit);
    });
    on<GENNEWREQNO>((event, emit) {
      return _GENNEWREQNO([], emit);
    });
    on<flush>((event, emit) {
      return _flush([], emit);
    });
  }
  Future<void> _GETDATALISTFROMSAR(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      'http://172.23.10.51:5000/requestbalance',
      data: {
        "name": "Khota",
      },
    );

    List<dataset> output = [];
    if (response.statusCode == 200) {
      var databuff = response.data;
      // print(databuff);
      if (databuff.length > 0) {
        for (var i = 0; i < databuff.length; i++) {
          //
          output.add(
            dataset(
              f01: databuff[i]['ReqNo'] != null
                  ? databuff[i]['ReqNo'].toString()
                  : '',
              f02: databuff[i]['InstrumentName'] != null
                  ? databuff[i]['InstrumentName'].toString()
                  : '',
              f03: databuff[i]['CustShort'] != null
                  ? databuff[i]['CustShort'].toString()
                  : '',
              f04: databuff[i]['ItemName'] != null
                  ? databuff[i]['ItemName'].toString()
                  : '',
              f05: databuff[i]['SamplingDate'] != null
                  ? databuff[i]['SamplingDate'].toString()
                  : '',
              f06: databuff[i]['RemarkNo'] != null
                  ? databuff[i]['RemarkNo'].toString()
                  : '',
              f11: databuff[i]['Branch'] != null
                  ? databuff[i]['Branch'].toString()
                  : '',
              f12: databuff[i]['Code'] != null
                  ? databuff[i]['Code'].toString()
                  : '',
              f13: databuff[i]['ControlRange'] != null
                  ? databuff[i]['ControlRange'].toString()
                  : '',
              f14: databuff[i]['CustFull'] != null
                  ? databuff[i]['CustFull'].toString()
                  : '',
              f15: databuff[i]['CustId'] != null
                  ? databuff[i]['CustId'].toString()
                  : '',
              f16: databuff[i]['CustShort'] != null
                  ? databuff[i]['CustShort'].toString()
                  : '',
              f17: databuff[i]['DueDate1'] != null
                  ? databuff[i]['DueDate1'].toString()
                  : '',
              f18: databuff[i]['Incharge'] != null
                  ? databuff[i]['Incharge'].toString()
                  : '',
              f19: databuff[i]['InstrumentName'] != null
                  ? databuff[i]['InstrumentName'].toString()
                  : '',
              f20: databuff[i]['ItemName'] != null
                  ? databuff[i]['ItemName'].toString()
                  : '',
              f21: databuff[i]['ItemNo'] != null
                  ? databuff[i]['ItemNo'].toString()
                  : '',
              f22: databuff[i]['ItemReportName'] != null
                  ? databuff[i]['ItemReportName'].toString()
                  : '',
              f23: databuff[i]['ItemStatus'] != null
                  ? databuff[i]['ItemStatus'].toString()
                  : '',
              f24: databuff[i]['JobType'] != null
                  ? databuff[i]['JobType'].toString()
                  : '',
              f25: databuff[i]['ListDate'] != null
                  ? databuff[i]['ListDate'].toString()
                  : '',
              f26: databuff[i]['Mag'] != null
                  ? databuff[i]['Mag'].toString()
                  : '',
              f27: databuff[i]['Position'] != null
                  ? databuff[i]['Position'].toString()
                  : '',
              f28: databuff[i]['ProcessReportName'] != null
                  ? databuff[i]['ProcessReportName'].toString()
                  : '',
              f29: databuff[i]['ReceiveDate'] != null
                  ? databuff[i]['ReceiveDate'].toString()
                  : '',
              f30: databuff[i]['RemarkNo'] != null
                  ? databuff[i]['RemarkNo'].toString()
                  : '',
              f31: databuff[i]['RemarkSend'] != null
                  ? databuff[i]['RemarkSend'].toString()
                  : '',
              f32: databuff[i]['ReportOrder'] != null
                  ? databuff[i]['ReportOrder'].toString()
                  : '',
              f33: databuff[i]['ReqDate'] != null
                  ? databuff[i]['ReqDate'].toString()
                  : '',
              f34: databuff[i]['ReqNo'] != null
                  ? databuff[i]['ReqNo'].toString()
                  : '',
              f35: databuff[i]['ReqUser'] != null
                  ? databuff[i]['ReqUser'].toString()
                  : '',
              f36: databuff[i]['RequestRound'] != null
                  ? databuff[i]['RequestRound'].toString()
                  : '',
              f37: databuff[i]['RequestSection'] != null
                  ? databuff[i]['RequestSection'].toString()
                  : '',
              f38: databuff[i]['RequestStatus'] != null
                  ? databuff[i]['RequestStatus'].toString()
                  : '',
              f39: databuff[i]['SampleCode'] != null
                  ? databuff[i]['SampleCode'].toString()
                  : '',
              f40: databuff[i]['SampleGroup'] != null
                  ? databuff[i]['SampleGroup'].toString()
                  : '',
              f41: databuff[i]['SampleName'] != null
                  ? databuff[i]['SampleName'].toString()
                  : '',
              f42: databuff[i]['SampleNo'] != null
                  ? databuff[i]['SampleNo'].toString()
                  : '',
              f43: databuff[i]['SampleRemark'] != null
                  ? databuff[i]['SampleRemark'].toString()
                  : '',
              f44: databuff[i]['SampleStatus'] != null
                  ? databuff[i]['SampleStatus'].toString()
                  : '',
              f45: databuff[i]['SampleTank'] != null
                  ? databuff[i]['SampleTank'].toString()
                  : '',
              f46: databuff[i]['SampleType'] != null
                  ? databuff[i]['SampleType'].toString()
                  : '',
              f47: databuff[i]['SamplingDate'] != null
                  ? databuff[i]['SamplingDate'].toString()
                  : '',
              f48: databuff[i]['SendDate'] != null
                  ? databuff[i]['SendDate'].toString()
                  : '',
              f49: databuff[i]['Std1'] != null
                  ? databuff[i]['Std1'].toString()
                  : '',
              f50: databuff[i]['Std2'] != null
                  ? databuff[i]['Std2'].toString()
                  : '',
              f51: databuff[i]['Std3'] != null
                  ? databuff[i]['Std3'].toString()
                  : '',
              f52: databuff[i]['Std4'] != null
                  ? databuff[i]['Std4'].toString()
                  : '',
              f53: databuff[i]['Std5'] != null
                  ? databuff[i]['Std5'].toString()
                  : '',
              f54: databuff[i]['Std6'] != null
                  ? databuff[i]['Std6'].toString()
                  : '',
              f55: databuff[i]['Std7'] != null
                  ? databuff[i]['Std7'].toString()
                  : '',
              f56: databuff[i]['Std8'] != null
                  ? databuff[i]['Std8'].toString()
                  : '',
              f57: databuff[i]['Std9'] != null
                  ? databuff[i]['Std9'].toString()
                  : '',
              f58: databuff[i]['StdFactor'] != null
                  ? databuff[i]['StdFactor'].toString()
                  : '',
              f59: databuff[i]['StdMax'] != null
                  ? databuff[i]['StdMax'].toString()
                  : '',
              f60: databuff[i]['StdMaxL'] != null
                  ? databuff[i]['StdMaxL'].toString()
                  : '',
              f61: databuff[i]['StdMin'] != null
                  ? databuff[i]['StdMin'].toString()
                  : '',
              f62: databuff[i]['StdMinL'] != null
                  ? databuff[i]['StdMinL'].toString()
                  : '',
              f63: databuff[i]['StdSymbol'] != null
                  ? databuff[i]['StdSymbol'].toString()
                  : '',
              f64: databuff[i]['Temp'] != null
                  ? databuff[i]['Temp'].toString()
                  : '',
              f65: databuff[i]['UserListAnalysis'] != null
                  ? databuff[i]['UserListAnalysis'].toString()
                  : '',
              f66: databuff[i]['UserReceive'] != null
                  ? databuff[i]['UserReceive'].toString()
                  : '',
              f67: databuff[i]['UserReject'] != null
                  ? databuff[i]['UserReject'].toString()
                  : '',
              f68: databuff[i]['UserRequestRecheck'] != null
                  ? databuff[i]['UserRequestRecheck'].toString()
                  : '',
              f69: databuff[i]['UserSend'] != null
                  ? databuff[i]['UserSend'].toString()
                  : '',
            ),
          );
        }
      }
    }

    print(output.length);

    emit(output);
  }

  Future<void> _GENNEWREQNO(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      '${serverG}02SARBALANCE01SINGLESHOT/GENREQ',
      data: {
        "ReqNo": P1BALANCEREQ01VAR.ReqNo,
        "InstrumentName": P1BALANCEREQ01VAR.InstrumentName,
        //-------------------
        "Branch": P1BALANCEREQ01VAR.Branch,
        "Code": P1BALANCEREQ01VAR.Code,
        "ControlRange": P1BALANCEREQ01VAR.ControlRange,
        "CustFull": P1BALANCEREQ01VAR.CustFull,
        "CustId": P1BALANCEREQ01VAR.CustId,
        "CustShort": P1BALANCEREQ01VAR.CustShort,
        "DueDate1": P1BALANCEREQ01VAR.DueDate1,
        "Incharge": P1BALANCEREQ01VAR.Incharge,
        "ItemName": P1BALANCEREQ01VAR.ItemName,
        "ItemNo": P1BALANCEREQ01VAR.ItemNo,
        "ItemReportName": P1BALANCEREQ01VAR.ItemReportName,
        "ItemStatus": P1BALANCEREQ01VAR.ItemStatus,
        "JobType": P1BALANCEREQ01VAR.JobType,
        "ListDate": P1BALANCEREQ01VAR.ListDate,
        "Mag": P1BALANCEREQ01VAR.Mag,
        "Position": P1BALANCEREQ01VAR.Position,
        "ProcessReportName": P1BALANCEREQ01VAR.ProcessReportName,
        "ReceiveDate": P1BALANCEREQ01VAR.ReceiveDate,
        "RemarkNo": P1BALANCEREQ01VAR.RemarkNo,
        "RemarkSend": P1BALANCEREQ01VAR.RemarkSend,
        "ReportOrder": P1BALANCEREQ01VAR.ReportOrder,
        "ReqDate": P1BALANCEREQ01VAR.ReqDate,
        "ReqUser": P1BALANCEREQ01VAR.ReqUser,
        "RequestRound": P1BALANCEREQ01VAR.RequestRound,
        "RequestSection": P1BALANCEREQ01VAR.RequestSection,
        "RequestStatus": P1BALANCEREQ01VAR.RequestStatus,
        "SampleCode": P1BALANCEREQ01VAR.SampleCode,
        "SampleGroup": P1BALANCEREQ01VAR.SampleGroup,
        "SampleName": P1BALANCEREQ01VAR.SampleName,
        "SampleNo": P1BALANCEREQ01VAR.SampleNo,
        "SampleRemark": P1BALANCEREQ01VAR.SampleRemark,
        "SampleStatus": P1BALANCEREQ01VAR.SampleStatus,
        "SampleTank": P1BALANCEREQ01VAR.SampleTank,
        "SampleType": P1BALANCEREQ01VAR.SampleType,
        "SamplingDate": P1BALANCEREQ01VAR.SamplingDate,
        "SendDate": P1BALANCEREQ01VAR.SendDate,
        "Std1": P1BALANCEREQ01VAR.Std1,
        "Std2": P1BALANCEREQ01VAR.Std2,
        "Std3": P1BALANCEREQ01VAR.Std3,
        "Std4": P1BALANCEREQ01VAR.Std4,
        "Std5": P1BALANCEREQ01VAR.Std5,
        "Std6": P1BALANCEREQ01VAR.Std6,
        "Std7": P1BALANCEREQ01VAR.Std7,
        "Std8": P1BALANCEREQ01VAR.Std8,
        "Std9": P1BALANCEREQ01VAR.Std9,
        "StdFactor": P1BALANCEREQ01VAR.StdFactor,
        "StdMax": P1BALANCEREQ01VAR.StdMax,
        "StdMaxL": P1BALANCEREQ01VAR.StdMaxL,
        "StdMin": P1BALANCEREQ01VAR.StdMin,
        "StdMinL": P1BALANCEREQ01VAR.StdMinL,
        "StdSymbol": P1BALANCEREQ01VAR.StdSymbol,
        "Temp": P1BALANCEREQ01VAR.Temp,
        "UserListAnalysis": P1BALANCEREQ01VAR.UserListAnalysis,
        "UserReceive": P1BALANCEREQ01VAR.UserReceive,
        "UserReject": P1BALANCEREQ01VAR.UserReject,
        "UserRequestRecheck": P1BALANCEREQ01VAR.UserRequestRecheck,
        "UserSend": P1BALANCEREQ01VAR.UserSend,
        "Operator": USERDATA.NAME,
      },
    );

    if (response.statusCode == 200) {
      var databuff = response.data;
    }
    emit([]);
  }

  Future<void> _flush(List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    emit([]);
  }
}
