import 'dart:io';
import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/poojadoor2.dart';

import 'anywoodDoor.dart';

class poojaView extends StatelessWidget {
  final users;
  final index;
  poojaView({this.users, this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Pooja doors',
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
            tag: users["poojadoors"][index]["poojadoor Orderimage"],
            child: Image.file(
              File(users["poojadoors"][index]["poojadoor Orderimage"]),
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
                    if (index+1 == users["poojadoor pieces"]) {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) =>
                              anyWoodDoor(users: users))
                      );
                    }
                    else {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => poojadoor2(users: users, index: index+1),
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
