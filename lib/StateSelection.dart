import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cost_application/HomePage.dart';
import 'package:cost_application/Result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cost_application/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';



class StateSelection extends StatefulWidget {
  const StateSelection({Key? key}) : super(key: key);

  @override
  State<StateSelection> createState() => _StateSelection ();
}

class _StateSelection extends State<StateSelection> {

  var chk = [
    true,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false,
    false
  ];
  CollectionReference users =
  FirebaseFirestore.instance.collection('CostSheet');
  List<double> rates = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,0,0,0,0,0,0,0,0,0,0,0,0];
  double Palm15ltr = 0, KGMustard15ltr = 0, Soya15ltr = 0, EMustard15ltr = 0;
  double Palm15ltr_ = 0,
      KGMustard15ltr_ = 0,
      Soya15ltr_ = 0,
      EMustard15ltr_ = 0;
  double Palm15ltrTin = 0,
      KGMustard15ltrTin = 0,
      Soya15ltrTin = 0,
      EMustard15ltrTin = 0;
  double Palm1ltrPouch = 0,
      KGMustard1ltrPouch = 0,
      Soya1ltrPouch = 0,
      EMustard1ltrPouch = 0;
  List<String> place = [
    'Uttar Pradesh',
    'Ex-Plant',
    'Madhya Pradesh',
    'Orissa',
    'Jharkhand',
    'Punjab',
    'Rajasthan',
    'Uttarakhand',
    'Uttar Pradesh',
    'Gujrat',
    'Chhattisgarh',
    'Maharashtra',
    'Delhi NCR',
    'J & K',
    'Assam',
    'Haryana',
  ];

  refreshRates() {
    KGMustard15ltr = (KG_Mustard_input) / 10;
    KGMustard15ltr = (KGMustard15ltr + rates[getidx()]) * 15;
    KGMustard15ltr = KGMustard15ltr + cartoon + packing + filling + loading;
    KGMustard15ltr = KGMustard15ltr + KGMustard15ltr * mkt / 100;
    KGMustard15ltr = KGMustard15ltr + KGMustard15ltr * 5 / 100;

    //KG Mustard 1 ltr pouch
    KGMustard1ltrPouch = (KG_Mustard_input) / 10;
    KGMustard1ltrPouch = (KGMustard1ltrPouch + rates[getidx()]) * 0.91;
    KGMustard1ltrPouch =
        KGMustard1ltrPouch + cartoonP + packingP + fillingP + loadingP;
    KGMustard1ltrPouch = KGMustard1ltrPouch + KGMustard1ltrPouch * mktP / 100;
    KGMustard1ltrPouch = KGMustard1ltrPouch + KGMustard1ltrPouch * 5 / 100;
  }

  @override
  void initState() {
    super.initState();
    //KGMustard15ltr_
    //KGMustard
    KGMustard15ltr = (KG_Mustard_input) / 10;
    KGMustard15ltr = (KGMustard15ltr + frieghtUP) * 15;
    KGMustard15ltr = KGMustard15ltr + cartoon + packing +filling + loading;
    KGMustard15ltr = KGMustard15ltr + KGMustard15ltr * mkt / 100;
    KGMustard15ltr = KGMustard15ltr + KGMustard15ltr * 5 / 100;

    //KG Mustard 1 ltr pouch
    KGMustard1ltrPouch = (KG_Mustard_input) / 10 ;
    KGMustard1ltrPouch = (KGMustard1ltrPouch +frieghtUP)*0.91;
    KGMustard1ltrPouch = KGMustard1ltrPouch + cartoonP + packingP +fillingP + loadingP;
    KGMustard1ltrPouch = KGMustard1ltrPouch + KGMustard1ltrPouch * mktP / 100;
    KGMustard1ltrPouch = KGMustard1ltrPouch + KGMustard1ltrPouch * 5 / 100;


    users.doc('VdD1KmsYSvjhVDyx0RYw').get().then((data) {

      setState(() {
        rates[0] = frieghtUP;
        rates[1] = frieghtMP;
        rates[2] = frieghtRAJ;
        rates[3] = frieghtHAR;
        rates[4] = frieghtPUN;
        rates[5] = frieghtORR;
        rates[6] = frieghtJHA;
        rates[7] = frieghtCHH;
        rates[8] = frieghtWB;
        rates[9] = frieghtAS;
        rates[10] = frieghtEx;
        rates[11]= frieghtDEL;
        rates[12]= frieghtHIM;
        // rates[13]= frieghtJK;

        Palm15ltr_ = data['Palm15ltr']; // palm input
        KGMustard15ltr_ = 1410;//data['KGMustard15ltr']; // Kacchi ghani input
        Soya15ltr_ = data['Soya15ltr']; // soya input
        EMustard15ltr_ = data['EMustard15ltr'];

        // mustard input
        var Packing= data['Packing'];
        var Frieghtg=data['Frieghtg'];
        var Label= data['Label'];
        var cartoon=data["Cartoon"];
        var cap=data['Cap'];
        var  tikli=data['Tikli'];
        var tin_top=data['Tin Top'];
        var stp_roll= data['Strap Roll'];
        var shrill=data['Shrill'];
        var tape=data['Tape'];
        var Wad=data['Wad'];
        var Filling=data['Filling'];
        var Loading=data['Loading'];
      });
    }).catchError((err) {
      print(err);
    });
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(

      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
            Text(
            "Select State",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
              SwitchListTile(
                value: chk[10],
                onChanged: (newValue) => {
                  setState(() {
                    setArr(10);
                  })
                },
                title: Text(
                  'Ex-Plant Mathura',
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),
          SwitchListTile(
            value: chk[0],
            onChanged: (newValue) => {
              setState(() {
                setArr(0);
              })
            },
            title: Text(
              'Uttar Pradesh',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
              SwitchListTile(
                value: chk[5],
                onChanged: (newValue) => {
                  setState(() {
                    setArr(5);
                  })
                },
                title: Text(
                  'Orrisa',
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),

              SwitchListTile(
                value: chk[12],
                onChanged: (newValue) => {
                  setState(() {
                    setArr(12);
                  })
                },
                title: Text(
                  'Himachal Pradesh',
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),

              SwitchListTile(
                value: chk[11],
                onChanged: (newValue) => {
                  setState(() {
                    setArr(11);
                  })
                },
                title: Text(
                  'Delhi',
                ),
                tileColor: Color(0xFFF5F5F5),
                dense: false,
                controlAffinity: ListTileControlAffinity.trailing,
              ),

              SwitchListTile(
            value: chk[1],
            onChanged: (newValue) => {
              setState(() {
                setArr(1);
              })
            },
                title: Text(
              'Madhya Pradesh',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SwitchListTile(
            value: chk[2],
            onChanged: (newValue) => {
              setState(() {
                setArr(2);
              })
            },
            title: Text(
              'Rajasthan',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SwitchListTile(
            value: chk[3],
            onChanged: (newValue) => {
              setState(() {
                setArr(3);
              })
            },
            title: Text(
              'Haryana',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SwitchListTile(
            value: chk[4],
            onChanged: (newValue) => {
              setState(() {
                setArr(4);
              })
            },
            title: Text(
              'Punjab',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),

          SwitchListTile(
            value: chk[6],
            onChanged: (newValue) => {
              setState(() {
                setArr(6);
              })
            },
            title: Text(
              'Jharkhand',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SwitchListTile(
            value: chk[7],
            onChanged: (newValue) => {
              setState(() {
                setArr(7);
              })
            },
            title: Text(
              'Chhattisgarh',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SwitchListTile(
            value: chk[8],
            onChanged: (newValue) => {
              setState(() {
                setArr(8);
              })
            },
            title: Text(
              'West Bengal',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),
          SwitchListTile(
            value: chk[9],
            onChanged: (newValue) => {
              setState(() {
                setArr(9);
              })
            },
            title: Text(
              'Assam',
            ),
            tileColor: Color(0xFFF5F5F5),
            dense: false,
            controlAffinity: ListTileControlAffinity.trailing,
          ),




            ElevatedButton(
              child: Text(
                "Result",
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,


                ),

              ),

              onPressed: (() {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> Result()));

              }

              ),

            )
        ]),
      ),
    ),
    ),
    );

    // TODO: implement build
    throw UnimplementedError();
  }

  void setArr(int i) {
    for (int j = 0; j < i; j++) chk[j] = false;
    chk[i] = true;
    for (int j = i + 1; j < 14; j++) chk[j] = false;
    refreshRates();
  }

  int getidx() {
    for (int i = 0; i < 14; i++) {
      if (chk[i])
        return i;
    }
    return -1;
  }
}