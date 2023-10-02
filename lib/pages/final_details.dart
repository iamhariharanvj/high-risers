import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
class final_details extends StatefulWidget {
  final user;
  final index;
  final url,url1;
  final types,sizes,dates;
  final length;
  const final_details({Key? key,this.length,required this.user,required this.index,this.types,this.sizes,this.dates,required this.url,required this.url1}) : super(key: key);

  @override
  _final_detailsState createState() => _final_detailsState();
}

class _final_detailsState extends State<final_details> {
  late DatabaseReference databaseref;
  var downloadUrl;
  var downloadUrl1;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    databaseref = FirebaseDatabase.instance.ref().child('users');



  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(
            'High Risers',
            style: TextStyle(
              color: Colors.blueGrey[50],
              fontSize: 25.0,
              fontFamily: 'JosefinSans',
            ),
          ),
          backgroundColor: Color.fromARGB(255, 175, 106, 4),
        ),
        body:SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Center(
                  child: Text(
                    "Personal details",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 20.0,),
              Image.network(widget.url,width: 150.0,height: 150.0,),
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  'Name : ' + widget.user['Name'],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "City : " + widget.user['City'],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Contact Number : " + widget.user['ContactNo'],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 40.0,),
              Center(
                  child: Text(
                    "Order details",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 20.0,),
              Image.network(widget.url1,width: 150.0,height: 150.0,),
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  "Order Id : " + widget.user['OrderId'],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

       SizedBox(
                    height: 700,
                    child : ListView.builder(
                        itemCount: widget.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child : Column(

                            children : [

                            SizedBox(height: 20.0,),

                            SizedBox(height: 10.0,),
                            Center(
                              child: Text(
                                "Type : " + widget.types[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'JosefinSans',


                                    fontSize: 25.0),
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Center(
                              child: Text(
                                "Due Date : " + widget.dates[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'JosefinSans',


                                    fontSize: 25.0),
                              ),
                            ),
                            SizedBox(height: 10.0,),
                            Center(
                              child: Text(
                                "Size : " + widget.sizes[index],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'JosefinSans',


                                    fontSize: 25.0),
                              ),
                            ),
                            ],
                             ),
                          );

                        }),

              ),

              // SizedBox(height: 20.0,),
              // SizedBox(
              //   height: 50.0,
              //   child: ElevatedButton(
              //       style: ElevatedButton.styleFrom(
              //         primary: Colors.blueGrey[50],
              //       ),
              //       child: Center(
              //         child: Text('Back',
              //             style: TextStyle(
              //                 color: Color.fromARGB(255,225, 137, 5),
              //                 fontFamily: 'JosefinSans',
              //
              //                 fontSize: 22.0)
              //         ),
              //       ),
              //       onPressed: () async {
              //         Navigator.pop(context);
              //       }
              //
              //   ),
              //),
            ],
          ),
        )
    );
  }
}
