

import 'dart:async';
import 'dart:collection';

import 'package:autismdetector/3ormore/langCom.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../lessthan3/motorDev.dart';

class motorDev extends StatefulWidget {
  @override
  _motorDevState createState() => _motorDevState();
}

List<String> questionare = [
  "The child is able to walk steadily without falling",
  "The child is able to stand on his/her own",
  "The child is able to jump when asked",
  "The child is able to sit appropriate on chair",
  "The child is able to bear weight and lift small objects",
  "The child is able to role on flow in either direction",
  "The child is able to push down with legs when feet or placed on a hard surface",
  "The child is able bring things to mouth",
  "The child is able to reach for objects",
  "The child is able to use straw",
  "The child doen’t loss skills learned",
  "The child does not have physical delays in activities like catching a ball on hoping",
  "The child is able to his/her toys back",
  "The child does not have trouble scribbling",
  "The child can jump in place",
  "The child falls down less often or doesn’t have with trouble with stairs",
  "The child attempts to help parents with household choices",
  "The child is able to carry his/her own battle/bag",
];
List<List<bool>> check =[[false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],

];
class _motorDevState extends State<motorDev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Stack(
          children:[
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
                child: Padding(

                    padding: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 70),
                    child: SingleChildScrollView(
                      physics: ScrollPhysics(),
                      child: Column(
                        children: [
                          Text('Motor Development',style: TextStyle(fontSize: 40),),
                          SizedBox(height: 20),
                          ListView.builder(physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,itemCount: questionare.length,itemBuilder: (BuildContext context, int index){
                              return Container(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Text((index+1).toString()+". "+questionare[index],style: TextStyle(fontSize: 20),),
                                        SizedBox(height: 20,),
                                        Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      check[index] = [false, false, false,false,false];
                                                      check[index][0] = !check[index][0];
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 0.9 *
                                                        MediaQuery.of(context).size.width /
                                                        3,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0),
                                                      color: check[index][0]
                                                          ? Colors.green
                                                          : Colors.grey.shade200,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Strongly Disagree',
                                                        style: GoogleFonts.ebGaramond(
                                                            fontSize: 15.0,
                                                            textStyle: TextStyle(
                                                                color: check[index][0]
                                                                    ? Colors.white
                                                                    : Color(0xFF57668b))),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      check[index]= [false, false, false,false,false];
                                                      check[index][1] = !check[index][1];
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 0.8 *
                                                        MediaQuery.of(context).size.width /
                                                        3,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0),
                                                      color: check[index][1]
                                                          ? Colors.green
                                                          : Colors.grey.shade200,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Disagree',
                                                        style: GoogleFonts.ebGaramond(
                                                            fontSize: 15.0,
                                                            textStyle: TextStyle(
                                                                color: check[index][1]
                                                                    ? Colors.white
                                                                    : Color(0xFF57668b))),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      check[index] = [false, false, false,false,false];
                                                      check[index][2] = !check[index][2];
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 0.8 *
                                                        MediaQuery.of(context).size.width /
                                                        3,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0),
                                                      //border: Border(top: BorderSide()),
                                                      color: check[index][2]
                                                          ? Colors.green
                                                          : Colors.grey.shade200,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Neither',
                                                        style: GoogleFonts.ebGaramond(
                                                            fontSize: 15.0,
                                                            textStyle: TextStyle(
                                                                color: check[index][2]
                                                                    ? Colors.white
                                                                    : Color(0xFF57668b))),
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                              ],
                                            ),
                                            SizedBox(height: 10,),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      check[index] = [false, false, false,false,false];
                                                      check[index][3] = !check[index][3];
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 0.8 *
                                                        MediaQuery.of(context).size.width /
                                                        3,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0),
                                                      //border: Border(top: BorderSide()),
                                                      color: check[index][3]
                                                          ? Colors.green
                                                          : Colors.grey.shade200,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Agree',
                                                        style: GoogleFonts.ebGaramond(
                                                            fontSize: 15.0,
                                                            textStyle: TextStyle(
                                                                color: check[index][3]
                                                                    ? Colors.white
                                                                    : Color(0xFF57668b))),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      check[index] = [false, false, false,false,false];
                                                      check[index][4] = !check[index][4];
                                                    });
                                                  },
                                                  child: Container(
                                                    width: 0.8 *
                                                        MediaQuery.of(context).size.width /
                                                        3,
                                                    height: 40.0,
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(20.0),
                                                      //border: Border(top: BorderSide()),
                                                      color: check[index][4]
                                                          ? Colors.green
                                                          : Colors.grey.shade200,
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        'Strongly Agree',
                                                        style: GoogleFonts.ebGaramond(
                                                            fontSize: 15.0,
                                                            textStyle: TextStyle(
                                                                color: check[index][4]
                                                                    ? Colors.white
                                                                    : Color(0xFF57668b))),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  )
                              );},
                          ),

                        ],
                      ),
                    )
                )
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(75,35),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0), // <-- Radius
                        ),
                        primary: Colors.green,

                      ),
                      // onPressed: () async {
                      //   var response = await new Dio().post('https://autismdetection.herokuapp.com/api/v1/sendOTP',
                      //       data: {
                      //         "email": emailId,
                      //       }
                      //   );
                      // },
                      onPressed: () {
                        int count=0;
                        int Ncount=0;
                        for(int i=0;i<check.length;i++){
                          for(int j=0;j<check[i].length;j++){
                            if(check[i][j]){
                              count+=check[i].length-j;
                              if(j==2){
                                Ncount++;
                              }
                            }
                          }
                        }
                        print(count);
                        print(Ncount);
                        values obj = new values(count, Ncount);
                        map["MotorDevelopment"] = obj;
                        Timer(Duration(milliseconds: 500), () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) => langCom()));
                        });
                      },
                      child: Text('Next',style: TextStyle(
                          color: Colors.white,
                        fontSize: 20

                      ),),
                    ),
                  ),
                ),
              ),
            ),
          ],

        ),
          ),
        );

  }
}
