import 'package:flutter/material.dart';

import 'anyWoodNilai.dart';
import 'anyWoodNilai1.dart';
import 'bedroomNilai1.dart';
import 'door.dart';
import 'myNilai1.dart';
import 'mynilai0.dart';
class bedroomNilai extends StatelessWidget {
  final users;
  const bedroomNilai({Key? key, required this.users}) : super(key: key);

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
                    'Bedroom Nilai',
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
                            users["bedroomNilai Title"]  = "Bedroom Nilai";
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => bedroomNilai1(users:users))
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
                            users["bedroomNilai Title"]  = "Bedroom Nilai";
                            users["bedroomNilai Wood Name"] = "NA";
                            users["bedroomNilai No. of pieces"] = "NA";
                            users["bedroomNilais"] = [];

                            print(users);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => anyWoodNilai(users:users))
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
