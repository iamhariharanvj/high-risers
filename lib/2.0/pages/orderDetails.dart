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

class details extends StatefulWidget {
  final users;
  const details({Key? key, required this.users}) : super(key: key);

  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {
  late Map<String, List<Map<String, dynamic>>> images = {};

  late DatabaseReference databaseref;

  var list = ["mainNilai","bedroomNilai", "anyWoodNilai", "door", "bedroomdoor","anyWoodDoor","poojadoor", "window", "shutter", "loover"];


  removeImage() {
    for (var key in widget.users.keys) {

    for (var key in list) {
      images["$key Orderimage"] = [];
      for (var item in widget.users[key + "s"]) {
        images["$key Orderimage"]!.add({"Orderimage": item[key + " Orderimage"]});
        item[key + " Orderimage"] = "";
      }
    }

    }
    print("Users" + widget.users.toString());
  }

  @override
  void initState() {
    super.initState();
    databaseref = FirebaseDatabase.instance.ref().child('users');
  }

  storeImage() async {
    FirebaseStorage _storage = FirebaseStorage.instance;
    for (var key in list) {
      if (widget.users[key + "s"] != null) {
        for (var item in widget.users[key + "s"]!) {
          if (item["$key Orderimage"] != 'NA' && item["$key Orderimage"] != null) {
            try {
              var file = File(item["$key Orderimage"].toString());
              if (file.existsSync()) {
                var snapshot = await _storage
                    .ref()
                    .child("orders/${widget.users["ContactNo"]}/$key Orderimage")
                    .putFile(file);
                    print("Store Success");
              } else {
                print("File does not exist: ${item["$key Orderimage"]}");
              }
            } catch (e) {
              print("Error uploading file: $e");
            }
          }
        }
      } else {
        print(key);
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
    return widget.users[key + "s"]!.map<Widget>((imageData) {
      if (imageData.containsKey(key + " Orderimage")) {
        final orderImage = imageData[key + " Orderimage"];
        if (orderImage != "NA") {
          return Padding(
            padding: const EdgeInsets.all(8.0), // Add padding around each item
            child: Card(
              elevation: 3, // Add shadow
              child: Column(
                children: [
                  Image.file(
                    File(orderImage),
                    height: 150.0,
                    width: 150.0,
                  ),
                  SizedBox(height: 10.0),
                  ...imageData.entries.map<Widget>((entry) {
                    if (!entry.key.endsWith("Orderimage")) {
                      final lastKeyPart = entry.key.replaceAll(key, "");
                      final value = entry.value.toString() == ""
                          ? "NA"
                          : entry.value.toString();
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12.0),
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

                  final lastKeyPart = entry.key.replaceAll(key, "");;
                  final value = entry.value.toString() == ""
                      ? "NA"
                      : entry.value.toString().toUpperCase();
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12.0),
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
    }).toList();
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
              widget.users[key + " Title"] != null? widget.users[key + " Title"] :"BEDROOM NILAI",
              style: TextStyle(
                  color: Color.fromARGB(255,225, 137, 5),
                  fontFamily: 'JosefinSans',
                  fontWeight: FontWeight.bold,

                  fontSize: 35.0),
            ),
            SizedBox(height: 20.0),
            ...otherAttributes.map((attribute) {
              final lastKeyPart = attribute.replaceAll(key, "");
              final value = widget.users[attribute].toString().toUpperCase() == ""
                  ? "NA"
                  : widget.users[attribute].toString().toUpperCase();

              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 12.0),
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
            buildList(list),

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
                      // await removeImage(),
                      await storeImage(),
                      // await databaseref.push().set(widget.users),
                      // Navigator.of(context).push(MaterialPageRoute(builder:(context)=>myhome())),
                      print("Upload success"),
                      // printDoc(context),
                    }
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // Function to build the content for each key in the list
  pw.Widget buildContent(String key, Map<String, dynamic> userData) {
    final otherAttributes = <pw.Widget>[];
    for (String attribute in userData.keys) {
      if (attribute.startsWith(key) && attribute != key + "s") {
        final lastKeyPart = attribute.replaceAll(key, "").trim();
        final value = userData[attribute].toString().toUpperCase() == ""
            ? "NA"
            : userData[attribute].toString().toUpperCase();
        final row = pw.Padding(
          padding: pw.EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
          child: pw.Row(
            children: [
              pw.Expanded(
                child: pw.Text(
                  lastKeyPart,
                  style: pw.TextStyle(
                    color: PdfColors.black,
                    fontSize: 25.0,
                  ),
                ),
              ),
              pw.Expanded(
                child: pw.Text(
                  value,
                  textAlign: pw.TextAlign.right,
                  style: pw.TextStyle(
                    fontSize: 18.0,
                    color: PdfColors.black,
                  ),
                ),
              ),
            ],
          ),
        );
        otherAttributes.add(row);
      }
    }

    final imageList = buildPageList(key, userData);

    return pw.Column(
      children: [
        pw.Text(
          userData[key + " Title"] != null ? userData[key + " Title"] : "",
          style: pw.TextStyle(
            color: PdfColors.orange,
            fontWeight: pw.FontWeight.bold,
            fontSize: 35.0,
          ),
        ),
        pw.SizedBox(height: 20.0),
        ...otherAttributes,
        ...imageList,
        pw.SizedBox(height: 20.0),
        pw.Divider(color: PdfColors.black),
      ],
    );
  }

// Function to build the image list for a key
  List<pw.Widget> buildPageList(String key, Map<String, dynamic> userData) {
    final imageList = <pw.Widget>[];
    final imageDataList = userData[key + "s"] as List<dynamic>;
    for (final imageData in imageDataList) {

        final imageWidget = pw.Padding(
          padding: pw.EdgeInsets.all(8.0),
          child: pw.Container(
            child: pw.Column(
              children: [
                pw.SizedBox(height: 10.0),
                ...imageData.entries.map<pw.Widget>((entry) {
                  if (!entry.key.endsWith("Orderimage")) {
                    final lastKeyPart = entry.key.replaceAll(key, "").trim();
                    final value = entry.value.toString() == "" ? "NA" : entry.value.toString();
                    return pw.Padding(
                      padding: pw.EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
                      child: pw.Row(
                        children: [
                          pw.Expanded(
                            child: pw.Text(
                              lastKeyPart,
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          pw.Expanded(
                            child: pw.Text(
                              value,
                              textAlign: pw.TextAlign.right,
                              style: pw.TextStyle(
                                color: PdfColors.black,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return pw.SizedBox();
                  }
                }).toList(),
                pw.SizedBox(height: 20.0),
              ],
            ),
          ),
        );
        imageList.add(imageWidget);
    }

    return imageList;
  }

// Function to build the document using the keys list
  pw.Document buildDocument(List<String> keys) {
    final document = pw.Document();

    document.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return buildPrintableData(widget.users);
        }));

    for (final key in keys) {
      final content = buildContent(key, widget.users);
      document.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) => content,
        ),
      );
    }
    return document;
  }

  Future<void> printDoc(context) async {
    final image = await imageFromAssetBundle(
      "images/bathroom.jpg",
    );

    final ByteData bytes = await rootBundle.load('images/bathroom.jpg');
    final font = await rootBundle.load("fonts/NotoSansTamil-Regular.ttf");
    pw.Font ttf = pw.Font.ttf(font);
    var url = "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg";
    var response = await get(Uri.parse(url));
    var data = response.bodyBytes;

    final doc = buildDocument(list);


await Printing.layoutPdf(
    onLayout: (PdfPageFormat format) async => doc.save());
    Navigator.popUntil(context, ModalRoute.withName('/home'));
  }
}
