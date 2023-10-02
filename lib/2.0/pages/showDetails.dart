import 'dart:core';
import 'dart:io';

import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highrisers/widgets/printable_data.dart';
import 'package:printing/printing.dart';
import 'package:google_language_fonts/google_language_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' show get;
import 'package:syncfusion_flutter_pdf/pdf.dart';

import 'myhome.dart';

class showDetails extends StatefulWidget {
  final users;
  const showDetails({Key? key, required this.users}) : super(key: key);

  @override
  _showDetailsState createState() => _showDetailsState();
}

class _showDetailsState extends State<showDetails> {


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
              //widget.users["ProfileImg"] == "NA"? Container() : Image.file(widget.users["ProfileImg"],height: 150.0,width: 150.0,),
              SizedBox(height: 20.0,),
              Center(
                child: Text(
                  'Name : ' + widget.users["Name"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Contact Number : " + widget.users["ContactNo"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door No : " + widget.users["DoorNo"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Street : " + widget.users["Street"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "City : " + widget.users["City"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Pincode : " + widget.users["PinCode"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
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
              Center(
                child: Text(
                  "Order Id : " + widget.users["OrderId"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Order Date : " + widget.users["OrderDate"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Due Date : " + widget.users["DueDate"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 20.0,),
              Divider(
                color: Colors.black,
              ),

              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Main Nilai",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["myNilai Orderimage"] == "NA"? Container() : Image.file(widget.users["myNilai Orderimage"],height: 150.0,width: 150.0,),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["MainNilai Wood type"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["MainNilai pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Size : " + widget.users["MainNilai size"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Grill Design : " + widget.users["MainNilai Grill Design"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Grill side : " + widget.users["MainNilai GrillSide"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Bottom Step : " + widget.users["MainNilai BottomStep"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["MainNilai Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),

              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Bedroom Nilai",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              widget.users["bedroom Orderimage"] == "NA"? Container() : Image.file(widget.users["bedroom Orderimage"],height: 150.0,width: 150.0,),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["bedroom Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["bedroom pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Size : " + widget.users["bedroom size"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Grill Design : " + widget.users["bedroom Grill Design"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Grill side : " + widget.users["bedroom GrillSide"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Bottom Step : " + widget.users["bedroom BottomStep"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["bedroom Carving"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "AnyWood Nilai",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["anyWoodNilai Orderimage"] == "NA"? Container() : Image.file(widget.users["anyWoodNilai Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["anyWoodNilai Wood type"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["anyWoodNilai pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Top Size : " + widget.users["anyWoodNilai TopSize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Side size : " + widget.users["anyWoodNilai SideSize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Polish : " + widget.users["anyWoodNilai polish"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Carving : " + widget.users["anyWoodNilai Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              SizedBox(height: 20.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Doors",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["door Orderimage"] == "NA"? Container() : Image.file(widget.users["door Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["door Wood type"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["door pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Size : " + widget.users["door size"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type : " + widget.users["doorType"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Polish : " + widget.users["door Polish"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["door Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Bedroom Doors",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["poojadoor Orderimage"] == "NA"? Container() : Image.file(widget.users["poojadoor Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["bedroomdoor Wood type"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["bedroomdoor pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Size : " + widget.users["bedroomdoor size"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type : " + widget.users["bedroomdoortype"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type2 : " + widget.users["bedroomdoortype2"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Polish : " + widget.users["bedroomdoor Polish"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["bedroomdoor Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Pooja Doors",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["bedroomdoor Orderimage"] == "NA"? Container() : Image.file(widget.users["bedroomdoor Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["poojadoor Wood type"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["poojadoor pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Size : " + widget.users["poojadoor size"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type : " + widget.users["poojadoorType"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Polish : " + widget.users["poojadoor Polish"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["poojadoor Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "AnyWood Doors",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["anyWoodDoor Orderimage"] == "NA"? Container() : Image.file(widget.users["anyWoodDoor Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["anyWoodDoor Wood type"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["anyWoodDoor pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Top Size : " + widget.users["anyWoodDoor TopSize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Side size : " + widget.users["anyWoodDoor SideSize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Polish : " + widget.users["anyWoodDoor polish"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Carving : " + widget.users["anyWoodDoor Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Shutters",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["shutter Orderimage"] == "NA"? Container() : Image.file(widget.users["shutter Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Glass: " + widget.users["shutter glass"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No .of pieces : " + widget.users["shutter pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Thickness : " + widget.users["shutter thickness"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Size : " + widget.users["shutter doorsize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),


              Center(
                child: Text(
                  "Carving : " + widget.users["shutter carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Windows",
                    style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              //widget.users["window Orderimage"] == "NA"? Container() : Image.file(widget.users["window Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood type : " + widget.users["windowType"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["window pieces"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Window Log Size : " + widget.users["windowLogSize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Window Size : " + widget.users["windowSize"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Window Type : " + widget.users["windowType"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),


              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["window Carving"],
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 30.0,),

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,20.0),
                child: SizedBox(
                  height: 50.0,
                  width: MediaQuery.of(context).size.width - 100,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey[50],
                      ),
                      child: Center(
                        child: Text('Back',
                            style: TextStyle(
                                color: Color.fromARGB(255, 225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 22.0)
                        ),
                      ),
                      onPressed: () async =>
                      {

                      Navigator.pop(context)
                      }

                  ),
                ),
              ),
            ],
          ),
        )
    );
  }


}
