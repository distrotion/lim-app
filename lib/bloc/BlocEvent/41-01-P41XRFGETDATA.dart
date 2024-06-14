import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';

import '../../page/P41XRFREQ/P41XRFREQVAR.dart';
import '../../widget/common/Safty.dart';

//-------------------------------------------------

abstract class P41XRFREQGET_Event {}

class GETDATALISTFROMSAR extends P41XRFREQGET_Event {}

class GENNEWREQNO extends P41XRFREQGET_Event {}
//_GENNEWREQNO

class flush extends P41XRFREQGET_Event {}

class P41XRFREQGET_Bloc extends Bloc<P41XRFREQGET_Event, List<dataset>> {
  P41XRFREQGET_Bloc() : super([]) {
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
      '${serverG}GETLIST/request_XRF_USER',
      data: {
        // "name": "Khota",
        // "name": "Wannipha",
        // "name": "sangtong",
        "name": USERDATA.NAME,
      },
    );

    print("----------------");

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
              f06: int.parse(ConverstStr(databuff[i]['RemarkNo'] != null
                  ? databuff[i]['RemarkNo'].toString()
                  : '')),
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
              f70:
                  databuff[i]['ID'] != null ? databuff[i]['ID'].toString() : '',
              f71: databuff[i]['UserRequestRecheck'] != null
                  ? databuff[i]['UserRequestRecheck'].toString()
                  : '',
            ),
          );
        }
      }
    }

    print(output.length);

    List<dataset> outset = output..sort((a, b) => a.f06.compareTo(b.f06));

    emit(outset);
  }

  Future<void> _GENNEWREQNO(
      List<dataset> toAdd, Emitter<List<dataset>> emit) async {
    final response = await Dio().post(
      '${serverG}02SARBALANCE01SINGLESHOT/GENREQ',
      data: {
        "ReqNo": P41XRFREQVAR.ReqNo,
        "InstrumentName": P41XRFREQVAR.InstrumentName,
        //-------------------

        "Branch": P41XRFREQVAR.Branch,
        "Code": P41XRFREQVAR.Code,
        "ControlRange": P41XRFREQVAR.ControlRange,
        "CustFull": P41XRFREQVAR.CustFull,
        "CustId": P41XRFREQVAR.CustId,
        "CustShort": P41XRFREQVAR.CustShort,
        "DueDate1": P41XRFREQVAR.DueDate1,
        "Incharge": P41XRFREQVAR.Incharge,
        "ItemName": P41XRFREQVAR.ItemName,
        "ItemNo": P41XRFREQVAR.ItemNo,
        "ItemReportName": P41XRFREQVAR.ItemReportName,
        "ItemStatus": P41XRFREQVAR.ItemStatus,
        "JobType": P41XRFREQVAR.JobType,
        "ListDate": P41XRFREQVAR.ListDate,
        "Mag": P41XRFREQVAR.Mag,
        "Position": P41XRFREQVAR.Position,
        "ProcessReportName": P41XRFREQVAR.ProcessReportName,
        "ReceiveDate": P41XRFREQVAR.ReceiveDate,
        "RemarkNo": P41XRFREQVAR.RemarkNo,
        "RemarkSend": P41XRFREQVAR.RemarkSend,
        "ReportOrder": P41XRFREQVAR.ReportOrder,
        "ReqDate": P41XRFREQVAR.ReqDate,
        "ReqUser": P41XRFREQVAR.ReqUser,
        "RequestRound": P41XRFREQVAR.RequestRound,
        "RequestSection": P41XRFREQVAR.RequestSection,
        "RequestStatus": P41XRFREQVAR.RequestStatus,
        "SampleCode": P41XRFREQVAR.SampleCode,
        "SampleGroup": P41XRFREQVAR.SampleGroup,
        "SampleName": P41XRFREQVAR.SampleName,
        "SampleNo": P41XRFREQVAR.SampleNo,
        "SampleRemark": P41XRFREQVAR.SampleRemark,
        "SampleStatus": P41XRFREQVAR.SampleStatus,
        "SampleTank": P41XRFREQVAR.SampleTank,
        "SampleType": P41XRFREQVAR.SampleType,
        "SamplingDate": P41XRFREQVAR.SamplingDate,
        "SendDate": P41XRFREQVAR.SendDate,
        "Std1": P41XRFREQVAR.Std1,
        "Std2": P41XRFREQVAR.Std2,
        "Std3": P41XRFREQVAR.Std3,
        "Std4": P41XRFREQVAR.Std4,
        "Std5": P41XRFREQVAR.Std5,
        "Std6": P41XRFREQVAR.Std6,
        "Std7": P41XRFREQVAR.Std7,
        "Std8": P41XRFREQVAR.Std8,
        "Std9": P41XRFREQVAR.Std9,
        "StdFactor": P41XRFREQVAR.StdFactor,
        "StdMax": P41XRFREQVAR.StdMax,
        "StdMaxL": P41XRFREQVAR.StdMaxL,
        "StdMin": P41XRFREQVAR.StdMin,
        "StdMinL": P41XRFREQVAR.StdMinL,
        "StdSymbol": P41XRFREQVAR.StdSymbol,
        "Temp": P41XRFREQVAR.Temp,
        "UserListAnalysis": P41XRFREQVAR.UserListAnalysis,
        "UserReceive": P41XRFREQVAR.UserReceive,
        "UserReject": P41XRFREQVAR.UserReject,
        "UserRequestRecheck": P41XRFREQVAR.UserRequestRecheck,
        "UserSend": P41XRFREQVAR.UserSend,
        "Operator": USERDATA.NAME,
        "UID": P41XRFREQVAR.UID,
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
