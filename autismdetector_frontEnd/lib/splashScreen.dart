//import 'dart:html';
import 'dart:async';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:autismdetector/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
class splashSreen extends StatefulWidget {
  @override
  _splashSreenState createState() => _splashSreenState();
}

class _splashSreenState extends State<splashSreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginScreen()
            )
        )
    );
  }
  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: Container(
    //     height: double.infinity,
    //     width: double.infinity,
    //     decoration: BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [
    //           const Color(0xFF3366FF),
    //           const Color(0xFF00CCFF),
    //         ]
    //       )
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Container(
    //           height: 20,
    //           width: 10,
    //           decoration: BoxDecoration(
    //               color: Colors.transparent,
    //               shape: BoxShape.rectangle
    //           ),
    //         ),
    //         Text('Autism Detection',
    //         textAlign: TextAlign.center,
    //         style: TextStyle(
    //           fontSize: 50.0,
    //           color: Colors.white,
    //         ),),
    //         // Container(
    //         //   margin: EdgeInsets.all(2.0),
    //         //   padding: EdgeInsets.only(left: 2.0,right:2.0, top : 5.0 , bottom: 10.0),
    //         //
    //         //   decoration: BoxDecoration(
    //         //       //color: Colors.deepPurpleAccent,
    //         //     border: Border(
    //         //       top: BorderSide(width: 2.0 , style: BorderStyle.solid,color: Colors.deepPurpleAccent,),
    //         //       bottom: BorderSide(width: 2.0 , style: BorderStyle.solid,color: Colors.deepPurpleAccent,),
    //         //     )
    //         //   ),
    //         // )
    //         Padding(
    //           padding: EdgeInsets.all(10.0),
    //           child: SizedBox(
    //
    //             child: CustomPaint(
    //               size: Size(MediaQuery.of(context).size.width,50),
    //               painter: RecPainter()
    //             ),
    //           ),
    //         )
    //       ],
    //     ),
    //   ),
    //   //nextScreen: LoginScreen(),
    // );
    return AnimatedSplashScreen(
      centered: true,
        splash:Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Container(
                //   height: 20,
                //   width: 10,
                //   decoration: BoxDecoration(
                //       color: Colors.transparent,
                //       shape: BoxShape.rectangle
                //   ),
                // ),
                Text('Autism Detection',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.blue,
                ),),

                // Container(
                //   margin: EdgeInsets.all(2.0),
                //   padding: EdgeInsets.only(left: 2.0,right:2.0, top : 5.0 , bottom: 10.0),
                //
                //   decoration: BoxDecoration(
                //       //color: Colors.deepPurpleAccent,
                //     border: Border(
                //       top: BorderSide(width: 2.0 , style: BorderStyle.solid,color: Colors.deepPurpleAccent,),
                //       bottom: BorderSide(width: 2.0 , style: BorderStyle.solid,color: Colors.deepPurpleAccent,),
                //     )
                //   ),
                // )
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: CustomPaint(
                      size: Size(MediaQuery.of(context).size.width,50),
                      painter: RecPainter()
                    ),
                  ),
                )
              ],
            ),
        splashIconSize: 100,
        nextScreen: LoginScreen(),
    duration: 2500,);
  }
}

class RecPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.deepPurpleAccent
      ..strokeWidth = 15;
    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);
    var path = Path();

    path.moveTo(size.width*0.25, size.height * 0.7);
    // path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
    //     //     size.width * 0.5, size.height * 0.8);
    //     // path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
    //     //     size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width*0.75, size.height * 0.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(size.width*0.25, size.height * 0.7);
    canvas.drawPath(path, paint);
    //canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
