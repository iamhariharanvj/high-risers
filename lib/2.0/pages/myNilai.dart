import 'package:flutter/material.dart';

import 'anyWoodNilai.dart';
import 'anyWoodNilai1.dart';
import 'bedroomNilai.dart';
import 'myNilai1.dart';
import 'mynilai0.dart';
class myNilai extends StatelessWidget {
  final users;
  const myNilai({Key? key, required this.users}) : super(key: key);

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
                    'Main Nilai',
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
                      users["mainNilai Title"] = "Main Nilai";
                      users["bedroomNilai Title"] = "Border Nilai";
                      users["bedroomNilai Wood Name"] = "NA";
                      users["bedroomNilai No. of pieces"] = "NA";
                      users["bedroomNilais"] = [];
                      users["anyWoodNilai Title"] = "Border Nilai";
                      users["anyWoodNilai Wood Name"] = "NA";
                      users["anyWoodNilai No. of pieces"] = "NA";
                      users["anyWoodNilais"] = [];
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
                            child: Text('No',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'JosefinSans',

                                    fontSize: 22.0)
                            ),
                          ),
                          onPressed: () async{
                            users["mainNilai Title"] = "Main Nilai";
                            users["mainNilai Wood Name"] = "NA";
                            users["mainNilai No. of pieces"] = "NA";
                            users["mainNilais"] = [];
                            users["bedroomNilai Title"] = "Border Nilai";
                            users["bedroomNilai Wood Name"] = "NA";
                            users["bedroomNilai No. of pieces"] = "NA";
                            users["bedroomNilais"] = [];
                            users["anyWoodNilai Title"] = "Border Nilai";
                            users["anyWoodNilai Wood Name"] = "NA";
                            users["anyWoodNilai No. of pieces"] = "NA";
                            users["anyWoodNilais"] = [];
                            print(users);
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => bedroomNilai(users:users))
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
