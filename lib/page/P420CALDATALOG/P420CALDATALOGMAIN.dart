import 'dart:io';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import '../../bloc/BlocEvent/320-01-P320GETDATA.dart';
import '../../bloc/BlocEvent/420-01-P420GETDATA.dart';
import '../../widget/common/Advancedropdown.dart';
import 'P420CALDATALOGVAR.dart';
import 'dart:html' as html;

class P420CALDATALOGMAIN extends StatefulWidget {
  P420CALDATALOGMAIN({super.key, this.data});
  List<P420HESBALANCEDATALOGclass>? data;

  @override
  State<P420CALDATALOGMAIN> createState() => _P420CALDATALOGMAINState();
}

List<List<String>> myData = [
  [
    'DateTime',
    'Cal_1g_No1',
    'Cal_1g_No2',
    'Cal_1g_No3',
    'Cal_1g_Average',
    'Cal_50g_No1',
    'Cal_50g_No2',
    'Cal_50g_No3',
    'Cal_50g_Average',
    'Cal_100g_No1',
    'Cal_100g_No2',
    'Cal_100g_No3',
    'Cal_100g_Average',
    'Cal_200g_No1',
    'Cal_200g_No2',
    'Cal_200g_No3',
    'Cal_200g_Average',
    'Check_By',
    'Approve_By'
  ]
];

final List<String> headers = [
  'DateTime',
  'Cal_1g_No1',
  'Cal_1g_No2',
  'Cal_1g_No3',
  'Cal_1g_Average',
  'Cal_50g_No1',
  'Cal_50g_No2',
  'Cal_50g_No3',
  'Cal_50g_Average',
  'Cal_100g_No1',
  'Cal_100g_No2',
  'Cal_100g_No3',
  'Cal_100g_Average',
  'Cal_200g_No1',
  'Cal_200g_No2',
  'Cal_200g_No3',
  'Cal_200g_Average',
  'Check_By',
  'Approve_By'
];

class _P420CALDATALOGMAINState extends State<P420CALDATALOGMAIN> {
  @override
  Widget build(BuildContext context) {
    List<P420HESBALANCEDATALOGclass> _datain = widget.data ?? [];
    List<List<String>> result = _datain.map((item) {
      return [
        item.DATETIME,
        item.CAL_1G_NO1,
        item.CAL_1G_NO2,
        item.CAL_1G_NO3,
        item.CAL_1G_AVERAGE,
        item.CAL_50G_NO1,
        item.CAL_50G_NO2,
        item.CAL_50G_NO3,
        item.CAL_50G_AVERAGE,
        item.CAL_100G_NO1,
        item.CAL_100G_NO2,
        item.CAL_100G_NO3,
        item.CAL_100G_AVERAGE,
        item.CAL_200G_NO1,
        item.CAL_200G_NO2,
        item.CAL_200G_NO3,
        item.CAL_200G_AVERAGE,
        item.CHECK_BY,
        item.APPROVE_BY,
        item.STATUS
      ]; // เข้าถึงฟิลด์โดยตรง
    }).toList();
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("CAL DATA LOG"),
              SizedBox(width: 12),
              Row(
                children: [
                  AdvanceDropDown(
                    imgpath: 'assets/icons/icon-down_4@3x.png',
                    listdropdown: const [
                      MapEntry("BA02", "BA02"),
                      MapEntry("BA03", "BA03"),
                    ],
                    onChangeinside: (d, k) {
                      setState(() {
                        P420CALDATALOGVAR.InstrumentName = d;
                        context
                            .read<P420HESBALANCEDATALOG_Bloc>()
                            .add(P420HESBALANCEDATALOG_GET());
                      });
                    },
                    value: P420CALDATALOGVAR.InstrumentName,
                    height: 30,
                    width: 120,
                    borderRaio: 1.0,
                  ),
                  SizedBox(width: 8),
                  IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: () async {
                      await exportToExcel(result);
                    },
                  ),
                  // AdvanceDropDown(
                  //   imgpath: 'assets/icons/icon-down_4@3x.png',
                  //   listdropdown: const [
                  //     MapEntry("2025", "2025"),
                  //   ],
                  //   onChangeinside: (d, k) {
                  //     setState(() {
                  //       context
                  //           .read<P420HESBALANCEDATALOG_Bloc>()
                  //           .add(P420HESBALANCEDATALOG_GET());
                  //     });
                  //   },
                  //   value: P420CALDATALOGVAR.InstrumentName,
                  //   height: 30,
                  //   width: 60,
                  //   borderRaio: 1.0,
                  // ),
                ],
              ),
            ],
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // คอลัมน์ที่มี DateTime
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(
                          120), // ปรับให้ใหญ่ขึ้นเพื่อให้ข้อมูล DateTime แสดงชัดเจน
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80, // ให้ความสูงสัมพันธ์กับตารางฝั่งขวา
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'DateTime',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ..._datain.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                color: Colors.white,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item.DATETIME,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),

              // คอลัมน์ที่มี "น้ำหนักเทียบ 1 กรัม"
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(280),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'น้ำหนักสอบเทียบ 1 กรัม',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FixedColumnWidth(70),
                          1: FixedColumnWidth(70),
                          2: FixedColumnWidth(70),
                          3: FixedColumnWidth(70),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 3',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ค่าเฉลี่ย',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ..._datain.map((item) {
                            return TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_1G_NO1,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_1G_NO2,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_1G_NO3,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_1G_AVERAGE,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              // คอลัมน์ที่มี "น้ำหนักเทียบ 1 กรัม"
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(280),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'น้ำหนักสอบเทียบ 50 กรัม',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FixedColumnWidth(70),
                          1: FixedColumnWidth(70),
                          2: FixedColumnWidth(70),
                          3: FixedColumnWidth(70),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 3',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ค่าเฉลี่ย',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ..._datain.map((item) {
                            return TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_50G_NO1,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_50G_NO2,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_50G_NO3,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_50G_AVERAGE,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(280),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'น้ำหนักสอบเทียบ 100 กรัม',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FixedColumnWidth(70),
                          1: FixedColumnWidth(70),
                          2: FixedColumnWidth(70),
                          3: FixedColumnWidth(70),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 3',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ค่าเฉลี่ย',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ..._datain.map((item) {
                            return TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_100G_NO1,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_100G_NO2,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_100G_NO3,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_100G_AVERAGE,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(280),
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 40,
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'น้ำหนักสอบเทียบ 200 กรัม',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Table(
                        border: TableBorder.all(),
                        columnWidths: const {
                          0: FixedColumnWidth(70),
                          1: FixedColumnWidth(70),
                          2: FixedColumnWidth(70),
                          3: FixedColumnWidth(70),
                        },
                        children: [
                          TableRow(
                            children: [
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 1',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 2',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ครั้งที่ 3',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              TableCell(
                                child: SizedBox(
                                  height: 40,
                                  child: Container(
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        'ค่าเฉลี่ย',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ..._datain.map((item) {
                            return TableRow(
                              children: [
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_200G_NO1,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_200G_NO2,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_200G_NO3,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Container(
                                    color: Colors.white,
                                    height: 20,
                                    child: Center(
                                      child: Text(
                                        item.CAL_200G_AVERAGE,
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(
                          100), // ปรับให้ใหญ่ขึ้นเพื่อให้ข้อมูล DateTime แสดงชัดเจน
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80, // ให้ความสูงสัมพันธ์กับตารางฝั่งขวา
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Check By',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ..._datain.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                color: Colors.white,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item.CHECK_BY,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(
                          100), // ปรับให้ใหญ่ขึ้นเพื่อให้ข้อมูล DateTime แสดงชัดเจน
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80, // ให้ความสูงสัมพันธ์กับตารางฝั่งขวา
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Re-Check By',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ..._datain.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                color: Colors.white,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item.APPROVE_BY,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Table(
                    border: TableBorder.all(),
                    columnWidths: const {
                      0: FixedColumnWidth(
                          70), // ปรับให้ใหญ่ขึ้นเพื่อให้ข้อมูล DateTime แสดงชัดเจน
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: SizedBox(
                              height: 80, // ให้ความสูงสัมพันธ์กับตารางฝั่งขวา
                              child: Container(
                                color: Colors.white,
                                child: Center(
                                  child: Text(
                                    'Status',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ..._datain.map((item) {
                        return TableRow(
                          children: [
                            TableCell(
                              child: Container(
                                color: Colors.white,
                                height: 20,
                                child: Center(
                                  child: Text(
                                    item.STATUS,
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  Future<void> exportToExcel(List<List<String>> datarow) async {
    try {
      // สร้างไฟล์ Excel
      var excel = Excel.createExcel();
      Sheet sheetObject = excel['Sheet1'];

      List<String> headers = [
        'DateTime',
        'Cal_1g_No1',
        'Cal_1g_No2',
        'Cal_1g_No3',
        'Cal_1g_Average',
        'Cal_50g_No1',
        'Cal_50g_No2',
        'Cal_50g_No3',
        'Cal_50g_Average',
        'Cal_100g_No1',
        'Cal_100g_No2',
        'Cal_100g_No3',
        'Cal_100g_Average',
        'Cal_200g_No1',
        'Cal_200g_No2',
        'Cal_200g_No3',
        'Cal_200g_Average',
        'Check_By',
        'Re-Check_By',
        'Status',
      ];

      // ✅ เขียน Header
      for (var col = 0; col < headers.length; col++) {
        sheetObject
            .cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0))
            .value = TextCellValue(headers[col]);
      }

      // ✅ เขียน Data row
      for (var r = 0; r < datarow.length; r++) {
        var row = datarow[r];

        // ให้ row มีความยาวเท่ากับ headers
        while (row.length < headers.length) {
          row.add("");
        }

        for (var c = 0; c < headers.length; c++) {
          sheetObject
              .cell(CellIndex.indexByColumnRow(columnIndex: c, rowIndex: r + 1))
              .value = TextCellValue(row[c]);
        }
      }

      var fileBytes = excel.encode();
      if (fileBytes != null) {
        if (kIsWeb) {
          final blob = html.Blob([Uint8List.fromList(fileBytes)]);
          final url = html.Url.createObjectUrlFromBlob(blob);

          final anchor = html.AnchorElement(href: url)
            ..target = 'blank'
            ..download = 'exported_data.xlsx';

          anchor.click();
          html.Url.revokeObjectUrl(url);

          print("✅ Excel file ready for download on Web");
        } else {
          print(
              "❌ This method is for Web only. Use native methods for Android/iOS.");
        }
      } else {
        print("❌ Failed to encode the Excel file");
      }
    } catch (e) {
      print("❌ Error saving file: $e");
    }
  }
}
