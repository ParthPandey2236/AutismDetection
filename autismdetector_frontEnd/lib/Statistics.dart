import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:autismdetector/3ormore/motorDev.dart';
import 'package:autismdetector/lessthan3/motorDev.dart';
import 'package:autismdetector/prediction.dart';

import './Login.dart';
import 'package:autismdetector/form.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pie_chart/pie_chart.dart';
import 'Login.dart';
import 'custom_icons.dart';
import 'history.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;


class statistics extends StatefulWidget {
  @override
  _statisticsState createState() => _statisticsState();
}
var patientId="";
String patient_Id="";
var age="";
class _statisticsState extends State<statistics> {
  var isLoading = false;
  final GlobalKey<FabCircularMenuState> fabKey = GlobalKey();
  List<bool> check = [false, false, false];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AbsorbPointer(
        absorbing: isLoading,
        child: Scaffold(
          floatingActionButton: FabCircularMenu(
            key: fabKey,
            fabColor: Colors.white,
            ringColor: Colors.transparent,
            //ringWidth: 300,
            ringDiameter: 300,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: IconButton(
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          fabKey.currentState?.close();
                          Timer(Duration(milliseconds: 500), () {
                            if(int.parse(age)<=3) {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (contex) => motorDevless()));
                            }
                            else{
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (contex) => motorDev()));
                            }
                          });
                        },
                        icon: Icon(Custom.wpforms),
                        iconSize: 35.0,
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: IconButton(
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          fabKey.currentState?.close();
                          Timer(Duration(milliseconds: 500), () {
                            showRegisterPatientBottomSheet(context);
                          });
                        },
                        icon: Icon(Custom.user_plus),
                        iconSize: 35.0,
                      ))),
              Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40.0)),
                      child: IconButton(
                        padding: EdgeInsets.all(10.0),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => new history()));
                        },
                        icon: Icon(Custom.history),
                        iconSize: 35.0,
                      ))),
            ],
          ),
          // floatingActionButton: FloatingActionButton(onPressed: (){},child: Icon(Icons.add),),
          body: Container(
            color: isLoading
                ? Colors.grey.shade700.withOpacity(0.5)
                : Colors.transparent,
            child: SafeArea(
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                          const Color(0xFFffffff),
                          const Color(0xFF92b1ff),
                        ])),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(Icons.logout),
                              color: Colors.black,
                              iconSize: 50,
                              padding: EdgeInsets.only(top: 20, right: 30),
                            )),
                        Text(
                          'Statistics',
                          style: GoogleFonts.ebGaramond(
                            textStyle: TextStyle(
                              fontSize: 55.0,
                              color: Color(0xFF424d69),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 8,
                            width: 1.2 * MediaQuery.of(context).size.width / 2,
                            child: Center(
                              child: Text(
                                '100',
                                style: GoogleFonts.ebGaramond(
                                    textStyle: TextStyle(
                                  fontSize: 55.0,
                                  color: Color(0xFF424d69),
                                )),
                              ),
                            ),
                          ),
                          elevation: 8.0,
                          shadowColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Card(
                                elevation: 8.0,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Container(
                                  height: 70.0,
                                  width: 70.0,
                                  child: Center(
                                    child: Text(
                                      '23',
                                      style: GoogleFonts.ebGaramond(
                                          textStyle: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF424d69),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                (Custom.up),
                                size: 70.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                              Card(
                                elevation: 8.0,
                                shadowColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)),
                                child: Container(
                                  height: 70.0,
                                  width: 70.0,
                                  child: Center(
                                    child: Text(
                                      '77',
                                      style: GoogleFonts.ebGaramond(
                                          textStyle: TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF424d69),
                                      )),
                                    ),
                                  ),
                                ),
                              ),
                              Icon(
                                (Custom.down),
                                size: 70.0,
                                color: Colors.black.withOpacity(0.5),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        PieChart(
                          dataMap: dataMap,
                          colorList: colorList,
                          animationDuration: Duration(milliseconds: 2000),
                          chartRadius: MediaQuery.of(context).size.width / 2,
                          chartValuesOptions: ChartValuesOptions(
                            showChartValuesInPercentage: true,
                          ),
                          legendOptions: LegendOptions(
                            legendTextStyle: GoogleFonts.ebGaramond(
                                textStyle: TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF424d69),
                            )),

                            // legendPosition: dataMap.length>6?LegendPosition.bottom:LegendPosition.right,
                            // showLegendsInRow: dataMap.length>6?true:false,
                          ),
                        ),
                      ],
                    ),
                  ),
                  isLoading
                      ? Center(child: CircularProgressIndicator())
                      : SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Map<String, double> dataMap = {
    "Unaffected": 77,
    "Affected(F)": 9,
    "Affected(M)": 14,
  };
  List<Color> colorList = [
    const Color(0xFF000f34),
    const Color(0xFF7587b4),
    const Color(0xFFFFFFFF),
  ];
  void showRegisterPatientBottomSheet(BuildContext context2) {
    var name = "", phoneno = "", gender = "";
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context2,
        builder: (builder) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState2) {
              return Container(
                height: 2.5 * MediaQuery.of(context).size.height / 3 +
                    MediaQuery.of(context).viewInsets.bottom / 2,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)),
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.black.withOpacity(0.07),
                        offset: Offset(0, -3),
                        blurRadius: 7.0, // soften the shadow
                        spreadRadius: 7.0,
                      )
                    ]),
                child: Container(
                  // height: 2*MediaQuery.of(context).size.height/3,
                  // width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0)),
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.grey.shade50,
                        )
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 30.0, right: 30.0, bottom: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 5.0,
                          width: 60.0,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          'Patient Info',
                          style: GoogleFonts.ebGaramond(
                            textStyle: TextStyle(
                              fontSize: 45.0,
                              color: Color(0xFF424d69),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10.0),
                          padding: EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              TextField(
                                onChanged: (value) {
                                  name = value.trim();
                                },
                                autofocus: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF898f9e),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF57668b), width: 4.0),

                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF57668b), width: 4.0),
                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 30.0,
                              ),
                              TextField(
                                onChanged: (value) {
                                  phoneno = value.trim();
                                },
                                autofocus: true,
                                keyboardType: TextInputType.number,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Phone Number',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF898f9e),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF57668b), width: 4.0),

                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF57668b), width: 4.0),
                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              TextField(
                                onChanged: (value) {
                                  age = value.trim();
                                },
                                keyboardType: TextInputType.number,
                                autofocus: true,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20.0),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(
                                  hintText: 'Age',
                                  hintStyle: TextStyle(
                                    color: Color(0xFF898f9e),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF57668b), width: 4.0),

                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color(0xFF57668b), width: 4.0),
                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 30.0,
                              ),
                              // TextField(
                              //
                              //   autofocus: true,
                              //   style:TextStyle(color: Colors.black,fontSize: 20.0),
                              //   cursorColor: Colors.black,
                              //   decoration: InputDecoration(
                              //
                              //     hintText: 'Gender',
                              //     hintStyle: TextStyle(
                              //       color: Color(0xFF898f9e),
                              //     ),
                              //     focusedBorder: UnderlineInputBorder(
                              //       borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),
                              //
                              //       //borderRadius: BorderRadius.circular(25.7),
                              //     ),
                              //     enabledBorder: UnderlineInputBorder(
                              //       borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),
                              //       //borderRadius: BorderRadius.circular(25.7),
                              //     ),
                              //
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState2(() {
                                        check = [false, false, false];
                                        check[0] = !check[0];
                                      });
                                    },
                                    child: Container(
                                      width: 0.7 *
                                          MediaQuery.of(context).size.width /
                                          3,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: check[0]
                                            ? Colors.green
                                            : Colors.grey.shade200,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Male',
                                          style: GoogleFonts.ebGaramond(
                                              fontSize: 20.0,
                                              textStyle: TextStyle(
                                                  color: check[0]
                                                      ? Colors.white
                                                      : Color(0xFF57668b))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState2(() {
                                        check = [false, false, false];
                                        check[1] = !check[1];
                                      });
                                    },
                                    child: Container(
                                      width: 0.7 *
                                          MediaQuery.of(context).size.width /
                                          3,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: check[1]
                                            ? Colors.green
                                            : Colors.grey.shade200,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Female',
                                          style: GoogleFonts.ebGaramond(
                                              fontSize: 20.0,
                                              textStyle: TextStyle(
                                                  color: check[1]
                                                      ? Colors.white
                                                      : Color(0xFF57668b))),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState2(() {
                                        check = [false, false, false];
                                        check[2] = !check[2];
                                      });
                                    },
                                    child: Container(
                                      width: 0.7 *
                                          MediaQuery.of(context).size.width /
                                          3,
                                      height: 40.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        //border: Border(top: BorderSide()),
                                        color: check[2]
                                            ? Colors.green
                                            : Colors.grey.shade200,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Others',
                                          style: GoogleFonts.ebGaramond(
                                              fontSize: 20.0,
                                              textStyle: TextStyle(
                                                  color: check[2]
                                                      ? Colors.white
                                                      : Color(0xFF57668b))),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 40.0,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  width: double.infinity,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        // minimumSize: Size(),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // <-- Radius
                                        ),
                                        primary: Colors.green,
                                      ),
                                      onPressed: () async {
                                        if (check[0]) {
                                          gender = "Male";
                                        } else if (check[1]) {
                                          gender = "Female";
                                        } else {
                                          gender = "Others";
                                        }
                                        Navigator.pop(context);
                                        setState(() {
                                          isLoading = true;
                                        });
                                        print(phoneno);
                                        print(name);
                                        print(gender);
                                        print(doctor_id);
                                        // var response = await new Dio().post(
                                        //   'http://192.168.0.120:8000/api/v1/patients/register',
                                        //   data: {
                                        //     {
                                        //       "PhoneNo": phoneno.toString(),
                                        //       "name": name,
                                        //       "gender": gender,
                                        //       "doctor": doctor_id.toString(),
                                        //     }
                                        //   }
                                        // );
                                        // patientId=response.data['data']['patientId'];
                                        var responce2 = await http.post(Uri.parse("http://192.168.0.120:8000/api/v1/patients/register"),
                                            body:{
                                              "PhoneNo": phoneno.toString(),
                                              "name": name,
                                              "gender": gender,
                                              "doctor": doctor_id.toString(),
                                            });
                                        var responseData = json.decode(responce2.body);
                                        patientId=responseData['data']['patientId'];
                                        patient_Id =patientId;
                                        print("lasa"+patientId);
                                        setState(() {
                                          isLoading = false;
                                        });

                                        await showDialog(
                                            context: context2,
                                            builder: (BuildContext context) {
                                              return Center(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0),
                                                      color:
                                                          Colors.grey.shade50),
                                                  width: 1.5 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      2,
                                                  height: 0.2 *
                                                      MediaQuery.of(context)
                                                          .size
                                                          .height,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            20.0),
                                                    child: Material(
                                                      child: Column(
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              'Patient ID',
                                                              style: GoogleFonts
                                                                  .ebGaramond(
                                                                fontSize: 30.0,
                                                                // color: Color(0xFF000f34),
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2,
                                                          ),
                                                          Container(
                                                            height: 1,
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0xFFd7d7d7),
                                                          ),
                                                          SelectableText(

                                                            patientId.substring(0,6),
                                                            style: GoogleFonts
                                                                .ebGaramond(
                                                              fontSize: 50,
                                                              color: Color(
                                                                  0xFF000f34),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text(
                                        'GENERATE',
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              // SizedBox(height: 60.0,),
                              // ElevatedButton(
                              //     onPressed: ()=>{},
                              //     child: Container(
                              //       width: double.infinity,
                              //       // height: double.infinity,
                              //
                              //       decoration: BoxDecoration(
                              //         borderRadius: BorderRadius.circular(50.0),
                              //
                              //       ),
                              //       child: Center(
                              //         child: Text('Login',style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 20
                              //         ),),
                              //       ),
                              //     )),
                              // Container(
                              //   width: double.infinity,
                              //
                              //   // color: Colors.red,
                              //   // decoration: BoxDecoration(
                              //   //   borderRadius: BorderRadius.circular(20.0),
                              //   //   color: Colors.red
                              //   // ),
                              //   //child: Text('hi'),
                              //   child: ElevatedButton(
                              //
                              //       style: ElevatedButton.styleFrom(
                              //         shape: RoundedRectangleBorder(
                              //           borderRadius: BorderRadius.circular(10.0), // <-- Radius
                              //         ),
                              //         primary: Colors.deepPurple,
                              //
                              //       ),
                              //
                              //       onPressed: ()=>{print("!")},
                              //       child: Text('Confirm',style: TextStyle(
                              //           color: Colors.white,
                              //           fontSize: 20.0
                              //       ),)
                              //   ),
                              // )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }).whenComplete(() {
      check = [false, false, false];
    });
  }
}
