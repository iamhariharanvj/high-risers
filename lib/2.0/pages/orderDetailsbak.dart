import 'dart:core';
import 'dart:io';
import 'dart:ui';

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

class details extends StatefulWidget {
  final users;
  const details({Key? key, required this.users}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {

  late Map<String,dynamic> images = {};
  late DatabaseReference databaseref;
  removeImage(users)
  {
    images["anyWoodDoor Orderimage"] = users["anyWoodDoor Orderimage"];
    images["anyWoodNilai Orderimage"] = users["anyWoodNilai Orderimage"];
    images["bedroomdoor Orderimage"] = users["bedroomdoor Orderimage"];
    images["door Orderimage"] = users["door Orderimage"];
    images["myNilai Orderimage"] = users["myNilai Orderimage"];
    images["poojadoor Orderimage"] = users["poojadoor Orderimage"];
    images["shutter Orderimage"] = users["shutter Orderimage"];
    images["window Orderimage"] = users["window Orderimage"];
    images["ProfileImg"] = users["ProfileImg"];
    widget.users.remove("anyWoodDoor Orderimage");
    widget.users.remove("anyWoodNilai Orderimage");
    widget.users.remove("bedroomdoor Orderimage");
    widget.users.remove("door Orderimage");
    widget.users.remove("myNilai Orderimage");
    widget.users.remove("poojadoor Orderimage");
    widget.users.remove("shutter Orderimage");
    widget.users.remove("window Orderimage");
    widget.users.remove("ProfileImg");
    widget.users.remove("loover Orderimage");
    print("Users" + widget.users.toString());
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    databaseref = FirebaseDatabase.instance.ref().child('users');


  }

  storeImage() async
  {
    FirebaseStorage _storage = FirebaseStorage.instance;
    var file = await File(images["anyWoodDoor Orderimage"]);
    var file1 = await File(images["anyWoodNilai Orderimage"]);
    try {
      var snapshot = _storage.ref()
          .child("orders/$widget.users[\"ContactNo\"]/" + "anyWoodDoor Orderimage")
          .putFile(file);

      print("hi");
    } catch (e){
      print(e);
    }
    try {
      var snapshot = _storage.ref()
          .child("orders/$widget.users[\"ContactNo\"]/" + "anyWoodNilai Orderimage")
          .putFile(file1);

      print("hi");
    } catch (e){
      print(e);
    }
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
              widget.users["ProfileImg"] == "NA"? Container() : Image.file(widget.users["ProfileImg"],height: 150.0,width: 150.0,),
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
                  "Door No : " + widget.users["DoorNo"].toString(),
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
                  "Wood Name : " + widget.users["MainNilai Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["MainNilai pieces"].toString() ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Size : " + widget.users["MainNilai size"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Grill Design : " + widget.users["MainNilai Grill Design"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Grill side : " + widget.users["MainNilai GrillSide"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Bottom Step : " + widget.users["MainNilai BottomStep"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["MainNilai Carving"] ,
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
                    "Bedroom Nilai",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["bedroom Orderimage"] == "NA"? Container() : Image.file(widget.users["bedroom Orderimage"],height: 150.0,width: 150.0,),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["bedroom Wood type"] ,
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

              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Border Nilai",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["anyWoodNilai Orderimage"] == "NA"? Container() : Image.file(widget.users["anyWoodNilai Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["anyWoodNilai Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["anyWoodNilai pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Top Size : " + widget.users["anyWoodNilai TopSize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Side size : " + widget.users["anyWoodNilai SideSize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Polish : " + widget.users["anyWoodNilai polish"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Carving : " + widget.users["anyWoodNilai Carving"] ,
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
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["door Orderimage"] == "NA"? Container() : Image.file(widget.users["door Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["door Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["door pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Size : " + widget.users["door size"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type : " + widget.users["doorType"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Polish : " + widget.users["door Polish"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["door Carving"] ,
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
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["poojadoor Orderimage"] == "NA"? Container() : Image.file(widget.users["poojadoor Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["bedroomdoor Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["bedroomdoor pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Size : " + widget.users["bedroomdoor size"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type : " + widget.users["bedroomdoortype"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type2 : " + widget.users["bedroomdoortype2"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Polish : " + widget.users["bedroomdoor Polish"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["bedroomdoor Carving"] ,
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
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["bedroomdoor Orderimage"] == "NA"? Container() : Image.file(widget.users["bedroomdoor Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["poojadoor Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["poojadoor pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Size : " + widget.users["poojadoor size"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Type : " + widget.users["poojadoorType"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Door Polish : " + widget.users["poojadoor Polish"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["poojadoor Carving"] ,
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
                    "Pooja Border Doors",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["anyWoodDoor Orderimage"] == "NA"? Container() : Image.file(widget.users["anyWoodDoor Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["anyWoodDoor Wood type"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["anyWoodDoor pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Top Size : " + widget.users["anyWoodDoor TopSize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Side size : " + widget.users["anyWoodDoor SideSize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Polish : " + widget.users["anyWoodDoor polish"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),

              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Carving : " + widget.users["anyWoodDoor Carving"] ,
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
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["shutter Orderimage"] == "NA"? Container() : Image.file(widget.users["shutter Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "No.of pieces : " + widget.users["shutter pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Glass: " + widget.users["shutter glass"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Thickness : " + widget.users["shutter thickness"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Size : " + widget.users["shutter doorsize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),



              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["shutter carving"] ,
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
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["window Orderimage"] == "NA"? Container() : Image.file(widget.users["window Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Wood Name : " + widget.users["windowType"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "No.of pieces : " + widget.users["window pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Window Log Size : " + widget.users["windowLogSize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Window Size : " + widget.users["windowSize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Window Type : " + widget.users["windowType"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),


              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["window Carving"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              SizedBox(height: 10.0,),
              Center(
                  child: Text(
                    "Loovers",
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontWeight: FontWeight.bold,

                        fontSize: 35.0),
                  )
              ),
              SizedBox(height: 10.0,),
              // widget.users["loover Orderimage"] == "NA"? Container() : Image.file(widget.users["loover Orderimage"],height: 150.0,width: 150.0,),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "No.of pieces : " + widget.users["loover pieces"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Log Size: " + widget.users["loover logsize"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),

              Center(
                child: Text(
                  "Size : " + widget.users["loover size"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),
              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Hole for a fan : " + widget.users["loover hole"] ,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',


                      fontSize: 25.0),
                ),
              ),


              SizedBox(height: 10.0,),
              Center(
                child: Text(
                  "Carving : " + widget.users["loover carving"] ,
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
                        child: Text('Save',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 22.0)
                        ),
                      ),
                      onPressed: () async => {
                        await removeImage(widget.users),
                        await storeImage(),
                        databaseref.push().set(widget.users),
                        // Navigator.of(context).push(
                        // MaterialPageRoute(builder: (context) => myhome())
                        // ),
                        printDoc(context)
                      }

                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Future<void> printDoc(context) async {
    final image = await imageFromAssetBundle(
      "images/bathroom.jpg",
    );

    final ByteData bytes = await rootBundle.load('images/bathroom.jpg');
    final font = await rootBundle.load("fonts/NotoSansTamil-Regular.ttf");
    pw.Font ttf = pw.Font.ttf(font);
    final doc = pw.Document();
    var url = "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;
    PdfBitmap image1 = PdfBitmap(data);


    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(widget.users);

        }));
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children : [
              pw.Center(
                  child: pw.Text(
                    "Main Nilai",
                    style: pw.TextStyle(

                        fontSize: 25.0),
                  )
              ),
              pw.SizedBox(height: 10.0,),
              // users["myNilai Orderimage"] == "NA"? Container() : Image.file(users["myNilai Orderimage"],height: 150.0,width: 150.0,),
              pw.Center(
                child: pw.Text(
                  "Wood type : " + widget.users["MainNilai Wood type"].toString() ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),

              pw.Center(
                child: pw.Text(
                  "No.of pieces : " + widget.users["MainNilai pieces"].toString() ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Size : " + widget.users["MainNilai size"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Grill Design : " + widget.users["MainNilai Grill Design"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Grill side : " + widget.users["MainNilai GrillSide"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Bottom Step : " + widget.users["MainNilai BottomStep"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Carving : " + widget.users["MainNilai Carving"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              // pw.Divider(
              //   color: Colors.black,
              // ),
              pw.Center(
                  child: pw.Text(
                    "Bedroom Nilai",
                    style: pw.TextStyle(

                        fontSize: 25.0),
                  )
              ),
              pw.SizedBox(height: 10.0,),
              //users["myNilai Orderimage"] == "NA"? Container() : Image.file(users["myNilai Orderimage"],height: 150.0,width: 150.0,),
              pw.Center(
                child: pw.Text(
                  "Wood type : " + widget.users["bedroom Wood type"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),

              pw.Center(
                child: pw.Text(
                  "No.of pieces : " + widget.users["bedroom pieces"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Size : " + widget.users["bedroom size"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Grill Design : " + widget.users["bedroom Grill Design"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Grill side : " + widget.users["bedroom GrillSide"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Bottom Step : " + widget.users["bedroom BottomStep"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                child: pw.Text(
                  "Carving : " + widget.users["bedroom Carving"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Center(
                  child: pw.Text(
                    "AnyWood Nilai",
                    style: pw.TextStyle(


                        fontSize: 25.0),
                  )
              ),
              pw.SizedBox(height: 10.0,),
              //users["anyWoodNilai Orderimage"] == "NA"? Container() : Image.file(users["anyWoodNilai Orderimage"],height: 150.0,width: 150.0,),
              pw.Center(
                child: pw.Text(
                  "Wood type : " + widget.users["anyWoodNilai Wood type"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),

              pw.Center(
                child: pw.Text(
                  "No.of pieces : " + widget.users["anyWoodNilai pieces"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
              pw.SizedBox(height: 10.0,),
              pw.Container(
                margin: pw.EdgeInsets.only(left: 200,bottom: 10.0),
                child : pw.Text(
                  "Order Id : " + widget.users["OrderId"] ,
                  style: pw.TextStyle(



                      fontSize: 20.0),
                ),
              ),
            ],
          );

        }));
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              children : [
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Top Size : " + widget.users["anyWoodNilai TopSize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Side size : " + widget.users["anyWoodNilai SideSize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Polish : " + widget.users["anyWoodNilai polish"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["anyWoodNilai Carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                    child: pw.Text(
                      "Doors",
                      style: pw.TextStyle(


                          fontSize: 25.0),
                    )
                ),
                pw.SizedBox(height: 10.0,),
                //users["door Orderimage"] == "NA"? Container() : Image.file(users["door Orderimage"],height: 150.0,width: 150.0,),
                pw.Center(
                  child: pw.Text(
                    "Wood type : " + widget.users["door Wood type"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "No.of pieces : " + widget.users["door pieces"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Size : " + widget.users["door size"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Type : " + widget.users["doorType"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Polish : " + widget.users["door Polish"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["door Carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                // Divider(
                //   color: Colors.black,
                // ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                    child: pw.Text(
                      "Bedroom Doors",
                      style: pw.TextStyle(


                          fontSize: 25.0),
                    )
                ),
                pw.SizedBox(height: 10.0,),
                //users["poojadoor Orderimage"] == "NA"? Container() : Image.file(users["poojadoor Orderimage"],height: 150.0,width: 150.0,),

                pw.Center(
                  child: pw.Text(
                    "Wood type : " + widget.users["bedroomdoor Wood type"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "No.of pieces : " + widget.users["bedroomdoor pieces"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Size : " + widget.users["bedroomdoor size"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Type : " + widget.users["bedroomdoortype"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Type2 : " + widget.users["bedroomdoortype2"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Polish : " + widget.users["bedroomdoor Polish"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["bedroomdoor Carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Container(
                  margin: pw.EdgeInsets.only(left: 200,bottom: 10.0),
                  child : pw.Text(
                    "Order Id : " + widget.users["OrderId"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
              ]
          );

        }));
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              children : [
                pw.SizedBox(height: 10.0,),
                pw.Center(
                    child: pw.Text(
                      "Pooja Doors",
                      style: pw.TextStyle(


                          fontSize: 25.0),
                    )
                ),
                pw.SizedBox(height: 10.0,),
                //users["bedroomdoor Orderimage"] == "NA"? Container() : Image.file(users["bedroomdoor Orderimage"],height: 150.0,width: 150.0,),

                pw.Center(
                  child: pw.Text(
                    "Wood type : " + widget.users["poojadoor Wood type"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "No.of pieces : " + widget.users["poojadoor pieces"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Size : " + widget.users["poojadoor size"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Type : " + widget.users["poojadoorType"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Door Polish : " + widget.users["poojadoor Polish"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["poojadoor Carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                // pw.Divider(
                //   color: Colors.black,
                // ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                    child: pw.Text(
                      "AnyWood Doors",
                      style: pw.TextStyle(


                          fontSize: 25.0),
                    )
                ),
                pw.SizedBox(height: 10.0,),
                //users["anyWoodDoor Orderimage"] == "NA"? Container() : Image.file(users["anyWoodDoor Orderimage"],height: 150.0,width: 150.0,),

                pw.Center(
                  child: pw.Text(
                    "Wood type : " + widget.users["anyWoodDoor Wood type"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "No.of pieces : " + widget.users["anyWoodDoor pieces"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Top Size : " + widget.users["anyWoodDoor TopSize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Side size : " + widget.users["anyWoodDoor SideSize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Polish : " + widget.users["anyWoodDoor polish"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["anyWoodDoor Carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                // Divider(
                //   color: Colors.black,
                // ),
                pw.SizedBox(height: 10.0,),
                pw.Container(
                  margin: pw.EdgeInsets.only(left: 200,bottom: 10.0),
                  child : pw.Text(
                    "Order Id : " + widget.users["OrderId"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
              ]
          );

        }));
    doc.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
              children : [
                pw.Center(
                    child: pw.Text(
                      "Shutters",
                      style: pw.TextStyle(


                          fontSize: 25.0),
                    )
                ),
                pw.SizedBox(height: 10.0,),
                //users["shutter Orderimage"] == "NA"? Container() : Image.file(users["shutter Orderimage"],height: 150.0,width: 150.0,),
                pw.Center(
                  child: pw.Text(
                    "No .of pieces: " + widget.users["shutter pieces"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Glass: " + widget.users["shutter glass"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "Thickness : " + widget.users["shutter thickness"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "Size : " + widget.users["shutter doorsize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),


                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["shutter carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                // Divider(
                //   color: Colors.black,
                // ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                    child: pw.Text(
                      "Windows",
                      style: pw.TextStyle(


                          fontSize: 25.0),
                    )
                ),
                pw.SizedBox(height: 10.0,),
                //users["window Orderimage"] == "NA"? Container() : Image.file(users["window Orderimage"],height: 150.0,width: 150.0,),

                pw.Center(
                  child: pw.Text(
                    "Wood type : " + widget.users["windowType"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),

                pw.Center(
                  child: pw.Text(
                    "No.of pieces : " + widget.users["window pieces"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child:pw.Text(
                    "Window Log Size : " + widget.users["windowLogSize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Window Size : " + widget.users["windowSize"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Window Type : " + widget.users["windowType"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),


                pw.SizedBox(height: 10.0,),
                pw.Center(
                  child: pw.Text(
                    "Carving : " + widget.users["window Carving"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),
                pw.Container(
                  margin: pw.EdgeInsets.only(left: 200,bottom: 10.0),
                  child : pw.Text(
                    "Order Id : " + widget.users["OrderId"] ,
                    style: pw.TextStyle(



                        fontSize: 20.0),
                  ),
                ),

              ]
          );

        }));

    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => doc.save());
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }
}
