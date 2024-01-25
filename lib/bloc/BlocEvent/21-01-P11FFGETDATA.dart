import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/P21FFREQ/P21FFREQVAR.dart';
import '../../widget/common/Safty.dart';

//-------------------------------------------------

abstract class P21FFREQGET_Event {}

class GETDATALISTFROMSAR extends P21FFREQGET_Event {}

class GENNEWREQNO extends P21FFREQGET_Event {}
//_GENNEWREQNO

class flush extends P21FFREQGET_Event {}

class P21FFREQGET_Bloc extends Bloc<P21FFREQGET_Event, List<dataset>> {
  P21FFREQGET_Bloc() : super([]) {
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
      '${serverG}GETLIST/request_FF_ALL',
      data: {
        // "name": "Khota",
        // "name": "Wannipha",
        // "name": "sangtong",
        "name": USERDATA.NAME,
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
        "ReqNo": P21FFREQVAR.ReqNo,
        "InstrumentName": P21FFREQVAR.InstrumentName,
        //-------------------

        "Branch": P21FFREQVAR.Branch,
        "Code": P21FFREQVAR.Code,
        "ControlRange": P21FFREQVAR.ControlRange,
        "CustFull": P21FFREQVAR.CustFull,
        "CustId": P21FFREQVAR.CustId,
        "CustShort": P21FFREQVAR.CustShort,
        "DueDate1": P21FFREQVAR.DueDate1,
        "Incharge": P21FFREQVAR.Incharge,
        "ItemName": P21FFREQVAR.ItemName,
        "ItemNo": P21FFREQVAR.ItemNo,
        "ItemReportName": P21FFREQVAR.ItemReportName,
        "ItemStatus": P21FFREQVAR.ItemStatus,
        "JobType": P21FFREQVAR.JobType,
        "ListDate": P21FFREQVAR.ListDate,
        "Mag": P21FFREQVAR.Mag,
        "Position": P21FFREQVAR.Position,
        "ProcessReportName": P21FFREQVAR.ProcessReportName,
        "ReceiveDate": P21FFREQVAR.ReceiveDate,
        "RemarkNo": P21FFREQVAR.RemarkNo,
        "RemarkSend": P21FFREQVAR.RemarkSend,
        "ReportOrder": P21FFREQVAR.ReportOrder,
        "ReqDate": P21FFREQVAR.ReqDate,
        "ReqUser": P21FFREQVAR.ReqUser,
        "RequestRound": P21FFREQVAR.RequestRound,
        "RequestSection": P21FFREQVAR.RequestSection,
        "RequestStatus": P21FFREQVAR.RequestStatus,
        "SampleCode": P21FFREQVAR.SampleCode,
        "SampleGroup": P21FFREQVAR.SampleGroup,
        "SampleName": P21FFREQVAR.SampleName,
        "SampleNo": P21FFREQVAR.SampleNo,
        "SampleRemark": P21FFREQVAR.SampleRemark,
        "SampleStatus": P21FFREQVAR.SampleStatus,
        "SampleTank": P21FFREQVAR.SampleTank,
        "SampleType": P21FFREQVAR.SampleType,
        "SamplingDate": P21FFREQVAR.SamplingDate,
        "SendDate": P21FFREQVAR.SendDate,
        "Std1": P21FFREQVAR.Std1,
        "Std2": P21FFREQVAR.Std2,
        "Std3": P21FFREQVAR.Std3,
        "Std4": P21FFREQVAR.Std4,
        "Std5": P21FFREQVAR.Std5,
        "Std6": P21FFREQVAR.Std6,
        "Std7": P21FFREQVAR.Std7,
        "Std8": P21FFREQVAR.Std8,
        "Std9": P21FFREQVAR.Std9,
        "StdFactor": P21FFREQVAR.StdFactor,
        "StdMax": P21FFREQVAR.StdMax,
        "StdMaxL": P21FFREQVAR.StdMaxL,
        "StdMin": P21FFREQVAR.StdMin,
        "StdMinL": P21FFREQVAR.StdMinL,
        "StdSymbol": P21FFREQVAR.StdSymbol,
        "Temp": P21FFREQVAR.Temp,
        "UserListAnalysis": P21FFREQVAR.UserListAnalysis,
        "UserReceive": P21FFREQVAR.UserReceive,
        "UserReject": P21FFREQVAR.UserReject,
        "UserRequestRecheck": P21FFREQVAR.UserRequestRecheck,
        "UserSend": P21FFREQVAR.UserSend,
        "Operator": USERDATA.NAME,
        "UID": P21FFREQVAR.UID,
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
