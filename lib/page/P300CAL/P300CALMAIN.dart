import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Loading.dart';
import '../P310BP12BALANCE01CAL/P310BP12BALANCE01CALVAR.dart';
import '../P311CAL/P311BP12BALANCE03CALVAR.dart';
import '../page1.dart';
import '../page11.dart';
import '../page21.dart';
import '../page31.dart';
import '../page310.dart';
import '../page311.dart';
import '../page41.dart';
import '../page51.dart';
import '../page56.dart';
import 'P300CALVAR.dart';

late BuildContext P300CALMAINcontext;

class P300CALMAIN extends StatefulWidget {
  P300CALMAIN({
    super.key,
    this.data,
  });
  List<P300BP12BALANCEGETCALDATAclass>? data;

  @override
  State<P300CALMAIN> createState() => _P300CALMAINState();
}

class _P300CALMAINState extends State<P300CALMAIN> {
  @override
  void initState() {
    super.initState();
    getRefreshData();
    // SendData01();
    // SendData03(); // เรียกใช้ async function ที่ดึง API
  }

  Future<void> getRefreshData() async {
    try {
      final response = await Dio().post(
        "${serverNRBP12}GetDataCal",
        data: {
          "DateTime": P300CALVAR.timefornodered,
        },
      );
      print(response.data);
      if (response.statusCode == 200) {
        print("Refesh data");
        setState(() {
          P300CALVAR.BA01 = response.data[0]['BA01'];
          P300CALVAR.BA03 = response.data[0]['BA03'];
        });
      }
    } catch (e) {
      print("Error fetching Refresh data: $e");
    }
  }

  Future<void> SendData03() async {
    try {
      print("Send data");
      final response = await Dio().post(
        "${serverNRBP12}SendDataCal",
        data: {
          "DateTime": P300CALVAR.timefornodered,
          "UserLogin": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "status": P311BP12BALANCE03CALVAR.status,
          "WeightReal": P311BP12BALANCE03CALVAR.inputValue,
          "InstrumentName": P311BP12BALANCE03CALVAR.InstrumentName,
          "Approve_By": P311BP12BALANCE03CALVAR.Approve_By,
          "Password": P311BP12BALANCE03CALVAR.password,
          "averageValue": P311BP12BALANCE03CALVAR.summary1,
          "averageValue1": P311BP12BALANCE03CALVAR.summary2,
          "averageValue2": P311BP12BALANCE03CALVAR.summary3,
          "averageValue3": P311BP12BALANCE03CALVAR.summary4,
          "targetValue": P311BP12BALANCE03CALVAR.targetValue,
          "targetValue1": P311BP12BALANCE03CALVAR.targetValue1,
          "targetValue2": P311BP12BALANCE03CALVAR.targetValue2,
          "targetValue3": P311BP12BALANCE03CALVAR.targetValue3,
          "targetValue4": P311BP12BALANCE03CALVAR.targetValue4,
          "targetValue5": P311BP12BALANCE03CALVAR.targetValue5,
          "targetValue6": P311BP12BALANCE03CALVAR.targetValue6,
          "targetValue7": P311BP12BALANCE03CALVAR.targetValue7,
          "targetValue8": P311BP12BALANCE03CALVAR.targetValue8,
          "targetValue9": P311BP12BALANCE03CALVAR.targetValue9,
          "targetValue10": P311BP12BALANCE03CALVAR.targetValue10,
          "targetValue11": P311BP12BALANCE03CALVAR.targetValue11,
        },
      );
    } catch (e) {
      print("Error fetching Refresh data: $e");
    }
  }

  Future<void> SendData01() async {
    try {
      print("Send data");
      final response = await Dio().post(
        "${serverNRBP12}SendDataCal",
        data: {
          "DateTime": P300CALVAR.timefornodered,
          "UserLogin": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "status": P310BP12BALANCE01CALVAR.status,
          "WeightReal": P310BP12BALANCE01CALVAR.inputValue,
          "InstrumentName": P310BP12BALANCE01CALVAR.InstrumentName,
          "Approve_By": P310BP12BALANCE01CALVAR.Approve_By,
          "Password": P310BP12BALANCE01CALVAR.password,
          "averageValue": P310BP12BALANCE01CALVAR.summary1,
          "averageValue1": P310BP12BALANCE01CALVAR.summary2,
          "averageValue2": P310BP12BALANCE01CALVAR.summary3,
          "averageValue3": P310BP12BALANCE01CALVAR.summary4,
          "targetValue": P310BP12BALANCE01CALVAR.targetValue,
          "targetValue1": P310BP12BALANCE01CALVAR.targetValue1,
          "targetValue2": P310BP12BALANCE01CALVAR.targetValue2,
          "targetValue3": P310BP12BALANCE01CALVAR.targetValue3,
          "targetValue4": P310BP12BALANCE01CALVAR.targetValue4,
          "targetValue5": P310BP12BALANCE01CALVAR.targetValue5,
          "targetValue6": P310BP12BALANCE01CALVAR.targetValue6,
          "targetValue7": P310BP12BALANCE01CALVAR.targetValue7,
          "targetValue8": P310BP12BALANCE01CALVAR.targetValue8,
          "targetValue9": P310BP12BALANCE01CALVAR.targetValue9,
          "targetValue10": P310BP12BALANCE01CALVAR.targetValue10,
          "targetValue11": P310BP12BALANCE01CALVAR.targetValue11,
        },
      );
    } catch (e) {
      print("Error fetching Refresh data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    P300CALMAINcontext = context;
    List<P300BP12BALANCEGETCALDATAclass> _datain = widget.data ?? [];
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: P300CALVAR.BA01.isNotEmpty && P300CALVAR.BA01 == 'OK'
                    ? null
                    : () async {
                        USERDATA.INSMASTER = 'BP12BALANCE01';
                        P310BP12BALANCE01CALVAR.InstrumentName = 'BA01';

                        // รอผลลัพธ์จาก Dialog
                        final result = await showDialog(
                          context: MainBodyContext,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                height: 650,
                                width: 650,
                                child: Page310(),
                              ),
                            );
                          },
                        );
                        print(result);
                        // ถ้าผลลัพธ์เป็น true ให้ Refresh หน้า
                        if (result == true) {
                          await SendData01();
                          await getRefreshData(); // หรือเรียก Bloc ก็ได้
                          setState(() {});
                        }
                      },
                child: Container(
                  color: P300CALVAR.BA01.isNotEmpty && P300CALVAR.BA01 == 'OK'
                      ? Colors.green
                      : Colors.transparent, // เปลี่ยนสีพื้นหลัง
                  child: Row(
                    children: [
                      Container(
                        height: 78,
                        width: 128.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/BP12BA01.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        width: 125,
                        color: Colors.blue,
                        child: const Center(
                          child: Text("T 071-002"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: P300CALVAR.BA03.isNotEmpty && P300CALVAR.BA03 == 'OK'
                    ? null
                    : () async {
                        USERDATA.INSMASTER = 'BP12BALANCE03';
                        P311BP12BALANCE03CALVAR.InstrumentName = 'BA03';

                        // รอผลลัพธ์จาก Dialog
                        final result = await showDialog(
                          context: MainBodyContext,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                height: 650,
                                width: 650,
                                child: Page311(),
                              ),
                            );
                          },
                        );
                        // ถ้าผลลัพธ์เป็น true ให้ Refresh หน้า
                        if (result == true) {
                          await SendData03();
                          await getRefreshData(); // หรือเรียก Bloc ก็ได้
                          setState(() {});
                        }
                      },
                child: Container(
                  color: P300CALVAR.BA03.isNotEmpty && P300CALVAR.BA03 == 'OK'
                      ? Colors.green
                      : Colors.transparent, // เปลี่ยนสีพื้นหลัง
                  child: Row(
                    children: [
                      Container(
                        height: 78,
                        width: 128.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/BP12BA03.jpg"),
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 50,
                        width: 125,
                        color: Colors.blue,
                        child: const Center(
                          child: Text("CTC-BAL-002"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
