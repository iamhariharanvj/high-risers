

import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/showOrders.dart';
import 'package:highrisers/2.0/pages/showOrders1.dart';
import 'package:highrisers/2.0/pages/window0.dart';

import 'anyWoodNilai1.dart';
import 'anywoodDoor1.dart';
import 'door.dart';
import 'myNilai1.dart';
class search extends StatelessWidget {
  final users;
  const search({Key? key, required this.users}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String _phno = "";
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,220.0,0.0,0.0),
                child: Column(
                  children: [
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left:15.0),
                        child:SizedBox(
                          height: 80.0,
                          width: MediaQuery.of(context).size.width-50.0,
                          child: Center(
                            child: TextFormField(
                              decoration: InputDecoration(
                                hintText: 'Enter your Phone Number',
                                labelText: 'Contact Number',
                                labelStyle: TextStyle(
                                  color: Color.fromARGB(255, 175, 106, 4),
                                ),
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Color.fromARGB(255, 175, 106, 4),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                errorStyle: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12.0,
                                ),
                                //labelText: 'Name',
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color.fromARGB(255, 175, 106, 4)),
                                  borderRadius: BorderRadius.circular(12.0),
                                ),

                              ),
                              maxLength: 10,
                              keyboardType: TextInputType.phone,
                              onChanged: (String? value){

                                _phno = value!;

                              },

                            ),
                          ),
                        ),
                      ),
                    ),

                SizedBox(height: 20.0,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 140.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: Container(
                      child:ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueGrey[50],
                          ),
                          child: Center(
                            child: Text('Search',
                                style: TextStyle(
                                    color: Color.fromARGB(255,225, 137, 5),
                                    fontFamily: 'JosefinSans',

                                    fontSize: 22.0)
                            ),
                          ),
                          onPressed: () async{
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => showOrders1(contact:_phno))
                            );


                          }

                      ),
                    ),
                  ),
                ),
                SizedBox(height: 200.0,),
    Padding(
      padding: const EdgeInsets.fromLTRB(130.0,0.0,0.0,0.0),
      child: Container(
      width: MediaQuery.of(context).size.width - 200.0,
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
      child: Text('Skip',
      style: TextStyle(
      color: Colors.blueGrey[50],
      fontFamily: 'JosefinSans',

      fontSize: 22.0)
      ),
      ),
      onPressed: () async{

          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => showOrders())
          );

      }

      ),
      ),

      ),
    ),
      ],
                ),
                  ),
                ],
              ),
        ),

        );

  }
}
