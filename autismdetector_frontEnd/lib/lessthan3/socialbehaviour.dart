import 'dart:async';

import 'package:autismdetector/temprament.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import '../Statistics.dart';
import '../prediction.dart';
import 'motorDev.dart';
class socialbehavior extends StatefulWidget {
  @override
  _socialbehaviorState createState() => _socialbehaviorState();
}

List<String> questionare =[
  "The child only responds to family members",
  "The child slow to develop eye contact",
  "The child limits his/her with other children with toys.",
  "The child does not copy actions and do imitative play",
  "The child stays away from familiar people",
  "The child does not recognize affection from caregivers",
  "The child does not react out for familiar objects",
  "The child does not respond when smiled at people.",
];
List<List<bool>> check =[[false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
];
bool isLoading =false;
class _socialbehaviorState extends State<socialbehavior> {
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
                          Text('SOCIAL BEHAVIOR',style: TextStyle(fontSize: 40),),
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
                                                    width: 0.8 *
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
                                                        'Strongly Agree',
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
                                                    width: 0.9 *
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
                                                        'Strongly Disagree',
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
                      onPressed: () async {
                        int count=0;
                        int Ncount=0;
                        for(int i=0;i<check.length;i++){
                          for(int j=0;j<check[i].length;j++){
                            if(check[i][j]){
                              count+=j+1;
                              if(j==2){
                                Ncount++;
                              }
                            }
                          }
                        }
                        print(count);
                        print(Ncount);
                        values obj = new values(count, Ncount);
                        map["SOCIAL_EMOTIVE_BEHAVIOR"] = obj;
                        setState(() {
                          isLoading = true;
                        });
                        try{

                          var responce = await http.post(Uri.parse("https://web-production-49bb.up.railway.app/api/v1/values"),body: {
                            "patient":patient_Id,
                            "Temperament":map.containsKey("Temperament")?map["Temperament"]!.score.toString():0.toString(),
                            "ATTACHMENT":map.containsKey("ATTACHMENT")?map["ATTACHMENT"]!.score.toString():0.toString(),
                            "SELF_HELP":map.containsKey("SELF_HELP")?map["SELF_HELP"]!.score.toString():0.toString(),
                            "LANGUAGE_AND_COMMUNICATION":map.containsKey("LANGUAGE_AND_COMMUNICATION")?map["LANGUAGE_AND_COMMUNICATION"]!.score.toString():0.toString(),
                            "MotorDevelopment":map.containsKey("MotorDevelopment")?map["MotorDevelopment"]!.score.toString():0.toString(),
                            "ADAPTIVE":map.containsKey("ADAPTIVE")?map["ADAPTIVE"]!.score.toString():0.toString(),
                            "SOCIAL_EMOTIVE_BEHAVIOR":map.containsKey("SOCIAL_EMOTIVE_BEHAVIOR")?map["SOCIAL_EMOTIVE_BEHAVIOR"]!.score.toString():0.toString(),
                          });

                          var responce2 = await http.post(Uri.parse("https://web-production-49bb.up.railway.app/api/v1/valuesNorD"),body: {
                            "patient":patient_Id,
                            "Temperament":map.containsKey("Temperament")?map["Temperament"]!.Nscore.toString():0.toString(),
                            "ATTACHMENT":map.containsKey("ATTACHMENT")?map["ATTACHMENT"]!.Nscore.toString():0.toString(),
                            "SELF_HELP":map.containsKey("SELF_HELP")?map["SELF_HELP"]!.Nscore.toString():0.toString(),
                            "LANGUAGE_AND_COMMUNICATION":map.containsKey("LANGUAGE_AND_COMMUNICATION")?map["LANGUAGE_AND_COMMUNICATION"]!.Nscore.toString():0.toString(),
                            "MotorDevelopment":map.containsKey("MotorDevelopment")?map["MotorDevelopment"]!.Nscore.toString():0.toString(),
                            "ADAPTIVE":map.containsKey("ADAPTIVE")?map["ADAPTIVE"]!.Nscore.toString():0.toString(),
                            "SOCIAL_EMOTIVE_BEHAVIOR":map.containsKey("SOCIAL_EMOTIVE_BEHAVIOR")?map["SOCIAL_EMOTIVE_BEHAVIOR"]!.Nscore.toString():0.toString(),
                          });

                        }
                        catch(e){
                          print(e);
                        }


                        //Do dio call
                        setState(() {
                          isLoading = false;
                        });
                        Navigator.push(context,
                            MaterialPageRoute(builder: (contex) => predict(true)));
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
            isLoading
                ? Center(child: CircularProgressIndicator())
                : SizedBox(),
          ],

        ),
      ),
    );
  }
}
