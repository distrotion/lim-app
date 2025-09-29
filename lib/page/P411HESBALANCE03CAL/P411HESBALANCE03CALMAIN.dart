import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lim_app/page/P300CAL/P300CALMAIN.dart';
import 'package:lim_app/page/P300CAL/P300CALVAR.dart';
import 'package:lim_app/page/page300.dart';
import 'package:lim_app/widget/common/Advancedropdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../bloc/BlocEvent/311-01-P311SENTDATA.dart';
import '../../bloc/BlocEvent/411-01-P411SENTDATA.dart';
import '../../data/global.dart';
import '../../mainBody.dart';
import '../page310.dart';
import 'P411HESBALANCE03CALVAR.dart';

late BuildContext P411HESBALANCE03CALMAINcontext;
bool Swap = false;

class P411HESBALANCE03CALMAIN extends StatefulWidget {
  P411HESBALANCE03CALMAIN({
    super.key,
    this.data,
  });
  List<P411HESBALANCECALDATAclass>? data;

  @override
  State<P411HESBALANCE03CALMAIN> createState() =>
      _P411HESBALANCE03CALMAINState();
}

class _P411HESBALANCE03CALMAINState extends State<P411HESBALANCE03CALMAIN> {
  bool isInit = true;
  late List<Color> buttonColors; // เก็บสีของปุ่มแต่ละปุ่ม
  int? yellowButtonIndex;
  List<String> buttonValues = List.generate(25, (index) => '');
  int actualIndex = 0;
  bool isPressed = false;
  bool isPressed2 = false;
  Map<int, double> selectedValues = {};
  Map<int, double> selectedValues1 = {};
  Map<int, double> selectedValues2 = {};
  Map<int, double> selectedValues3 = {};
  double calculateAverage() {
    if (selectedValues.isEmpty) return 0.0;
    double sum = selectedValues.values.reduce((a, b) => a + b);
    return sum / selectedValues.length;
  }

  double calculateAverage1() {
    if (selectedValues1.isEmpty) return 0.0;
    double sum = selectedValues1.values.reduce((a, b) => a + b);
    return sum / selectedValues1.length;
  }

  double calculateAverage2() {
    if (selectedValues2.isEmpty) return 0.0;
    double sum = selectedValues2.values.reduce((a, b) => a + b);
    return sum / selectedValues2.length;
  }

  double calculateAverage3() {
    if (selectedValues3.isEmpty) return 0.0;
    double sum = selectedValues3.values.reduce((a, b) => a + b);
    return sum / selectedValues3.length;
  }

  static String preResult = "";
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    buttonColors = List.generate(25, (index) => Colors.blue);
    P411HESBALANCE03CALVAR.summary1 = 0;
    P411HESBALANCE03CALVAR.summary2 = 0;
    P411HESBALANCE03CALVAR.summary3 = 0;
    P411HESBALANCE03CALVAR.summary4 = 0;
    P411HESBALANCE03CALVAR.password = "";
    P411HESBALANCE03CALVAR.button1PressCount = 0;
    P411HESBALANCE03CALVAR.button2PressCount = 0;
    P411HESBALANCE03CALVAR.button3PressCount = 0;
    P411HESBALANCE03CALVAR.button4PressCount = 0;
    P411HESBALANCE03CALVAR.button5PressCount = 0;
    P411HESBALANCE03CALVAR.button6PressCount = 0;
    P411HESBALANCE03CALVAR.button7PressCount = 0;
    P411HESBALANCE03CALVAR.button8PressCount = 0;
    P411HESBALANCE03CALVAR.button9PressCount = 0;
    P411HESBALANCE03CALVAR.button10PressCount = 0;
    P411HESBALANCE03CALVAR.button11PressCount = 0;
    P411HESBALANCE03CALVAR.button12PressCount = 0;
    P411HESBALANCE03CALVAR.button1Color = Colors.blue;
    P411HESBALANCE03CALVAR.button2Color = Colors.blue;
    P411HESBALANCE03CALVAR.button3Color = Colors.blue;
    P411HESBALANCE03CALVAR.button4Color = Colors.blue;
    P411HESBALANCE03CALVAR.button5Color = Colors.blue;
    P411HESBALANCE03CALVAR.button6Color = Colors.blue;
    P411HESBALANCE03CALVAR.button7Color = Colors.blue;
    P411HESBALANCE03CALVAR.button8Color = Colors.blue;
    P411HESBALANCE03CALVAR.button9Color = Colors.blue;
    P411HESBALANCE03CALVAR.button10Color = Colors.blue;
    P411HESBALANCE03CALVAR.button11Color = Colors.blue;
    P411HESBALANCE03CALVAR.button12Color = Colors.blue;
    P411HESBALANCE03CALVAR.button1Color = Colors.blue;
    P411HESBALANCE03CALVAR.button1Color = Colors.blue;
    P411HESBALANCE03CALVAR.button1Text = "";
    P411HESBALANCE03CALVAR.button2Text = "";
    P411HESBALANCE03CALVAR.button3Text = "";
    P411HESBALANCE03CALVAR.button4Text = "";
    P411HESBALANCE03CALVAR.button5Text = "";
    P411HESBALANCE03CALVAR.button6Text = "";
    P411HESBALANCE03CALVAR.button7Text = "";
    P411HESBALANCE03CALVAR.button8Text = "";
    P411HESBALANCE03CALVAR.button9Text = "";
    P411HESBALANCE03CALVAR.button10Text = "";
    P411HESBALANCE03CALVAR.button11Text = "";
    P411HESBALANCE03CALVAR.button12Text = "";
    P411HESBALANCE03CALVAR.Approve_By = "";
    context
        .read<P411HESBALANCECALDATA_Bloc>()
        .add(P411HESBALANCECALDATA_GET4()); // เริ่มต้นปุ่มเป็นสีน้ำเงิน
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.grey, width: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    P411HESBALANCE03CALMAINcontext = context;
    List<P411HESBALANCECALDATAclass> _datain = widget.data ?? [];
    if (isInit) {
      if (_datain.isNotEmpty) {
        if (_datain[0].INSTRUMENT == 'BA03') {
          P411HESBALANCE03CALVAR.button1PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue = _datain[0].G11;
          print(P411HESBALANCE03CALVAR.targetValue);
          if (P411HESBALANCE03CALVAR.targetValue > 0 &&
                  P411HESBALANCE03CALVAR.targetValue < 0.9999 ||
              P411HESBALANCE03CALVAR.targetValue > 0 &&
                  P411HESBALANCE03CALVAR.targetValue > 1.0001) {
            P411HESBALANCE03CALVAR.button1Color = Colors.red;
            P411HESBALANCE03CALVAR.button1Text =
                P411HESBALANCE03CALVAR.targetValue.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue == 0) {
            P411HESBALANCE03CALVAR.button1Color = Colors.blue;
            P411HESBALANCE03CALVAR.button1Text = '';
            P411HESBALANCE03CALVAR.button1PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button1Color = Colors.green;
            P411HESBALANCE03CALVAR.button1Text =
                P411HESBALANCE03CALVAR.targetValue.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button2PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue1 = _datain[0].G12;
          if (P411HESBALANCE03CALVAR.targetValue1 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue1 < 0.9999 ||
              P411HESBALANCE03CALVAR.targetValue1 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue1 > 1.0001) {
            P411HESBALANCE03CALVAR.button2Color = Colors.red;
            P411HESBALANCE03CALVAR.button2Text =
                P411HESBALANCE03CALVAR.targetValue1.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue1 == 0) {
            P411HESBALANCE03CALVAR.button2Color = Colors.blue;
            P411HESBALANCE03CALVAR.button2Text = '';
            P411HESBALANCE03CALVAR.button2PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button2Color = Colors.green;
            P411HESBALANCE03CALVAR.button2Text =
                P411HESBALANCE03CALVAR.targetValue1.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button3PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue2 = _datain[0].G13;
          if (P411HESBALANCE03CALVAR.targetValue2 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue2 < 0.9999 ||
              P411HESBALANCE03CALVAR.targetValue2 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue2 > 1.0001) {
            P411HESBALANCE03CALVAR.button3Color = Colors.red;
            P411HESBALANCE03CALVAR.button3Text =
                P411HESBALANCE03CALVAR.targetValue2.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue2 == 0) {
            P411HESBALANCE03CALVAR.button3Color = Colors.blue;
            P411HESBALANCE03CALVAR.button3Text = '';
            P411HESBALANCE03CALVAR.button3PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button3Color = Colors.green;
            P411HESBALANCE03CALVAR.button3Text =
                P411HESBALANCE03CALVAR.targetValue2.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button4PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue3 = _datain[0].G501;
          if (P411HESBALANCE03CALVAR.targetValue3 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue3 < 49.9997 ||
              P411HESBALANCE03CALVAR.targetValue3 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue3 > 50.0003) {
            P411HESBALANCE03CALVAR.button4Color = Colors.red;
            P411HESBALANCE03CALVAR.button4Text =
                P411HESBALANCE03CALVAR.targetValue3.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue3 == 0) {
            P411HESBALANCE03CALVAR.button4Color = Colors.blue;
            P411HESBALANCE03CALVAR.button4Text = '';
            P411HESBALANCE03CALVAR.button4PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button4Color = Colors.green;
            P411HESBALANCE03CALVAR.button4Text =
                P411HESBALANCE03CALVAR.targetValue3.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button5PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue4 = _datain[0].G502;
          if (P411HESBALANCE03CALVAR.targetValue4 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue4 < 49.9997 ||
              P411HESBALANCE03CALVAR.targetValue4 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue4 > 50.0003) {
            P411HESBALANCE03CALVAR.button5Color = Colors.red;
            P411HESBALANCE03CALVAR.button5Text =
                P411HESBALANCE03CALVAR.targetValue4.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue4 == 0) {
            P411HESBALANCE03CALVAR.button5Color = Colors.blue;
            P411HESBALANCE03CALVAR.button5Text = '';
            P411HESBALANCE03CALVAR.button5PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button5Color = Colors.green;
            P411HESBALANCE03CALVAR.button5Text =
                P411HESBALANCE03CALVAR.targetValue4.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button6PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue5 = _datain[0].G503;
          if (P411HESBALANCE03CALVAR.targetValue5 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue5 < 49.9997 ||
              P411HESBALANCE03CALVAR.targetValue5 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue5 > 50.0003) {
            P411HESBALANCE03CALVAR.button6Color = Colors.red;
            P411HESBALANCE03CALVAR.button6Text =
                P411HESBALANCE03CALVAR.targetValue5.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue5 == 0) {
            P411HESBALANCE03CALVAR.button6Color = Colors.blue;
            P411HESBALANCE03CALVAR.button6Text = '';
            P411HESBALANCE03CALVAR.button6PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button6Color = Colors.green;
            P411HESBALANCE03CALVAR.button6Text =
                P411HESBALANCE03CALVAR.targetValue5.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button7PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue6 = _datain[0].G1001;
          if (P411HESBALANCE03CALVAR.targetValue6 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue6 < 99.9995 ||
              P411HESBALANCE03CALVAR.targetValue6 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue6 > 100.0005) {
            P411HESBALANCE03CALVAR.button7Color = Colors.red;
            P411HESBALANCE03CALVAR.button7Text =
                P411HESBALANCE03CALVAR.targetValue6.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue6 == 0) {
            P411HESBALANCE03CALVAR.button7Color = Colors.blue;
            P411HESBALANCE03CALVAR.button7Text = '';
            P411HESBALANCE03CALVAR.button7PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button7Color = Colors.green;
            P411HESBALANCE03CALVAR.button7Text =
                P411HESBALANCE03CALVAR.targetValue6.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button8PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue7 = _datain[0].G1002;
          if (P411HESBALANCE03CALVAR.targetValue7 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue7 < 99.9995 ||
              P411HESBALANCE03CALVAR.targetValue7 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue7 > 100.0005) {
            P411HESBALANCE03CALVAR.button8Color = Colors.red;
            P411HESBALANCE03CALVAR.button8Text =
                P411HESBALANCE03CALVAR.targetValue7.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue7 == 0) {
            P411HESBALANCE03CALVAR.button8Color = Colors.blue;
            P411HESBALANCE03CALVAR.button8Text = '';
            P411HESBALANCE03CALVAR.button8PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button8Color = Colors.green;
            P411HESBALANCE03CALVAR.button8Text =
                P411HESBALANCE03CALVAR.targetValue7.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button9PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue8 = _datain[0].G1003;
          if (P411HESBALANCE03CALVAR.targetValue8 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue8 < 99.9995 ||
              P411HESBALANCE03CALVAR.targetValue8 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue8 > 100.0005) {
            P411HESBALANCE03CALVAR.button9Color = Colors.red;
            P411HESBALANCE03CALVAR.button9Text =
                P411HESBALANCE03CALVAR.targetValue8.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue8 == 0) {
            P411HESBALANCE03CALVAR.button9Color = Colors.blue;
            P411HESBALANCE03CALVAR.button9Text = '';
            P411HESBALANCE03CALVAR.button9PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button9Color = Colors.green;
            P411HESBALANCE03CALVAR.button9Text =
                P411HESBALANCE03CALVAR.targetValue8.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button10PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue9 = _datain[0].G2001;
          if (P411HESBALANCE03CALVAR.targetValue9 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue9 < 199.9990 ||
              P411HESBALANCE03CALVAR.targetValue9 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue9 > 200.0010) {
            P411HESBALANCE03CALVAR.button10Color = Colors.red;
            P411HESBALANCE03CALVAR.button10Text =
                P411HESBALANCE03CALVAR.targetValue9.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue9 == 0) {
            P411HESBALANCE03CALVAR.button10Color = Colors.blue;
            P411HESBALANCE03CALVAR.button10Text = '';
            P411HESBALANCE03CALVAR.button10PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button10Color = Colors.green;
            P411HESBALANCE03CALVAR.button10Text =
                P411HESBALANCE03CALVAR.targetValue9.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button11PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue10 = _datain[0].G2002;
          if (P411HESBALANCE03CALVAR.targetValue10 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue10 < 199.9990 ||
              P411HESBALANCE03CALVAR.targetValue10 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue10 > 200.0010) {
            P411HESBALANCE03CALVAR.button11Color = Colors.red;
            P411HESBALANCE03CALVAR.button11Text =
                P411HESBALANCE03CALVAR.targetValue10.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue10 == 0) {
            P411HESBALANCE03CALVAR.button11Color = Colors.blue;
            P411HESBALANCE03CALVAR.button11Text = '';
            P411HESBALANCE03CALVAR.button11PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button11Color = Colors.green;
            P411HESBALANCE03CALVAR.button11Text =
                P411HESBALANCE03CALVAR.targetValue10.toStringAsFixed(4);
          }

          P411HESBALANCE03CALVAR.button12PressCount = 2;
          P411HESBALANCE03CALVAR.targetValue11 = _datain[0].G2003;
          if (P411HESBALANCE03CALVAR.targetValue11 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue11 < 199.9990 ||
              P411HESBALANCE03CALVAR.targetValue11 > 0 &&
                  P411HESBALANCE03CALVAR.targetValue11 > 200.0010) {
            P411HESBALANCE03CALVAR.button12Color = Colors.red;
            P411HESBALANCE03CALVAR.button12Text =
                P411HESBALANCE03CALVAR.targetValue11.toStringAsFixed(4);
          } else if (P411HESBALANCE03CALVAR.targetValue11 == 0) {
            P411HESBALANCE03CALVAR.button12Color = Colors.blue;
            P411HESBALANCE03CALVAR.button12Text = '';
            P411HESBALANCE03CALVAR.button12PressCount = 0;
          } else {
            P411HESBALANCE03CALVAR.button12Color = Colors.green;
            P411HESBALANCE03CALVAR.button12Text =
                P411HESBALANCE03CALVAR.targetValue11.toStringAsFixed(4);
          }
        }
      }
    }

    List<String> itemNames = [
      'Weight (g)',
      '1',
      '2',
      '3',
      'Average (g)',
      '1 g', // ช่อง 6
      '', // ช่อง 7
      '', // ช่อง 8
      '', // ช่อง 9
      '50 g',
      '',
      '',
      '',
      '',
      '100 g',
      '',
      '',
      '',
      '',
      '200 g',
      '',
      '',
      '',
      ''
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('CTC-BAL-002'),
        actions: [
          IconButton(
            icon: Icon(Icons.save_as), // ปุ่ม Save
            onPressed: () {
              // 1. ส่ง Event ไปยัง Bloc

              // 2. แสดง Popup Dialog ทันที
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    title: Text("ดำเนินการแล้ว"),
                    content: Text("ถูกบันทึกชั่วคราวแล้ว"),
                    actions: [
                      TextButton(
                        child: Text("OK"),
                        onPressed: () {
                          Navigator.of(dialogContext).pop();
                          context
                              .read<P411HESBALANCECALDATA_Bloc>()
                              .add(P411HESBALANCECALDATA_GET3());
                          // ปิด dialog
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          // IconButton(
          //   icon: Icon(Icons.refresh_rounded), // ปุ่ม Clear
          //   onPressed: () {
          //     // 1. ส่ง Event เคลียร์ข้อมูลชั่วคราว

          //     // 2. แสดง Popup Dialog ยืนยัน
          //     showDialog(
          //       context: context,
          //       builder: (BuildContext dialogContext) {
          //         // ใช้ context ด้านนอก (ที่มี BlocProvider) แทน context ด้านใน dialog
          //         return AlertDialog(
          //           title: Text("ล้างข้อมูลแล้ว"),
          //           content: Text("ล้างข้อมูลบันทึกชั่วคราวเรียบร้อย"),
          //           actions: [
          //             TextButton(
          //               child: Text("OK"),
          //               onPressed: () {
          //                 Navigator.of(dialogContext)
          //                     .pop(); // ปิด dialog ด้วย context ด้านใน
          //                 context
          //                     .read<
          //                         P411HESBALANCECALDATA_Bloc>() // ใช้ context ด้านนอก
          //                     .add(P411HESBALANCECALDATA_GET5());
          //               },
          //             ),
          //           ],
          //         );
          //       },
          //     );
          //   },
          // ),
        ],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    // แถวแรก
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[0])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[1])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[2])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[3])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[4])),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[5])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button2PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button1PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button1PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button1Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button1Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue >=
                                                0 &&
                                            P411HESBALANCE03CALVAR.targetValue <
                                                0.9999) ||
                                        P411HESBALANCE03CALVAR.targetValue >
                                            1.0001) {
                                      P411HESBALANCE03CALVAR.button1Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button1Text =
                                          P411HESBALANCE03CALVAR.targetValue
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button1Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button1Text =
                                          P411HESBALANCE03CALVAR.targetValue
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button1Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button1Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue1 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button2PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button2PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button2Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button2Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue1 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue1 <
                                                0.9999) ||
                                        P411HESBALANCE03CALVAR.targetValue1 >
                                            1.0001) {
                                      P411HESBALANCE03CALVAR.button2Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button2Text =
                                          P411HESBALANCE03CALVAR.targetValue1
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button2Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button2Text =
                                          P411HESBALANCE03CALVAR.targetValue1
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button2Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button2Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue2 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button3PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button3PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button3Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button3Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue2 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue2 <
                                                0.9999) ||
                                        P411HESBALANCE03CALVAR.targetValue2 >
                                            1.0001) {
                                      P411HESBALANCE03CALVAR.button3Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button3Text =
                                          P411HESBALANCE03CALVAR.targetValue2
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button3Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button3Text =
                                          P411HESBALANCE03CALVAR.targetValue2
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button3Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button3Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(
                            child: Builder(
                              builder: (context) {
                                double val1 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button1Text) ??
                                    0;
                                double val2 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button2Text) ??
                                    0;
                                double val3 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button3Text) ??
                                    0;

                                double sum = val1 + val2 + val3;
                                int count = 0;

                                if (val1 != 0) count++;
                                if (val2 != 0) count++;
                                if (val3 != 0) count++;

                                double average = count > 0 ? sum / count : 0;
                                P411HESBALANCE03CALVAR.summary1 = average;

                                return Text(
                                  '${average.toStringAsFixed(4)}',
                                  style: TextStyle(fontSize: 16),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
// -----------------------------------------------------------------------------------------------------
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[9])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue3 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button4PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button4PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button4Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button4Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue3 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue3 <
                                                49.9997) ||
                                        P411HESBALANCE03CALVAR.targetValue3 >
                                            50.0003) {
                                      P411HESBALANCE03CALVAR.button4Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button4Text =
                                          P411HESBALANCE03CALVAR.targetValue3
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button4Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button4Text =
                                          P411HESBALANCE03CALVAR.targetValue3
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button4Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button4Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue4 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button5PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button5PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button5Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button5Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue4 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue4 <
                                                49.9997) ||
                                        P411HESBALANCE03CALVAR.targetValue4 >
                                            50.0003) {
                                      P411HESBALANCE03CALVAR.button5Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button5Text =
                                          P411HESBALANCE03CALVAR.targetValue4
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button5Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button5Text =
                                          P411HESBALANCE03CALVAR.targetValue4
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button5Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button5Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue5 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button6PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button6PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button6Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button6Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue5 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue5 <
                                                49.9997) ||
                                        P411HESBALANCE03CALVAR.targetValue5 >
                                            50.0003) {
                                      P411HESBALANCE03CALVAR.button6Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button6Text =
                                          P411HESBALANCE03CALVAR.targetValue5
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button6Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button6Text =
                                          P411HESBALANCE03CALVAR.targetValue5
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button6Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button6Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(
                            child: Builder(
                              builder: (context) {
                                double val1 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button4Text) ??
                                    0;
                                double val2 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button5Text) ??
                                    0;
                                double val3 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button6Text) ??
                                    0;

                                double sum = val1 + val2 + val3;
                                int count = 0;

                                if (val1 != 0) count++;
                                if (val2 != 0) count++;
                                if (val3 != 0) count++;

                                double average = count > 0 ? sum / count : 0;
                                P411HESBALANCE03CALVAR.summary2 = average;

                                return Text(
                                  '${average.toStringAsFixed(4)}',
                                  style: TextStyle(fontSize: 16),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
// -------------------------------------------------------------------------------------------------------
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[14])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue6 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button7PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button7PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button7Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button7Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue6 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue6 <
                                                99.9995) ||
                                        P411HESBALANCE03CALVAR.targetValue6 >
                                            100.0005) {
                                      P411HESBALANCE03CALVAR.button7Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button7Text =
                                          P411HESBALANCE03CALVAR.targetValue6
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button7Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button7Text =
                                          P411HESBALANCE03CALVAR.targetValue6
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button7Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button7Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue7 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button8PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button8PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button8Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button8Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue7 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue7 <
                                                99.9995) ||
                                        P411HESBALANCE03CALVAR.targetValue7 >
                                            100.0005) {
                                      P411HESBALANCE03CALVAR.button8Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button8Text =
                                          P411HESBALANCE03CALVAR.targetValue7
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button8Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button8Text =
                                          P411HESBALANCE03CALVAR.targetValue7
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button8Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button8Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue8 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button9PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button9PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button9Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button9Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue8 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue8 <
                                                99.9995) ||
                                        P411HESBALANCE03CALVAR.targetValue8 >
                                            100.0005) {
                                      P411HESBALANCE03CALVAR.button9Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button9Text =
                                          P411HESBALANCE03CALVAR.targetValue8
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button9Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button9Text =
                                          P411HESBALANCE03CALVAR.targetValue8
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button9Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button9Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(
                            child: Builder(
                              builder: (context) {
                                double val1 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button7Text) ??
                                    0;
                                double val2 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button8Text) ??
                                    0;
                                double val3 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button9Text) ??
                                    0;

                                double sum = val1 + val2 + val3;
                                int count = 0;

                                if (val1 != 0) count++;
                                if (val2 != 0) count++;
                                if (val3 != 0) count++;

                                double average = count > 0 ? sum / count : 0;
                                P411HESBALANCE03CALVAR.summary3 = average;

                                return Text(
                                  '${average.toStringAsFixed(4)}',
                                  style: TextStyle(fontSize: 16),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
// --------------------------------------------------------------------------------------------------------
                    Row(
                      children: [
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(child: Text(itemNames[19])),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue9 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button10PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button10PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button10Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button10Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue9 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue9 <
                                                199.9990) ||
                                        P411HESBALANCE03CALVAR.targetValue9 >
                                            200.0010) {
                                      P411HESBALANCE03CALVAR.button10Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button10Text =
                                          P411HESBALANCE03CALVAR.targetValue9
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button10Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button10Text =
                                          P411HESBALANCE03CALVAR.targetValue9
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button10Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button10Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button12PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue10 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button11PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button11PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button11Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button11Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue10 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue10 <
                                                199.9990) ||
                                        P411HESBALANCE03CALVAR.targetValue10 >
                                            200.0010) {
                                      P411HESBALANCE03CALVAR.button11Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button11Text =
                                          P411HESBALANCE03CALVAR.targetValue10
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button11Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button11Text =
                                          P411HESBALANCE03CALVAR.targetValue10
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button11Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button11Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: ElevatedButton(
                            onPressed: () async {
                              isInit = false;
                              if (P411HESBALANCE03CALVAR.button1PressCount == 1 ||
                                  P411HESBALANCE03CALVAR.button2PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button3PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button4PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button5PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button6PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button7PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button8PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button9PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button10PressCount ==
                                      1 ||
                                  P411HESBALANCE03CALVAR.button11PressCount ==
                                      1) {
                                return;
                              }
                              final response = await Dio().post(
                                "${serverNRHES}GETVALUE03_HES",
                                data: {},
                              );
                              var input = [];
                              if (response.statusCode == 200) {
                                var databuff = response.data;
                                input = databuff;
                                List<P411HESBALANCECALDATAclass> outputdata =
                                    input.map((data) {
                                  return P411HESBALANCECALDATAclass(
                                    GETVALUE: data['value'],
                                  );
                                }).toList();

                                // ใช้ค่าจาก outputdata ได้ที่นี่
                                setState(() {
                                  P411HESBALANCE03CALVAR
                                      .targetValue11 = outputdata[
                                          0]
                                      .GETVALUE; // <<<<< ใช้จาก outputdata แทน _datain

                                  P411HESBALANCE03CALVAR.button12PressCount++;

                                  if (P411HESBALANCE03CALVAR
                                          .button12PressCount ==
                                      1) {
                                    P411HESBALANCE03CALVAR.button12Color =
                                        Color.fromARGB(255, 235, 211, 0);
                                    P411HESBALANCE03CALVAR.button12Text =
                                        "กรุณาวางลูกตุ้ม";
                                  } else {
                                    if ((P411HESBALANCE03CALVAR.targetValue11 >=
                                                0 &&
                                            P411HESBALANCE03CALVAR
                                                    .targetValue11 <
                                                199.9990) ||
                                        P411HESBALANCE03CALVAR.targetValue11 >
                                            200.0010) {
                                      P411HESBALANCE03CALVAR.button12Color =
                                          Colors.red;
                                      P411HESBALANCE03CALVAR.button12Text =
                                          P411HESBALANCE03CALVAR.targetValue11
                                              .toStringAsFixed(4);
                                    } else {
                                      P411HESBALANCE03CALVAR.button12Color =
                                          Colors.green;
                                      P411HESBALANCE03CALVAR.button12Text =
                                          P411HESBALANCE03CALVAR.targetValue11
                                              .toStringAsFixed(4);
                                    }
                                  }
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  P411HESBALANCE03CALVAR.button12Color,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0),
                              ),
                              padding: EdgeInsets.zero,
                              minimumSize: Size(100, 80),
                            ),
                            child: Text(P411HESBALANCE03CALVAR.button12Text),
                          ),
                        ),
                        Container(
                          width: 100,
                          height: 80,
                          decoration: _boxDecoration(),
                          child: Center(
                            child: Builder(
                              builder: (context) {
                                double val1 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button10Text) ??
                                    0;
                                double val2 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button11Text) ??
                                    0;
                                double val3 = double.tryParse(
                                        P411HESBALANCE03CALVAR.button12Text) ??
                                    0;

                                double sum = val1 + val2 + val3;
                                int count = 0;

                                if (val1 != 0) count++;
                                if (val2 != 0) count++;
                                if (val3 != 0) count++;

                                double average = count > 0 ? sum / count : 0;
                                P411HESBALANCE03CALVAR.summary4 = average;

                                return Text(
                                  '${average.toStringAsFixed(4)}',
                                  style: TextStyle(fontSize: 16),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20),
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Pre-Result",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 30,
                      padding: EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: Text(
                        (P411HESBALANCE03CALVAR.button1PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button2PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button3PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button4PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button5PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button6PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button7PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button8PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button9PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button10PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button11PressCount > 1 &&
                                P411HESBALANCE03CALVAR.button12PressCount > 1)
                            ? 'Finish'
                            : 'Unfinish',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20), // ระยะห่างจากขอบซ้าย
                    SizedBox(
                      width: 100,
                      child: Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isPressed
                            ? Colors.red
                            : Colors.white, // เปลี่ยนสีตามสถานะ
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isPressed = !isPressed;
                            P411HESBALANCE03CALVAR.status = "Reject";
                            if (isPressed2) {
                              isPressed = false;
                              // ปิดปุ่ม Reject ถ้า Approve ถูกกด
                            } // กดแล้วสลับสี
                          });
                        },
                        child: Center(
                          child: Text(
                            'Reject',
                            style: TextStyle(
                              fontSize: 10,
                              color: isPressed
                                  ? Colors.white
                                  : Colors.black, // เปลี่ยนสีตัวอักษร
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 0.8),
                    Container(
                      width: 60,
                      height: 30,
                      decoration: BoxDecoration(
                        color: isPressed2
                            ? Colors.green
                            : Colors.white, // เปลี่ยนสีตามสถานะ
                        borderRadius: BorderRadius.circular(1),
                        border: Border.all(color: Colors.black, width: 1),
                      ),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            isPressed2 = !isPressed2;
                            P411HESBALANCE03CALVAR.status = "Approve";
                            if (isPressed) {
                              isPressed2 = false;
                              // ปิดปุ่ม Reject ถ้า Approve ถูกกด
                            } // กดแล้วสลับสี
                          });
                        },
                        child: Center(
                          child: Text(
                            'Approve',
                            style: TextStyle(
                              fontSize: 10,
                              color: isPressed2
                                  ? Colors.white
                                  : Colors.black, // เปลี่ยนสีตัวอักษร
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(width: 20), // ระยะห่างจากขอบซ้าย
                    // Approve By
                    SizedBox(
                      width: 100,
                      child: Text(
                        'Approve By',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left,
                      ),
                    ),
                    AdvanceDropDown(
                      imgpath: 'assets/icons/icon-down_4@3x.png',
                      listdropdown: const [
                        MapEntry("Natvaree", "Natvaree"),
                        MapEntry("Parkpoom", "Parkpoom"),
                        MapEntry("Vipharat", "Vipharat"),
                        MapEntry("Wannipha", "Wannipha"),
                        MapEntry("Piyawan", "Piyawan"),
                        MapEntry("Sireetorn", "Sireetorn"),
                      ],
                      onChangeinside: (d, k) {
                        setState(() {
                          P411HESBALANCE03CALVAR.Approve_By = d;
                        });
                      },
                      value: P411HESBALANCE03CALVAR.Approve_By,
                      height: 30,
                      width: 120,
                      borderRaio: 1.0,
                    ),
                    SizedBox(width: 20), // เว้นระยะห่าง
                    // Password
                    SizedBox(
                      width: 100,
                      height: 30,
                      child: TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(1),
                            borderSide: BorderSide(color: Colors.black),
                          ),
                        ),
                        style: TextStyle(fontSize: 6),
                        onChanged: (value) {
                          setState(() {
                            P411HESBALANCE03CALVAR.password =
                                value; // อัปเดตตัวแปรเมื่อพิมพ์
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment:
                      MainAxisAlignment.start, // จัดเรียงจากซ้ายไปขวา
                  children: [
                    SizedBox(width: 20), // ระยะห่างจากขอบซ้าย
                    ElevatedButton.icon(
                      onPressed: () async {
                        final response = await Dio().post(
                          "${serverNRHES}CheckPassword_HES",
                          data: {
                            "Approve_By": P411HESBALANCE03CALVAR.Approve_By,
                            "Password": P411HESBALANCE03CALVAR.password,
                          },
                        );

                        var input = [];
                        if (response.statusCode == 200) {
                          var databuff = response.data;
                          input = databuff;
                          List<P411HESBALANCECALDATAclass> outputdata =
                              input.map((data) {
                            return P411HESBALANCECALDATAclass(
                              PASSWORD: data['Password'],
                            );
                          }).toList();

                          if (outputdata.isNotEmpty) {
                            // P310BP12BALANCE01CALVAR.password =
                            //     outputdata[0].PASSWORD;

                            // ตรวจสอบว่าเงื่อนไขการกดปุ่มทั้ง 12 ปุ่มครบหรือไม่
                            if ((P411HESBALANCE03CALVAR.button1PressCount > 1 &&
                                    P411HESBALANCE03CALVAR.button2PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button3PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button4PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button5PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button6PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button7PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button8PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button9PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button10PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button11PressCount >
                                        1 &&
                                    P411HESBALANCE03CALVAR.button12PressCount >
                                        1) ||
                                _datain[0].INSTRUMENT == 'BA03') {
                              // ✅ ป้องกัน _datain index error
                              if (outputdata[0].PASSWORD ==
                                  "Password not correct") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Password ไม่ถูกต้อง"),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(bottom: 10),
                                  ),
                                );
                              } else if (outputdata[0].PASSWORD ==
                                  "Password correct") {
                                print("Save");
                                Navigator.of(P411HESBALANCE03CALMAINcontext)
                                    .pop(true);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("เสร็จสิ้น"),
                                    duration: Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    margin: EdgeInsets.only(bottom: 10),
                                  ),
                                );
                              }
                            }
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    "ไม่ได้รับข้อมูล Password จากเซิร์ฟเวอร์"),
                                duration: Duration(seconds: 2),
                                behavior: SnackBarBehavior.floating,
                                margin: EdgeInsets.only(bottom: 10),
                              ),
                            );
                          }
                        } else {
                          print("ยังไม่ครบเงื่อนไข");
                        }
                      },

                      icon: Icon(Icons.save, color: Colors.white), // ไอคอน Save
                      label: Text(
                        "Save",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // สีปุ่ม
                        foregroundColor: Colors.white, // สีตัวอักษร
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
