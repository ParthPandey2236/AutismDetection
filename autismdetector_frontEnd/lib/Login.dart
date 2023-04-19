import 'package:autismdetector/ForgotPassword.dart';
import 'package:autismdetector/Statistics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dio/dio.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}
String doctor_id ="";
class _LoginScreenState extends State<LoginScreen> {
  var Emailid ="",password="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset : false,
      body: Container(
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
          padding: EdgeInsets.all(40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Login',
                style: GoogleFonts.ebGaramond(
                  textStyle: TextStyle(
                      fontSize: 60.0,
                      color:  Color(0xFF424d69),

                    ),
                ),
                // style: TextStyle(
                //   fontSize: 60.0,
                //   color: Color(0xFF000f34),
                //   fontFamily:
                // ),
              ),
              Container(
                margin: EdgeInsets.only(top:30.0),
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      onChanged: (value){
                        Emailid = value.trim();
                      },
                      cursorColor: Colors.black,
                      style:TextStyle(color: Colors.black,fontSize: 20.0),
                      decoration: InputDecoration(
                        hintText: 'Email ID',
                        hintStyle: TextStyle(
                          color: Color(0xFF898f9e),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF57668b),width: 4.0),

                          //borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF57668b),width: 4.0),
                          //borderRadius: BorderRadius.circular(25.7),
                        ),

                      ),
                    ),
                    SizedBox(height: 40.0,),
                    TextField(
                      onChanged: (value){
                        password=value.trim();
                      },
                      style:TextStyle(color: Colors.black,fontSize: 20.0),
                      cursorColor: Colors.black,
                      decoration: InputDecoration(

                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(0xFF898f9e),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF57668b),width: 4.0),

                          //borderRadius: BorderRadius.circular(25.7),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF57668b),width: 4.0),
                          //borderRadius: BorderRadius.circular(25.7),
                        ),

                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: InkWell(
                          onTap: (){
                            // Navigator.push(context , MaterialPageRoute(builder: (context) =>  new ForgotPassword()));
                            // showBottomSheet(context: context, builder: (builder){return Container();});
                            forgotPasswordBottomSheet(context);
                          },
                          child: Text('Forgot Password?',style: TextStyle(
                            color: Color(0xFF57668b)
                          ),),
                        ),
                      ),
                    ),
                    SizedBox(height: 60.0,),
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
                    Container(
                      width: double.infinity,

                      // color: Colors.red,
                      // decoration: BoxDecoration(
                      //   borderRadius: BorderRadius.circular(20.0),
                      //   color: Colors.red
                      // ),
                      //child: Text('hi'),
                      child: ElevatedButton(

                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0), // <-- Radius
                            ),
                            primary: Colors.deepPurple,

                          ),

                        onPressed: ()async{
                            print(Emailid);
                            var response = await new Dio().post('http://192.168.0.120:8000/api/v1/doctors/login',
                            data: {
                              "email" : Emailid,
                              "password" : password
                            });
                            if(response.data['message'].contains('Token Created Successfully')){
                              doctor_id = response.data['data']['user'].toString();
                              Navigator.push(context,MaterialPageRoute(builder:(context)=> statistics()));
                            }

                        },
                        child: Text('Login',style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0
                        ),)
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void forgotPasswordBottomSheet(BuildContext context) {
    var emailId ="",otp="";
    showModalBottomSheet(
      isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder){

      return Container(

        height: 1.75*MediaQuery.of(context).size.height/3+MediaQuery.of(context).viewInsets.bottom/2,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0)),
            boxShadow: [
              new BoxShadow(
                color: Colors.black.withOpacity(0.07),
                offset: Offset(0,-3),
                blurRadius: 7.0, // soften the shadow
                spreadRadius: 7.0,

              )
            ]
        ),
        child: Container(


          // height: 2*MediaQuery.of(context).size.height/3,
          // width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0)),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey.shade50,

                )
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.only(top:10.0,left: 30.0,right: 30.0,bottom: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(height: 5.0,width: 60.0,color: Colors.grey,),
                SizedBox(height: 45,),
                Text('Forgot Password?',
                  style: GoogleFonts.ebGaramond(
                    textStyle: TextStyle(
                      fontSize: 40.0,
                      color:  Color(0xFF424d69),

                    ),
                  ),),
                Container(
                  margin: EdgeInsets.only(top:10.0),
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      TextField(
                        onChanged: (value){
                          emailId = value.trim();
                        },
                        autofocus:true,
                        style:TextStyle(color: Colors.black,fontSize: 20.0),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText: 'Email ID',
                          hintStyle: TextStyle(
                            color: Color(0xFF898f9e),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),

                            //borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),
                            //borderRadius: BorderRadius.circular(25.7),
                          ),

                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(75,35),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0), // <-- Radius
                              ),
                              primary: Colors.green,

                            ),
                            onPressed: () async {
                              var response = await new Dio().post('http://192.168.0.120:8000/api/v1/sendOTP',
                                data: {
                                "email": emailId,
                                }
                              );
                            },
                            child: Text('Submit',style: TextStyle(
                                color: Colors.white
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(height: 15.0,),
                      TextField(
                        onChanged: (value){
                          otp = value.trim();
                        },
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        style:TextStyle(color: Colors.black,fontSize: 20.0),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(

                          hintText: 'OTP',
                          hintStyle: TextStyle(
                            color: Color(0xFF898f9e),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),

                            //borderRadius: BorderRadius.circular(25.7),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),
                            //borderRadius: BorderRadius.circular(25.7),
                          ),

                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              minimumSize: Size(75,35),
                              shape: RoundedRectangleBorder(

                                borderRadius: BorderRadius.circular(20.0), // <-- Radius
                              ),
                              primary: Colors.green,

                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                              var response = await new Dio().post('http://192.168.0.120:8000/api/v1/verifyOTP',
                                  data: {
                                    "email": emailId,
                                    "otp": otp,
                                  }
                              );
                              if(response.data['message'].contains('Otp verified')){
                                showResetPasswordBottomSheet(context);
                              }
                            },
                            child: Text('Confirm',style: TextStyle(
                                color: Colors.white
                            ),),
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
    });
  }

  void showResetPasswordBottomSheet(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (builder){

          return Container(

            height: 1.75*MediaQuery.of(context).size.height/3+MediaQuery.of(context).viewInsets.bottom/2,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0)),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    offset: Offset(0,-3),
                    blurRadius: 7.0, // soften the shadow
                    spreadRadius: 7.0,

                  )
                ]
            ),
            child: Container(


              // height: 2*MediaQuery.of(context).size.height/3,
              // width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(40.0),topLeft: Radius.circular(40.0)),
                  boxShadow: [
                    new BoxShadow(
                      color: Colors.grey.shade50,

                    )
                  ]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top:10.0,left: 30.0,right: 30.0,bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(height: 5.0,width: 60.0,color: Colors.grey,),
                    SizedBox(height: 50,),
                    Text('Reset Password',
                      style: GoogleFonts.ebGaramond(
                        textStyle: TextStyle(
                          fontSize: 45.0,
                          color:  Color(0xFF424d69),

                        ),
                      ),),
                    Container(
                      margin: EdgeInsets.only(top:10.0),
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          TextField(
                            autofocus:true,
                            style:TextStyle(color: Colors.black,fontSize: 20.0),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              hintText: 'New Password',
                              hintStyle: TextStyle(
                                color: Color(0xFF898f9e),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),

                                //borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),
                                //borderRadius: BorderRadius.circular(25.7),
                              ),

                            ),
                          ),

                          SizedBox(height: 30.0,),
                          TextField(

                            autofocus: true,
                            style:TextStyle(color: Colors.black,fontSize: 20.0),
                            cursorColor: Colors.black,
                            decoration: InputDecoration(

                              hintText: 'Confirm Password',
                              hintStyle: TextStyle(
                                color: Color(0xFF898f9e),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),

                                //borderRadius: BorderRadius.circular(25.7),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color:  Color(0xFF57668b),width: 4.0),
                                //borderRadius: BorderRadius.circular(25.7),
                              ),

                            ),
                          ),
                          SizedBox(height: 40.0,),
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

                                      borderRadius: BorderRadius.circular(20.0), // <-- Radius
                                    ),
                                    primary: Colors.green,

                                  ),
                                  onPressed: (){
                                    Navigator.pop(context);

                                  },
                                  child: Text('Confirm',style: TextStyle(
                                    fontSize: 25,
                                      color: Colors.white
                                  ),),
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
        });
  }
}
