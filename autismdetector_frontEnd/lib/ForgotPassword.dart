import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.bottomCenter,
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

                height: 2*MediaQuery.of(context).size.height/3,
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


                  height: 2*MediaQuery.of(context).size.height/3,
                  width: MediaQuery.of(context).size.width,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(height: 10.0,width: 60.0,color: Colors.grey,),
                        SizedBox(height: 75,),
                        Text('Forgot Password?',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.black,
                          ),),
                        Container(
                          margin: EdgeInsets.only(top:30.0),
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              TextField(
                                style:TextStyle(color: Colors.black,fontSize: 20.0),
                                decoration: InputDecoration(
                                  hintText: 'Email ID',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple,width: 4.0),

                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple,width: 4.0),
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
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0), // <-- Radius
                                      ),
                                      primary: Colors.green,

                                    ),
                                    onPressed: (){},
                                    child: Text('Submit',style: TextStyle(
                                        color: Colors.white
                                    ),),
                                  ),
                                ),
                              ),
                              SizedBox(height: 30.0,),
                              TextField(
                                style:TextStyle(color: Colors.black,fontSize: 20.0),
                                cursorColor: Colors.black,
                                decoration: InputDecoration(

                                  hintText: 'OTP',
                                  hintStyle: TextStyle(
                                    color: Colors.black,
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple,width: 4.0),

                                    //borderRadius: BorderRadius.circular(25.7),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple,width: 4.0),
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
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10.0), // <-- Radius
                                      ),
                                      primary: Colors.green,

                                    ),
                                    onPressed: (){},
                                    child: Text('Confirm',style: TextStyle(
                                        color: Colors.white
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
              )
    ]));
  }
}
