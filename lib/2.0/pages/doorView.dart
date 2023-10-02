import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/bathroomdoor.dart';
import 'package:highrisers/2.0/pages/door1.dart';
import 'door2.dart';
import 'dart:io';

class doorView extends StatelessWidget {
  final Map<String, dynamic> users;
  final int index;

  doorView({required this.users, required this.index}); // Add 'required' keyword



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Main Nilai',
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
          SizedBox(height: 20.0),
          SizedBox(height: 20.0),
          Hero(
            tag: users["doors"][index]["door Orderimage"],
            child: Image.file(
              File(users["doors"][index]["door Orderimage"]),
              width: 300.0,
              height: 300.0,
            ),
          ),
          SizedBox(height: 150.0),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                color: Color(0xFFF17532),
              ),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey[50],
                  ),
                  child: Center(
                    child: Text(
                      'Order Now',
                      style: TextStyle(
                        color: Color.fromARGB(255, 225, 137, 5),
                        fontFamily: 'JosefinSans',
                        fontSize: 22.0,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (index+1 == users["door No. of pieces"]) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              bathroomdoor(users: users))
                      );
                    }
                    else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => door1(users: users, index: index+1),
                        ),
                      );
                    }
                  }

              ),
            ),
          ),
        ],
      ),
    );
  }
}
