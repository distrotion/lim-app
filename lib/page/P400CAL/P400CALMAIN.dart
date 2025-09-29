import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/BlocEvent/300-01-P300GETDATA.dart';
import '../../bloc/BlocEvent/310-01-P310SENTDATA.dart';
import '../../bloc/BlocEvent/400-01-P400GETDATA.dart';
import '../../bloc/BlocEvent/ChangePageEvent.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../../widget/common/Loading.dart';
import '../P410HESBALANCE02CAL/P410HESBALANCE02CALVAR.dart';
import '../P411HESBALANCE03CAL/P411HESBALANCE03CALVAR.dart';
import '../page1.dart';
import '../page11.dart';
import '../page21.dart';
import '../page31.dart';
import '../page310.dart';
import '../page311.dart';
import '../page41.dart';
import '../page410.dart';
import '../page411.dart';
import '../page51.dart';
import '../page56.dart';
import 'P400CALVAR.dart';

late BuildContext P400CALMAINcontext;

class P400CALMAIN extends StatefulWidget {
  P400CALMAIN({
    super.key,
    this.data,
  });
  List<P400HESBALANCEGETCALDATAclass>? data;

  @override
  State<P400CALMAIN> createState() => _P400CALMAINState();
}

class _P400CALMAINState extends State<P400CALMAIN> {
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
        "${serverNRHES}GetDataCal_HES",
        data: {
          "DateTime": P400CALVAR.timefornodered,
        },
      );
      print(response.data);
      if (response.statusCode == 200) {
        print("Refesh data");
        setState(() {
          P400CALVAR.BA02 = response.data[0]['BA02'];
          P400CALVAR.BA03 = response.data[0]['BA03'];
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
        "${serverNRHES}SendDataCal_HES",
        data: {
          "DateTime": P400CALVAR.timefornodered,
          "UserLogin": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "status": P411HESBALANCE03CALVAR.status,
          "WeightReal": P411HESBALANCE03CALVAR.inputValue,
          "InstrumentName": P411HESBALANCE03CALVAR.InstrumentName,
          "Approve_By": P411HESBALANCE03CALVAR.Approve_By,
          "Password": P411HESBALANCE03CALVAR.password,
          "averageValue": P411HESBALANCE03CALVAR.summary1,
          "averageValue1": P411HESBALANCE03CALVAR.summary2,
          "averageValue2": P411HESBALANCE03CALVAR.summary3,
          "averageValue3": P411HESBALANCE03CALVAR.summary4,
          "targetValue": P411HESBALANCE03CALVAR.targetValue,
          "targetValue1": P411HESBALANCE03CALVAR.targetValue1,
          "targetValue2": P411HESBALANCE03CALVAR.targetValue2,
          "targetValue3": P411HESBALANCE03CALVAR.targetValue3,
          "targetValue4": P411HESBALANCE03CALVAR.targetValue4,
          "targetValue5": P411HESBALANCE03CALVAR.targetValue5,
          "targetValue6": P411HESBALANCE03CALVAR.targetValue6,
          "targetValue7": P411HESBALANCE03CALVAR.targetValue7,
          "targetValue8": P411HESBALANCE03CALVAR.targetValue8,
          "targetValue9": P411HESBALANCE03CALVAR.targetValue9,
          "targetValue10": P411HESBALANCE03CALVAR.targetValue10,
          "targetValue11": P411HESBALANCE03CALVAR.targetValue11,
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
        "${serverNRHES}SendDataCal_HES",
        data: {
          "DateTime": P400CALVAR.timefornodered,
          "UserLogin": USERDATA.NAME,
          "Branch": USERDATA.Branch,
          "status": P410HESBALANCE02CALVAR.status,
          "WeightReal": P410HESBALANCE02CALVAR.inputValue,
          "InstrumentName": P410HESBALANCE02CALVAR.InstrumentName,
          "Approve_By": P410HESBALANCE02CALVAR.Approve_By,
          "Password": P410HESBALANCE02CALVAR.password,
          "averageValue": P410HESBALANCE02CALVAR.summary1,
          "averageValue1": P410HESBALANCE02CALVAR.summary2,
          "averageValue2": P410HESBALANCE02CALVAR.summary3,
          "averageValue3": P410HESBALANCE02CALVAR.summary4,
          "targetValue": P410HESBALANCE02CALVAR.targetValue,
          "targetValue1": P410HESBALANCE02CALVAR.targetValue1,
          "targetValue2": P410HESBALANCE02CALVAR.targetValue2,
          "targetValue3": P410HESBALANCE02CALVAR.targetValue3,
          "targetValue4": P410HESBALANCE02CALVAR.targetValue4,
          "targetValue5": P410HESBALANCE02CALVAR.targetValue5,
          "targetValue6": P410HESBALANCE02CALVAR.targetValue6,
          "targetValue7": P410HESBALANCE02CALVAR.targetValue7,
          "targetValue8": P410HESBALANCE02CALVAR.targetValue8,
          "targetValue9": P410HESBALANCE02CALVAR.targetValue9,
          "targetValue10": P410HESBALANCE02CALVAR.targetValue10,
          "targetValue11": P410HESBALANCE02CALVAR.targetValue11,
        },
      );
    } catch (e) {
      print("Error fetching Refresh data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    P400CALMAINcontext = context;
    List<P400HESBALANCEGETCALDATAclass> _datain = widget.data ?? [];
    return Row(
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: P400CALVAR.BA02.isNotEmpty && P400CALVAR.BA02 == 'OK'
                    ? null
                    : () async {
                        USERDATA.INSMASTER = 'HESBALANCE02';
                        P410HESBALANCE02CALVAR.InstrumentName = 'BA02';

                        // รอผลลัพธ์จาก Dialog
                        final result = await showDialog(
                          context: MainBodyContext,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                height: 650,
                                width: 650,
                                child: Page410(),
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
                  color: P400CALVAR.BA02.isNotEmpty && P400CALVAR.BA02 == 'OK'
                      ? Colors.green
                      : Colors.transparent, // เปลี่ยนสีพื้นหลัง
                  child: Row(
                    children: [
                      Container(
                        height: 78,
                        width: 128.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/HESBA02.jpg"),
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
                          child: Text("HESBALANCE02"),
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
                onTap: P400CALVAR.BA03.isNotEmpty && P400CALVAR.BA03 == 'OK'
                    ? null
                    : () async {
                        USERDATA.INSMASTER = 'HESBALANCE03';
                        P411HESBALANCE03CALVAR.InstrumentName = 'BA03';

                        // รอผลลัพธ์จาก Dialog
                        final result = await showDialog(
                          context: MainBodyContext,
                          builder: (BuildContext context) {
                            return Dialog(
                              child: SizedBox(
                                height: 650,
                                width: 650,
                                child: Page411(),
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
                  color: P400CALVAR.BA03.isNotEmpty && P400CALVAR.BA03 == 'OK'
                      ? Colors.green
                      : Colors.transparent, // เปลี่ยนสีพื้นหลัง
                  child: Row(
                    children: [
                      Container(
                        height: 78,
                        width: 128.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/HESBA03.jpg"),
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
                          child: Text("HESBALANCE03"),
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
