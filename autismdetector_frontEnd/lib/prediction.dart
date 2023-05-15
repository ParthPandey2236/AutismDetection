import 'package:autismdetector/Login.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './Statistics.dart';
import './form.dart';
import 'lessthan3/motorDev.dart';
class predict extends StatefulWidget {
  bool check=false;

  predict(bool check){
    this.check=check;
  }
  @override
  _predictState createState() => _predictState();
}
var doctorID = "6846846846a",p_name = "Parth Pandey",p_gender = "Male" , status =prediction,patientId ="5641646a";

class _predictState extends State<predict> {

  @override
  Widget build(BuildContext context) {
    String results = calculateTheStatus(widget.check);
    return Scaffold(
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(icon:Icon(Icons.arrow_back),iconSize: 40.0,onPressed: (){Navigator.push(context,MaterialPageRoute(builder:(context)=> statistics()));},),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Analysis',
                      style: GoogleFonts.ebGaramond(
                        textStyle: TextStyle(
                          fontSize: 60.0,
                          color: Color(0xFF424d69),
                        ),
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.only(top:40,left: 30,right: 30,bottom: 30,),
                    child: Card(
                      elevation: 8,
                      shadowColor: Colors.grey.shade700,
                      shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(30.0) ),
                      child: Container(
                        height: 0.3*MediaQuery.of(context).size.height,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey.shade50,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 40,left: 30,right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Doctor ID: '+ doctor_id,style: GoogleFonts.ebGaramond(
                                fontSize: 20,
                              ),),
                              SizedBox(height: 10,),
                              Text('Patient ID: '+ patientId,style: GoogleFonts.ebGaramond(
                                fontSize: 20,
                              ),),

                              SizedBox(height: 30,),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20.0),
                                    color: results.contains("High")||results.contains("Severe")?Colors.red:Colors.green,
                                  ),
                                  child: Center(
                                    child: Text(results,style: TextStyle(
                                      fontSize: 20.0,
                                      color:Colors.white
                                    ),),
                                  ),
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String calculateTheStatus(bool check) {
    int value=0;
    for(String s in map.keys){
      value+=map[s]!.score;
    }
    map.clear();
    if(check){
      if(value>=30&&value<=60){
        return "Minimal to no risk";
      }
      else if(value>=61&&value<=90){
        return "Mild to Moderate Risk";
      }
      else if(value>=91&&value<=120){
        return "Moderate to High Risk";
      }
      else if(value>=121){
        return "Severe Risk";
      }
    }
    else{
      if(value>=101&&value<=202){
        return "Minimal to no risk";
      }
      else if(value>=203&&value<=303){
        return "Mild to Moderate Risk";
      }
      else if(value>=304&&value<=404){
        return "Moderate to High Risk";
      }
      else if(value>=405&&value<=505){
        return "Severe Risk";
      }
    }
    return "Incorrect Data";
  }
}
