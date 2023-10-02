import 'dart:core';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highrisers/widgets/printable_data.dart';
import 'package:printing/printing.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' show get;
import 'package:syncfusion_flutter_pdf/pdf.dart';

class details extends StatelessWidget {
  final name, phno, city, due, type, doorSize, id;
  final File oimage;
  final File? pimage;
  final url;

  details(
      {required this.oimage, required this.type, required this.doorSize, this.pimage, required this.phno, required this.city, required this.name, required this.due, required this.id, this.url});

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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0,),
              Center(
                  child: Text(
                    "Personal details",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 20.0,),
              pimage == null ? Container() : Image.file(
                pimage!, height: 150.0, width: 150.0,),
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  'Name : ' + name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "City : " + city,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Contact Number : " + phno,
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
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 20.0,),
              Image.file(oimage, width: 150.0, height: 150.0,),
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  "Order Id : " + id,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Type : " + type,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Due Date : " + due,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 20.0,),
              SizedBox(
                height: 50.0,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueGrey[50],
                    ),
                    onPressed: () {  },
                    child: Center(
                      child: Text('Save',
                          style: TextStyle(
                              color: Color.fromARGB(255, 225, 137, 5),
                              fontFamily: 'JosefinSans',

                              fontSize: 22.0)
                      ),
                    ),

                ),
              ),
            ],
          ),
        )
    );
  }
}