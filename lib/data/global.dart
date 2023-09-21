import 'package:flutter/material.dart';
import '../page/page0.dart';

String token = '';
Widget CuPage = const Page0();
int CuPageLV = 0;

class USERDATA {
  static int UserLV = 0;
  static String NAME = '';
  static String ID = '';
  static String Section = '';
  static String Branch = '';
  static String INSMASTER = '';
}

class logindata {
  static bool isControl = false;
  static String userID = '';
  static String userPASS = '';
}

// String serverG = 'http://127.0.0.1:15152/';
// String serverN = 'http://127.0.0.1:2600';
// String webHOOK = '172.101.34.209';
String webHOOK = '172.23.10.51';
// String serverG = 'http://172.23.10.40:15152/';
String serverG = 'http://172.23.10.51:15152/';

// String serverN = 'http://172.23.10.40:2600';
String serverN = 'http://172.23.10.51:2600';
String serverSARS = 'http://172.23.10.51:5000';
String serverSARMAIN = 'http://172.23.10.51:1885';
// String webHOOK = '172.23.10.40';
