import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/bathroomdoor1.dart';
import 'package:highrisers/2.0/pages/poojadoor1.dart';
import 'package:highrisers/2.0/pages/window0.dart';

import 'anyWoodNilai.dart';
import 'anyWoodNilai1.dart';
import 'anywoodDoor.dart';
import 'door0.dart';
import 'door1.dart';
import 'door2.dart';
import 'myNilai1.dart';
class poojadoor extends StatelessWidget {
  final users;
  const poojadoor({Key? key, required this.users}) : super(key: key);

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
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0,220.0,0.0,0.0),
              child: Center(
                child: Text(
                    'Pooja Doors',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'JosefinSans',

                        fontSize: 35.0)
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(50.0,50.0,0.0,0.0),
                  child: Container(
                    width: 130.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Container(
                      child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 175, 106, 4),
                          ),
                          child: Center(
                            child: Text('Order',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JosefinSans',

                                    fontSize: 22.0)
                            ),
                          ),
                          onPressed: () async{
                            users["poojadoor Title"] = "Pooja Doors";
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => poojadoor1(users:users))
                            );




                          }

                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20.0,50.0,0.0,0.0),
                  child: Container(
                    width: 130.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Container(
                      child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 175, 106, 4),
                          ),
                          child: Center(
                            child: Text('No',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JosefinSans',

                                    fontSize: 22.0)
                            ),
                          ),
                          onPressed: () async{
                            users["poojadoor Title"] = "Pooja Doors";
                            users["poojadoor Wood Name"] = "NA";
                            users["poojadoor No. of pieces"] = "NA";
                            users["poojadoors"] = [];

                            print(users);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => anyWoodDoor(users:users))
                            );




                          }

                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
    );
  }
}
