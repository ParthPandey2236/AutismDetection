import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class history extends StatefulWidget {
  @override
  _historyState createState() => _historyState();
}

var historyList = [
  ["456123a", "5456456a", "Positive"],
  ["456123a", "5456456a", "Negative"],
  ["456123a", "5456456a", "Negative"],
  ["456123a", "5456456a", "Negative"]
];

class _historyState extends State<history> {
  var isLoading = true;
  @override
  void initState() {
    // TODO: implement initState

    Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 40.0,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                // SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'History',
                    style: GoogleFonts.ebGaramond(
                      textStyle: TextStyle(
                        fontSize: 60.0,
                        color: Color(0xFF424d69),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                isLoading
                    ? Center(child: CircularProgressIndicator())
                    : Container(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 30, left: 30),
                          child: Container(
                            height:
                                1.3 * MediaQuery.of(context).size.height / 2,
                            width: double.infinity,
                            child: SingleChildScrollView(
                              child: ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: historyList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return Card(
                                      elevation: 8,
                                      shadowColor: Colors.grey.shade700,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(30.0)),
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height /
                                                5,
                                        width: double.infinity,
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Doctor ID: ' +
                                                    historyList[index][0],
                                                style: GoogleFonts.ebGaramond(
                                                  fontSize: 25,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Patient ID: ' +
                                                    historyList[index][1],
                                                style: GoogleFonts.ebGaramond(
                                                  fontSize: 25,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                'Status: ' +
                                                    historyList[index][2],
                                                style: GoogleFonts.ebGaramond(
                                                    fontSize: 25),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      )),
    );
  }
}
