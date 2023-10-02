import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/showDetails1.dart';

class showOrders extends StatefulWidget {
  const showOrders({Key? key}) : super(key: key);

  @override
  _showOrdersState createState() => _showOrdersState();
}

class _showOrdersState extends State<showOrders> {
  late DatabaseReference databaseref;
  var list = [];
  bool searchState = false;
  String _phno = "";
  Map<String,String> users = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseref = FirebaseDatabase.instance.ref().child('users');
  }



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
        body: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: SizedBox(
            height: MediaQuery
                .of(context)
                .size
                .height,
            child:

            SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 10.0,),
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    child: ListView(
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      children: [
                        SizedBox(
                          height: MediaQuery
                              .of(context)
                              .size
                              .height,
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          child: FirebaseAnimatedList(
                            query: databaseref,
                            itemBuilder: (BuildContext context,
                                DataSnapshot snapshot, Animation<
                                    double> animation, int index) {

                              dynamic user = snapshot.value; // Get the raw value

                              if (user is Map) {
                                user['key'] = snapshot.key;
                                list.add(user);

                                print(user.length);
                              }
                              else {
                                return SizedBox();
                              }

                              return Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height: 90.0,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 50.0, top: 8.0),
                                      child: ListTile(
                                        //leading: Text(snap['age'].toString()),
                                        //leading: Icon(Icons.edit),
                                          title: Text(user['Name'].toString(),
                                            style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontSize: 20.0,
                                            ),
                                          ),
                                          subtitle: Text(
                                            "\nOrder Id : " +
                                                user['OrderId'].toString(),
                                            style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontSize: 15.0,
                                            ),),
                                          onTap: () async {
                                            FirebaseStorage _storage = FirebaseStorage
                                                .instance;



                                            //print(types);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      showDetails1(users: user),
                                                ));
                                          }
                                        //trailing: Icon(Icons.delete),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },

                          ),
                        ),
                      ],
                    ),

                  ),

                ],

              ),
            ),
          ),

        )
    );
  }
}
