// ignore_for_file: prefer_const_constructors
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cost_application/Result.dart';
import 'package:cost_application/new_page1.dart';
import 'package:cost_application/new_page2.dart';
import 'package:cost_application/new_page3.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:cost_application/SecondPage.dart';
import 'package:cost_application/ThirdPage.dart';
import 'package:cost_application/firebase_options.dart';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'SecondPage2.dart';
import 'logIn.dart';





var frieght = 1.00;
var frieghtUP = 1.00;
var frieghtMP = 1.00;
var frieghtRAJ = 1.00;
var frieghtHAR = 1.00;
var frieghtPUN = 1.00;
var frieghtORR = 1.00;
var frieghtJHA = 1.00;
var frieghtCHH = 1.00;
var frieghtWB = 1.00;
var frieghtAS = 1.00;
var frieghtUK = 1.00;
var frieghtDEL = 1.00;
var frieghtHIM = 1.00;
var frieghtJK = 1.00;
var frieghtEx = 1.00;
var KG_Mustard_input = 1410.00;

var cartoon = 5.07;
var packing = 96.70;
var filling = 8.00;
var loading = 2.00;
var mkt = 0.70;

var cartoonP = 1.58;
var packingP = 1.74;
var fillingP = 0.50;
var loadingP = 0.17;
var mktP = 0.70;

var isAdminLogin = false;



class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {

  String? _previousValue1;
  String? _previousValue2;
  String? _previousValue3;
  String? _previousValue4;
  final _prefs = SharedPreferences.getInstance();
  final textController1 = TextEditingController();
  final textController2 = TextEditingController();
  final textController3 = TextEditingController();
  final textController4 = TextEditingController();

  CollectionReference users =
  FirebaseFirestore.instance.collection('CostSheet');

  @override
  void initState() {
    super.initState();

    _prefs.then((prefs) {
      _previousValue1 = prefs.getString('previous_value1@');
      textController1.text = _previousValue1 ?? '';

      _previousValue2 = prefs.getString('previous_value2@');
      textController2.text = _previousValue2 ?? '';

      _previousValue3 = prefs.getString('previous_value3@');
      textController3.text = _previousValue3 ?? '';

      _previousValue4 = prefs.getString('previous_value4@');
      textController4.text = _previousValue4 ?? '';


    });
  }
  //   textController1 = TextEditingController();
  //   textController2 = TextEditingController();
  //   textController3 = TextEditingController();
  //   textController4 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.deepPurple[100],
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
              child: Text(
                'Please Enter the Loose rate for ${DateFormat('dd/MM/yyyy').format(DateTime.now())} of : ',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'KACCHI GHAANI \n     MUSTARD',
                    style: TextStyle(
                      fontFamily: 'Roboto',
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    height: 60,
                    child: TextFormField(
                      controller: textController2,
                      onChanged: (String? value) {
                        setState(() {
                          _previousValue2 = value;
                        });
                        _prefs.then((prefs) {
                          prefs.setString(
                              'previous_value2@', _previousValue2 ?? '');
                        });
                      },
                      textAlign: TextAlign.center,
                      textAlignVertical: TextAlignVertical.center,
                      autofocus: true,
                      obscureText: false,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFFFD9B3),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      // style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(250, 50, 20, 0),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () async {
                  // print(textController1?.text); // palm
                  // print(textController2?.text); // kg mustard
                  // print(textController3?.text); // soya
                  // print(textController4?.text); // mustard oil

                  KG_Mustard_input = double.parse(textController2!.text);
                  Navigator.of(context).pushNamed("/new_page1");

                  // if(isAdminLogin){
                  //   Navigator.of(context).pushNamed('/new_page1');
                  // }
                  // else {
                  //   Navigator.of(context).pushNamed('/respage');
                  // }
                },
                label: Container(
                    width: 130,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text('Next ')),
                icon: Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ),
    );
  }
}