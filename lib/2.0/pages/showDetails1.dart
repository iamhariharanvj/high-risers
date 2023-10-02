import 'dart:core';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:highrisers/widgets/printable_data.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:http/http.dart' show get;

class showDetails1 extends StatefulWidget {
  final users;
  const showDetails1({Key? key, required this.users}) : super(key: key);

  @override
  _showDetails1State createState() => _showDetails1State();
}

class _showDetails1State extends State<showDetails1> {
  late Map<String, List<Map<String, dynamic>>> images = {};


  var list = [
    "mainNilai",
    "bedroomNilai",
    "anyWoodNilai",
    "door",
    "bedroomdoor",
    "anyWoodDoor",
    "poojadoor",
    "window",
    "shutter",
    "loover"
  ];


  removeImage() {
    widget.users["ProfileImg"] = "";
    for (var key in widget.users.keys) {
      for (var key in list) {
        images["$key Orderimage"] = [];
        for (var item in widget.users[key + "s"]) {
          images["$key Orderimage"]!.add(
              {"Orderimage": item[key + " Orderimage"]});
          item[key + " Orderimage"] = "";
        }
      }
    }

    print("Users" + widget.users.toString());
  }

  @override
  void initState() {
    super.initState();
  }

  storeImage() async {
    FirebaseStorage _storage = FirebaseStorage.instance;

    for (var key in list) {
      if (images["$key Orderimage"] != null) {
        for (var item in images["$key Orderimage"]!) {
          var file = await File(item["Orderimage"]);
          try {
            var snapshot = _storage.ref()
                .child("orders/${widget.users["ContactNo"]}/$key Orderimage")
                .putFile(file);
            print("Store Success");
          } catch (e) {
            print(e);
          }
        }
      }
    }

    for (var key in images.keys) {
      if (key.endsWith(" Orderimage")) continue;
      for (var item in images[key]!) {
        widget.users[key] = widget.users[key] ?? [];
        widget.users[key].add(item);
      }
    }

    // Add other image entries as needed
  }

  List<Widget> buildImageList(String key) {
    return widget.users[key+ "s"] != null ?widget.users[key + "s"]!.map<Widget>((imageData) {
      if (imageData.containsKey(key + " Orderimae")) {
        final orderImage = imageData[key + " Orderimage"];
        if (orderImage != "NA") {
          return Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around each item
            child: Card(
              elevation: 3, // Add shadow
              child: Column(
                children: [
                  // Image.file(
                  //   File(orderImage),
                  //   height: 150.0,
                  //   width: 150.0,
                  // ),
                  SizedBox(height: 10.0),
                  ...imageData.entries.map<Widget>((entry) {
                    if (!entry.key.endsWith("Orderimage")) {
                      final lastKeyPart = entry.key.replaceAll(key, "");
                      final value = entry.value.toString() == ""
                          ? "NA"
                          : entry.value.toString();
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 12.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                lastKeyPart,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'JosefinSans',


                                    fontSize: 25.0),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                value,
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'JosefinSans',


                                    fontSize: 25.0),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return SizedBox();
                    }
                  }).toList(),
                  SizedBox(height: 20.0), // Add separation between items
                ],
              ),
            ),
          );
        }
      }
      return Padding(
        padding: const EdgeInsets.all(8.0), // Add padding around each item
        child: Card(
          elevation: 3, // Add shadow
          child: Column(
            children: [
              SizedBox(height: 10.0),
              ...imageData.entries.map<Widget>((entry) {
                if (!entry.key.endsWith("Orderimage")) {
                  final lastKeyPart = entry.key.replaceAll(key, "");
                  ;
                  final value = entry.value.toString() == ""
                      ? "NA"
                      : entry.value.toString().toUpperCase();
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 4.0, horizontal: 12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            lastKeyPart,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'JosefinSans',


                                fontSize: 25.0),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            value,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'JosefinSans',


                                fontSize: 25.0),

                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return SizedBox();
                }
              }).toList(),
              SizedBox(height: 20.0), // Add separation between items
            ],
          ),
        ),
      );
    }).toList() : [];
  }

  Widget buildList(List<String> keys) {
    return Column(
      children: keys.map((key) {
        List<String> otherAttributes = [];
        for (String attribute in widget.users.keys) {
          if (attribute.startsWith(key)) {
            if (attribute != key + "s") {
              otherAttributes.add(attribute);
            }
          }
        }
        return Column(
          children: [
            Text(
              widget.users[key + " Title"] != null ? widget.users[key +
                  " Title"] : "BEDROOM NILAI",
              style: TextStyle(
                  color: Color.fromARGB(255, 225, 137, 5),
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,

                  fontSize: 35.0),
            ),
            SizedBox(height: 20.0),
            ...otherAttributes.map((attribute) {
              final lastKeyPart = attribute.replaceAll(key, "");
              final value = widget.users[attribute].toString().toUpperCase() ==
                  ""
                  ? "NA"
                  : widget.users[attribute].toString().toUpperCase();

              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 4.0, horizontal: 12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        lastKeyPart,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'JosefinSans',
                            fontSize: 25.0),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        value,
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
            Column(children: buildImageList(key)),
            SizedBox(height: 20.0),

            Divider(color: Colors.black)

          ],
        );
      }).toList(),
    );
  }


  @override
  Widget build(BuildContext context) {
    print(widget.users['mainNilais']);
    return Scaffold(
      // Rest of the code remains the same
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
            // widget.users["ProfileImg"] == "NA"? Container() : Image.file(widget.users["ProfileImg"],height: 150.0,width: 150.0,),
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


            buildList(list),

            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: SizedBox(
                height: 50.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width - 100,
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
            // ... Display other fields as needed
          ],
        ),
      ),
    );
  }
}