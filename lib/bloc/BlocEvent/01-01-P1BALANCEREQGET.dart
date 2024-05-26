import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../model/model.dart';
import '../../page/P1BALANCEREQ/P1BALANCEREQVAR.dart';
import '../../widget/common/Safty.dart';

//-------------------------------------------------

// String serverLOCAL = 'http://127.0.0.1:15152/';

abstract class P1BALANCEREQGET_Event {}

class GETDATALISTFROMSAR extends P1BALANCEREQGET_Event {}

class GENNEWREQNO extends P1BALANCEREQGET_Event {}
//_GENNEWREQNO

class flush extends P1BALANCEREQGET_Event {}

class P1BALANCEREQGET_Bloc extends Bloc<P1BALANCEREQGET_Event, List<dataset>> {
  P1BALANCEREQGET_Bloc() : super([]) {
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
      // '${serverSARS}/requestbalance',
      // '${serverG}GETLIST/request_BALANCE_ALL',
      '${serverG}GETLIST/requestbalance',
      //requestbalance
      // '${serverLOCAL}GETLIST/request_NV_ALL',
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

      if (databuff.length > 0) {
        for (var i = 0; i < databuff.length; i++) {
          //Metallic Soap Layer (g/m2)
          // print("--<><");
          // print(databuff[i]['ReqNo']);
          // print(databuff[i]['ItemReportName'] != 'Zn-phosphate Layer (g/m2)');
          // print(databuff[i]['ItemReportName']);
          // print("--<><");
          if (databuff[i]['ItemReportName'].toString() !=
                  'Zn-phosphate Layer (g/m2)' &&
              databuff[i]['ItemReportName'].toString() !=
                  'Metallic Soap Layer (g/m2)') {
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
                f70: databuff[i]['ID'] != null
                    ? databuff[i]['ID'].toString()
                    : '',
              ),
            );
          }
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
        "ReqNo": P1BALANCEREQVAR.ReqNo,
        "InstrumentName": P1BALANCEREQVAR.InstrumentName,
        //-------------------

        "Branch": P1BALANCEREQVAR.Branch,
        "Code": P1BALANCEREQVAR.Code,
        "ControlRange": P1BALANCEREQVAR.ControlRange,
        "CustFull": P1BALANCEREQVAR.CustFull,
        "CustId": P1BALANCEREQVAR.CustId,
        "CustShort": P1BALANCEREQVAR.CustShort,
        "DueDate1": P1BALANCEREQVAR.DueDate1,
        "Incharge": P1BALANCEREQVAR.Incharge,
        "ItemName": P1BALANCEREQVAR.ItemName,
        "ItemNo": P1BALANCEREQVAR.ItemNo,
        "ItemReportName": P1BALANCEREQVAR.ItemReportName,
        "ItemStatus": P1BALANCEREQVAR.ItemStatus,
        "JobType": P1BALANCEREQVAR.JobType,
        "ListDate": P1BALANCEREQVAR.ListDate,
        "Mag": P1BALANCEREQVAR.Mag,
        "Position": P1BALANCEREQVAR.Position,
        "ProcessReportName": P1BALANCEREQVAR.ProcessReportName,
        "ReceiveDate": P1BALANCEREQVAR.ReceiveDate,
        "RemarkNo": P1BALANCEREQVAR.RemarkNo,
        "RemarkSend": P1BALANCEREQVAR.RemarkSend,
        "ReportOrder": P1BALANCEREQVAR.ReportOrder,
        "ReqDate": P1BALANCEREQVAR.ReqDate,
        "ReqUser": P1BALANCEREQVAR.ReqUser,
        "RequestRound": P1BALANCEREQVAR.RequestRound,
        "RequestSection": P1BALANCEREQVAR.RequestSection,
        "RequestStatus": P1BALANCEREQVAR.RequestStatus,
        "SampleCode": P1BALANCEREQVAR.SampleCode,
        "SampleGroup": P1BALANCEREQVAR.SampleGroup,
        "SampleName": P1BALANCEREQVAR.SampleName,
        "SampleNo": P1BALANCEREQVAR.SampleNo,
        "SampleRemark": P1BALANCEREQVAR.SampleRemark,
        "SampleStatus": P1BALANCEREQVAR.SampleStatus,
        "SampleTank": P1BALANCEREQVAR.SampleTank,
        "SampleType": P1BALANCEREQVAR.SampleType,
        "SamplingDate": P1BALANCEREQVAR.SamplingDate,
        "SendDate": P1BALANCEREQVAR.SendDate,
        "Std1": P1BALANCEREQVAR.Std1,
        "Std2": P1BALANCEREQVAR.Std2,
        "Std3": P1BALANCEREQVAR.Std3,
        "Std4": P1BALANCEREQVAR.Std4,
        "Std5": P1BALANCEREQVAR.Std5,
        "Std6": P1BALANCEREQVAR.Std6,
        "Std7": P1BALANCEREQVAR.Std7,
        "Std8": P1BALANCEREQVAR.Std8,
        "Std9": P1BALANCEREQVAR.Std9,
        "StdFactor": P1BALANCEREQVAR.StdFactor,
        "StdMax": P1BALANCEREQVAR.StdMax,
        "StdMaxL": P1BALANCEREQVAR.StdMaxL,
        "StdMin": P1BALANCEREQVAR.StdMin,
        "StdMinL": P1BALANCEREQVAR.StdMinL,
        "StdSymbol": P1BALANCEREQVAR.StdSymbol,
        "Temp": P1BALANCEREQVAR.Temp,
        "UserListAnalysis": P1BALANCEREQVAR.UserListAnalysis,
        "UserReceive": P1BALANCEREQVAR.UserReceive,
        "UserReject": P1BALANCEREQVAR.UserReject,
        "UserRequestRecheck": P1BALANCEREQVAR.UserRequestRecheck,
        "UserSend": P1BALANCEREQVAR.UserSend,
        "Operator": USERDATA.NAME,
        "UID": P1BALANCEREQVAR.UID,
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
