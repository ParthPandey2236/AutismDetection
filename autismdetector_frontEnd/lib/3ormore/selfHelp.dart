
import 'dart:async';

import 'package:autismdetector/3ormore/attachment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../lessthan3/motorDev.dart';

class selfhelp extends StatefulWidget {
  @override
  _selfhelpState createState() => _selfhelpState();
}
List<String> questionare =[
  "The child does not differentiate between dirty and clean clothes",
  "The child never attempts to wash hands on his/her own",
  "The child is unable to finds and takes his/her own eating plate/cup",
  "The child duration of sleep is less than 7 hours. ",
  "The child wakes up (atleast 3-4 times) during the middle of the sleep",
  "The child is unable to drink water on his/her own",
  "The child cannot eat snacks on his own",
  "The child has difficulty in brushing teeth on his/her own",
  "The child is unable to zip pants or shirts open/close",
  "The child is unaware of the front and back of the clothing",
  "The child has a preference to wear a same cloth all the time",
  "The child often figites with his clothes in public",
  "The child has difficulty in picking up small objects using fingers",
  "The child is unable to bring to mouth on his/her own",
  "The child shows a high preference for PICA(appetite for non-food items like chalk,paper)",
  "The child often runs away from eating foods most of the time",
  "The child pockets food and finds it difficult to swallow",
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
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
  [false,false,false,false,false],
];
class _selfhelpState extends State<selfhelp> {
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
                          Text('Self Help',style: TextStyle(fontSize: 40),),
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
                                                        'Strongly disagree',
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
                        map["SELF_HELP"] = obj;
                        Timer(Duration(milliseconds: 500), () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (contex) => attachment()));
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
