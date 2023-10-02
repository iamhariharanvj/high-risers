
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pdf/pdf.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io' as io;
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'package:http/http.dart' show get;



buildPrintableData(users) =>
  pw.SizedBox(
    height: 1000.0,
    child : pw.Padding(

  padding: const pw.EdgeInsets.all(15.00),
  child: pw.Column(
    children: [
      pw.SizedBox(height: 30.0,),
      pw.Center(
          child: pw.Text(
            "Personal details",
            style: pw.TextStyle(

                fontSize: 35.0),
          )
      ),
      pw.SizedBox(height: 20.0,),
      //users["ProfileImg"] == "NA"? Container() : Image.file(users["ProfileImg"],height: 150.0,width: 150.0,),
      pw.SizedBox(height: 20.0,),
      pw.Center(
        child: pw.Text(
          'Name : ' + users["Name"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),

      pw.Center(
        child: pw.Text(
          "Contact Number : " + users["ContactNo"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      pw.Center(
        child: pw.Text(
          "Door No : " + users["DoorNo"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      pw.Center(
        child: pw.Text(
          "Street : " + users["Street"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      pw.Center(
        child: pw.Text(
          "City : " + users["City"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      pw.Center(
        child: pw.Text(
          "Pincode : " + users["PinCode"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      // pw.Divider(
      //   color: Colors.black,
      // ),

      pw.SizedBox(height: 40.0,),
      pw.Center(
          child: pw.Text(
            "Order details",
            style: pw.TextStyle(


                fontSize: 35.0),
          )
      ),
      pw.SizedBox(height: 20.0,),
      pw.Center(
        child: pw.Text(
          "Order Id : " + users["OrderId"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      pw.Center(
        child: pw.Text(
          "Order Date : " + users["OrderDate"] ,
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 10.0,),
      pw.Center(
        child: pw.Text(
          "Due Date : " + users["DueDate"],
          style: pw.TextStyle(



              fontSize: 25.0),
        ),
      ),
      pw.SizedBox(height: 20.0,),
      // pw.Divider(
      //   color: Colors.black,



    ],
  ),



    ),
);

// drawImage() async{
//   var url = "https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885_1280.jpg";
//   var response = await get(Uri.parse(url));
//   var data = response.bodyBytes;
//   PdfBitmap image = PdfBitmap(data);
// //Draw image in page graphics
//   document.pages
//       .add()
//       .graphics
//       .drawImage(image, const Rect.fromLTWH(0, 0, 500, 200));
// }