import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';
import '../../page/P7BALANCEBODYACID/P7BALANCEBODYACIDVAR.dart';
import '../cubit/POP-searchHistoryChartData.dart';

//-------------------------------------------------

abstract class P7BALANCEBODYACIDgetgraph_Event {}

class P7BALANCEBODYACIDgetgraph_get extends P7BALANCEBODYACIDgetgraph_Event {}

class P7BALANCEBODYACIDgetgraph_flush extends P7BALANCEBODYACIDgetgraph_Event {}

class P7BALANCEBODYACIDgetgraph_Bloc
    extends Bloc<P7BALANCEBODYACIDgetgraph_Event, List<HistoryChartModel>> {
  P7BALANCEBODYACIDgetgraph_Bloc() : super([]) {
    on<P7BALANCEBODYACIDgetgraph_get>((event, emit) {
      return _P7BALANCEBODYACIDgetgraph_get([], emit);
    });
    on<P7BALANCEBODYACIDgetgraph_flush>((event, emit) {
      return _P7BALANCEBODYACIDgetgraph_flush([], emit);
    });
  }
  Future<void> _P7BALANCEBODYACIDgetgraph_get(List<HistoryChartModel> toAdd,
      Emitter<List<HistoryChartModel>> emit) async {
    List<HistoryChartModel> output = [];
    print("----------------------------");
    print(P7BALANCEBODYACIDVAR.UID);
    print(P7BALANCEBODYACIDVAR.ItemName);
    print("----------------------------");
    final response = await Dio().post(
      '${serverSARMAIN}/Widget_SearcHistoryChartData2',
      data: {
        'itemID': P7BALANCEBODYACIDVAR.UID,
        'itemName': P7BALANCEBODYACIDVAR.ItemName,
        'section': "TTC",
        // 'itemID': '967644',
        // 'itemName': 'ACID',
        // 'section': "TTC",
      },
    );

    //     P7BALANCEBODYACIDVAR.mem = '';

    // print(response);

    if (response.statusCode == 200) {
      var databuff = response.data;

      if (databuff.length > 20) {
        for (var i = 0; i < 20; i++) {
          output.add(HistoryChartModel(
            id: databuff[i]["id"] ?? "",
            custFull: databuff[i]["CustFull"] ?? "",
            sampleName: databuff[i]["SampleName"] ?? "",
            samplingDate: databuff[i]["SamplingDate"] ?? "",
            stdMax: databuff[i]["StdMax"] ?? "0",
            stdMin: databuff[i]["StdMin"] ?? "0",
            resultApprove: databuff[i]["ResultApprove"] ?? "",
            resultApproveUnit: databuff[i]["ResultApproveUnit"] ?? "",
            position: databuff[i]["Position"] ?? "",
          ));
        }
      } else {
        for (var i = 0; i < databuff.length; i++) {
          output.add(HistoryChartModel(
            id: databuff[i]["id"] ?? "",
            custFull: databuff[i]["CustFull"] ?? "",
            sampleName: databuff[i]["SampleName"] ?? "",
            samplingDate: databuff[i]["SamplingDate"] ?? "",
            stdMax: databuff[i]["StdMax"] ?? "0",
            stdMin: databuff[i]["StdMin"] ?? "0",
            resultApprove: databuff[i]["ResultApprove"] ?? "",
            resultApproveUnit: databuff[i]["ResultApproveUnit"] ?? "",
            position: databuff[i]["Position"] ?? "",
          ));
        }
      }
    }

    emit(output.reversed.toList());
  }

  Future<void> _P7BALANCEBODYACIDgetgraph_flush(List<HistoryChartModel> toAdd,
      Emitter<List<HistoryChartModel>> emit) async {
    List<HistoryChartModel> output = [];
    emit(output);
  }
}

List<HistoryChartModel> historyChartModelFromJson(String str) =>
    List<HistoryChartModel>.from(
        json.decode(str).map((x) => HistoryChartModel.fromJson(x)));

String historyChartModelToJson(List<HistoryChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class HistoryChartModel {
//   HistoryChartModel({
//     this.id,
//     this.custFull,
//     this.sampleName,
//     this.samplingDate,
//     this.stdMax,
//     this.stdMin,
//     this.resultApprove,
//     this.resultApproveUnit,
//     this.position,
//   });

//   dynamic id;
//   dynamic custFull;
//   dynamic sampleName;
//   dynamic samplingDate;
//   dynamic stdMax;
//   dynamic stdMin;
//   dynamic resultApprove;
//   dynamic resultApproveUnit;
//   dynamic position;

  // factory HistoryChartModel.fromJson(Map<String, dynamic> json) =>
  //     HistoryChartModel(
  //       id: json["id"] ?? "",
  //       custFull: json["CustFull"] ?? "",
  //       sampleName: json["SampleName"] ?? "",
  //       samplingDate: json["SamplingDate"] ?? "",
  //       stdMax: json["StdMax"] ?? "0",
  //       stdMin: json["StdMin"] ?? "0",
  //       resultApprove: json["ResultApprove"] ?? "",
  //       resultApproveUnit: json["ResultApproveUnit"] ?? "",
  //       position: json["Position"] ?? "",
  //     );

  // Map<String, dynamic> toJson() => {
  //       "id": id ?? "",
  //       "CustFull": custFull ?? "",
  //       "SampleName": sampleName ?? "",
  //       "SamplingDate": samplingDate ?? "",
  //       "StdMax": stdMax ?? "",
  //       "StdMin": stdMin ?? "",
  //       "ResultApprove": resultApprove ?? "",
  //       "ResultApproveUnit": resultApproveUnit ?? "",
  //       "Position": position ?? "",
  //     };
// }
