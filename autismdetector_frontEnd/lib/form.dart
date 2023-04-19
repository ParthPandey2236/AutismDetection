import 'dart:async';

import 'package:autismdetector/prediction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';
import './Statistics.dart';
class form extends StatefulWidget {
  @override
  _formState createState() => _formState();
}
var comunication = "", sleep="", phy ="",mood="",at="",socail="",sb="",intt="",prediction="";
class _formState extends State<form> {
  var isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
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
            Container(
              color: isLoading
                  ? Colors.grey.shade700.withOpacity(0.5)
                  : Colors.transparent,
              height: MediaQuery.of(context).size.height ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(icon:Icon(Icons.arrow_back),iconSize: 40.0,onPressed: (){
                      Navigator.pop(context);
                    },),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      'Form',
                      style: GoogleFonts.ebGaramond(
                        textStyle: TextStyle(
                          fontSize: 60.0,
                          color: Color(0xFF424d69),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                intt = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: 'Hyperactivity',
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                sb = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: "A. Behaviors",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                  fontSize: 20
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                comunication = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: "Communication",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                  fontSize: 20
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                sleep = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(
                                //labelText: "Sleep Problems",
                                hintText:  "Sleep Problems",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                phy = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: "Physical Symptoms",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                mood = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: "Mood Affect",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                at = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: "Atypical Behaviors",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 0.4*MediaQuery.of(context).size.width,
                          height: 60.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.grey.shade50,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              onChanged: (value){
                                socail = value.trim();
                              },
                              keyboardType: TextInputType.number,
                              autofocus: true,
                              style:TextStyle(color: Colors.black,fontSize: 20.0),
                              cursorColor: Color(0xFF57668b),
                              decoration: InputDecoration(

                                hintText: "Social_Functioning",
                                hintStyle: TextStyle(
                                  color: Color(0xFF898f9e),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),

                                  //borderRadius: BorderRadius.circular(25.7),
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color:  Colors.transparent,width: 4.0),
                                  //borderRadius: BorderRadius.circular(25.7),
                                ),

                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              // minimumSize: Size(),
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(20.0), // <-- Radius
                              ),
                              primary: isLoading?Colors.grey:Colors.green,

                            ),
                            onPressed: ()async {
                              setState(() {
                                isLoading = true;
                              });
                              print("$comunication" +" "+"$sleep"+" "+"$phy"+" "+"$mood"+" "+"$at"+" "+"$socail"+" "+"$sb"+ " "+"$intt");
                              var response = await new Dio().post(
                                'https://autism-detect.herokuapp.com/predict',
                                data: {
                                  // {
                                  //   "Communication":"15",
                                  //   "Sleep_Problems":"15",
                                  //   "Physical_Symptoms":"10",
                                  //   "Mood_and_Affect":"83",
                                  //   "Atypical_Behaviors":"12",
                                  //   "Social_Functioning":"93",
                                  //   "Social Functioning/Atypical Behaviors":"76",
                                  //   "Inattention/Hyperactivity":"64"
                                    "Communication":"$comunication",
                                    "Sleep_Problems":"$sleep",
                                    "Physical_Symptoms":"$phy",
                                    "Mood_and_Affect":"$mood",
                                    "Atypical_Behaviors":"$at",
                                    "Social_Functioning":"$socail",
                                    "Social Functioning/Atypical Behaviors":"$sb",
                                    "Inattention/Hyperactivity":"$intt"

                                },

                              );
                              prediction =  response.data['Prediction'];
                              // var response1 = await new Dio().post(
                              //   'https://autismdetection.herokuapp.com/api/v1/patients/'+patientId+'/create_report',
                              //   data: {
                              //     {
                              //      "status": prediction,
                              //     }
                              //   },
                              //
                              // );
                              setState(() {
                                isLoading = false;
                              });
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> predict(false)));


                            },
                            child: Text('SUBMIT',style: TextStyle(
                                fontSize: 25,
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
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
    );
  }
}
