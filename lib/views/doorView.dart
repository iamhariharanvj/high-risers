import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/pages/form.dart';

import '../pages/contact.dart';
class doorView extends StatelessWidget {
  final img,type,doorSize;

  doorView({this.img,this.type,this.doorSize});
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
      body: ListView(
        children: [
          SizedBox(height: 20.0,),
          Center(
              child: Text(
                type,
                style: TextStyle(
                    color: Color.fromARGB(255,225, 137, 5),
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,

                    fontSize: 35.0),
              )
          ),
          SizedBox(height: 20.0,),
          Hero(
              tag: img,
              child: Image.file(img,width: 300.0,height: 300.0,)
          ),
          SizedBox(height: 20.0),
          Center(
            child: Text(doorSize,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'JosefinSans',

                    fontSize: 25.0)),
          ),
    SizedBox(height: 150.0,),
    Center(
    child: Container(
    width: MediaQuery.of(context).size.width - 50.0,
    height: 50.0,
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(25.0),
    color: Color(0xFFF17532)
    ),
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Colors.blueGrey[50],
      ),
      child: Center(
      child: Text('Order Now',
          style: TextStyle(
              color: Color.fromARGB(255,225, 137, 5),
              fontFamily: 'JosefinSans',

              fontSize: 22.0)
      ),
      ),
      onPressed: (){
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => Phone(img:img,type:type,doorSize:doorSize))
        );
      },
    ),
    ),
    ),
        ],
      ),

    );
  }
}
