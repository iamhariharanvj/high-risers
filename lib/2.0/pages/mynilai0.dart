import 'package:flutter/material.dart';

import 'anyWoodNilai.dart';
import 'anyWoodNilai1.dart';
import 'myNilai1.dart';
class myNilai0 extends StatelessWidget {
  final users;
  const myNilai0({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(
            'Nilai',
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
                    'Nilai Type',
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
                            child: Text('Main Nilai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JosefinSans',

                                    fontSize: 22.0)
                            ),
                          ),
                          onPressed: () async{
                            users["Nilai type"] = "Main Nilai";
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => myNilai1(users:users))
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
                            child: Text('Bedroom Nilai',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JosefinSans',

                                    fontSize: 22.0)
                            ),
                          ),
                          onPressed: () async{
                            users["Nilai type"] = "Bedroom Nilai";
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => myNilai1(users:users))
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
