import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/global.dart';

class searchHistoryChartData_Cubit extends Cubit<List<HistoryChartModel>> {
  /// {@macro brightness_cubit}
  searchHistoryChartData_Cubit() : super([]);

  /// Toggles the current brightness between light and dark.
  Future<void> searchHistoryChartDataCubit(String itemID, String itemName,
      String section, String max, String min) async {
    List<HistoryChartModel> output = [];
    List<HistoryChartModel> historyChartData = [];
    Map<String, String> qParams = {
      'itemID': itemID,
      'itemName': itemName,
      'section': section,
    };
    final response = await http.post(
        Uri.parse("${serverSARMAIN}/Widget_SearcHistoryChartData2"),
        body: qParams);
    if (response.statusCode == 200) {
      //print("respone");
      List<HistoryChartModel> buffer = [];

      buffer = historyChartModelFromJson(response.body);

      //find mean data
      try {
        for (int i = 0; i < buffer.length; i++) {
          double dataSum = 0;
          int dataCount = 1;
          if (i + 1 < buffer.length) {
            for (int j = i; j < buffer.length; j) {
              if (j + 1 < buffer.length) {
                if (buffer[j].samplingDate == buffer[j + 1].samplingDate) {
                  if (dataCount == 1) {
                    dataSum = double.parse(buffer[j].resultApprove) +
                        double.parse(buffer[j + 1].resultApprove);
                  } else {
                    dataSum =
                        dataSum + double.parse(buffer[j + 1].resultApprove);
                  }
                  dataCount++;
                  buffer.removeAt(j + 1);
                } else if (dataCount != 1) {
                  /* print(("1 : " + dataSum.toString()));
                print(("2: " + dataCount.toString()));
                print("3 : " + (dataSum / dataCount).toString()); */
                  buffer[j].resultApprove =
                      (dataSum / dataCount).toStringAsFixed(2);
                  /* print("4 :" + buffer[j].resultApprove); */
                  i = j;
                  break;
                } else {
                  i = j;
                  break;
                }
              } else {
                if (dataCount != 1) {
                  buffer[j].resultApprove =
                      (dataSum / dataCount).toStringAsFixed(2);
                }
                i = j;
                break;
              }
            }
          }
        }
      } on Exception catch (e) {
        print(e);
      }

      if (buffer.length > 10) {
        buffer.removeRange(10, buffer.length);
      }
      historyChartData = buffer.reversed.toList();

      if (historyChartData.length == 0) {
        String buff_min = "0";
        String buff_max = "0";
        try {
          if (double.parse(min) >= 0) {
            buff_min = min;
          }
        } on Exception catch (e) {
          buff_min = "0";
        }
        try {
          if (double.parse(max) >= 0) {
            buff_max = max;
          }
        } on Exception catch (e) {
          buff_max = "0";
        }
        historyChartData.add(HistoryChartModel(
            samplingDate: "0",
            resultApprove: "0",
            resultApproveUnit: "0",
            stdMax: buff_max,
            stdMin: buff_min));
      } else {
        for (int i = 0; i < historyChartData.length; i++) {
          try {
            if (double.parse(historyChartData[i].stdMax) >= 0) {}
          } on Exception catch (e) {
            historyChartData[i].stdMax = "0";
          }
          try {
            if (double.parse(historyChartData[i].stdMin) >= 0) {}
          } on Exception catch (e) {
            historyChartData[i].stdMin = "0";
          }
        }
      }
    } else {
      print("where is my server");
    }
    output = historyChartData;
    emit(output);
  }

  Future<void> Flush(String input) async {
    List<HistoryChartModel> output = [];
    emit(output);
  }
}

List<HistoryChartModel> historyChartModelFromJson(String str) =>
    List<HistoryChartModel>.from(
        json.decode(str).map((x) => HistoryChartModel.fromJson(x)));

String historyChartModelToJson(List<HistoryChartModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HistoryChartModel {
  HistoryChartModel({
    this.id,
    this.custFull,
    this.sampleName,
    this.samplingDate,
    this.stdMax,
    this.stdMin,
    this.resultApprove,
    this.resultApproveUnit,
    this.position,
  });

  dynamic id;
  dynamic custFull;
  dynamic sampleName;
  dynamic samplingDate;
  dynamic stdMax;
  dynamic stdMin;
  dynamic resultApprove;
  dynamic resultApproveUnit;
  dynamic position;

  factory HistoryChartModel.fromJson(Map<String, dynamic> json) =>
      HistoryChartModel(
        id: json["id"] ?? "",
        custFull: json["CustFull"] ?? "",
        sampleName: json["SampleName"] ?? "",
        samplingDate: json["SamplingDate"] ?? "",
        stdMax: json["StdMax"] ?? "0",
        stdMin: json["StdMin"] ?? "0",
        resultApprove: json["ResultApprove"] ?? "",
        resultApproveUnit: json["ResultApproveUnit"] ?? "",
        position: json["Position"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id ?? "",
        "CustFull": custFull ?? "",
        "SampleName": sampleName ?? "",
        "SamplingDate": samplingDate ?? "",
        "StdMax": stdMax ?? "",
        "StdMin": stdMin ?? "",
        "ResultApprove": resultApprove ?? "",
        "ResultApproveUnit": resultApproveUnit ?? "",
        "Position": position ?? "",
      };
}
