import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'final_details.dart';
class order_details extends StatefulWidget {
  const order_details({Key? key}) : super(key: key);

  @override
  _order_detailsState createState() => _order_detailsState();
}

class _order_detailsState extends State<order_details> {
  late DatabaseReference databaseref;
  var list = [];
  bool searchState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    databaseref = FirebaseDatabase.instance.ref().child('users');
  }

  createAlertDialog(BuildContext context, Map user, int i) {
    return showDialog(context: context, builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 130.0),
        child: ListView(
          children: [AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0)),

            title: Text(
                'Order Details',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromARGB(255, 225, 137, 5),
                    fontFamily: 'JosefinSans',

                    fontSize: 30.0)
            ),
            actions: <Widget>[
              Column(
                children: [
                  SizedBox(height: 15.0,),
                  Text(
                      'Order Id : ' + user['OrderId'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'JosefinSans',

                          fontSize: 22.0)
                  ),
                  SizedBox(height: 15.0,),
                  Text(
                      'Name : ' + user['Name'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'JosefinSans',

                          fontSize: 22.0)
                  ),
                  SizedBox(height: 15.0,),
                  Text('Contact No : ' + user['ContactNo'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'JosefinSans',

                          fontSize: 22.0)
                  ),
                  SizedBox(height: 15.0,),
                  Text('Due Date ' + user['DueDate'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'JosefinSans',

                          fontSize: 22.0)
                  ),
                  SizedBox(height: 15.0,),
                  Text('City : ' + user['City'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'JosefinSans',

                          fontSize: 22.0)
                  ),
                  SizedBox(height: 15.0,),
                  Center(

                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[50],
                        ),
                        child: Text(
                            'Back',
                            style: TextStyle(
                                color: Color.fromARGB(255, 225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 22.0)
                        ),

                        onPressed: () async {
                          Navigator.pop(context);
                        }

                    ),

                  ),
                  SizedBox(height: 10.0,),
                ],
              ),

            ],
          ),
          ],
        ),
      );
    });
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
                              Map user = snapshot.value as Map;
                              user['key'] = snapshot.key;
                              list.add(user);


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
                                            "\nNo of orders : " +
                                                user['Orders'].toString(),
                                            style: TextStyle(
                                              fontFamily: 'JosefinSans',
                                              fontSize: 15.0,
                                            ),),
                                          onTap: () async {
                                            FirebaseStorage _storage = FirebaseStorage
                                                .instance;
                                            String name = user['Name'];
                                            print(name);
                                            var types = user['OrderType'].split(',');
                                            var dates = user['DueDate'].split(',');
                                            var sizes = user['Size'].split(',');
                                            print(types[0]);
                                            var downloadUrl = await _storage
                                                .ref(
                                                "orders/people/$name/" + user['Name'])
                                                .getDownloadURL();

                                            var downloadUrl1 = await _storage
                                                .ref(
                                                "orders/order/$name/" + user['Name'])
                                                .getDownloadURL();

                                            int n = int.parse(user['Orders']);
                                            print(types);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      final_details(
                                                          user: user,
                                                          index: index,
                                                          types : types,
                                                          dates : dates,
                                                          sizes : sizes,
                                                          length:n,
                                                          url: downloadUrl,
                                                          url1: downloadUrl1),
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
//  SearchMethod(String text) {
//     var l = [];
//     for(int i = 0;i<list.length;i++)
//       {
//         for (final mapEntry in list[i].entries) {
//
//           final key = mapEntry.key;
//           final value = mapEntry.value;
//           if(key == 'Name' && value == text)
//             {
//               l.add(list[i]);
//           }
//         }
//       }
//     print(l);
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: ListView(
//               shrinkWrap: true,
//               scrollDirection : Axis.vertical,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                   child: FirebaseAnimatedList(
//                     query: databaseref,
//                     itemBuilder: (BuildContext context,DataSnapshot snapshot,Animation<double> animation , int index){
//                       Map user = snapshot.value as Map;
//                       user['key'] = snapshot.key;
//                       list.add(user);
//
//                             return Padding(
//                               padding: const EdgeInsets.all(2.0),
//                               child: SizedBox(
//                                 height: 90.0,
//                                 child: Card(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(
//                                         left: 50.0, top: 8.0),
//                                     child: ListTile(
//                                       //leading: Text(snap['age'].toString()),
//                                       //leading: Icon(Icons.edit),
//                                         title: Text(user['Name'].toString(),
//                                           style: TextStyle(
//                                             fontFamily: 'JosefinSans',
//                                             fontSize: 20.0,
//                                           ),
//                                         ),
//                                         subtitle: Text(
//                                           "\nDue Date : " +
//                                               user['DueDate'].toString(),
//                                           style: TextStyle(
//                                             fontFamily: 'JosefinSans',
//                                             fontSize: 15.0,
//                                           ),),
//                                         onTap: () async {
//                                           FirebaseStorage _storage = FirebaseStorage
//                                               .instance;
//                                           var downloadUrl = await _storage.ref(
//                                               "orders/people/" + user['Name'])
//                                               .getDownloadURL();
//                                           var downloadUrl1 = await _storage.ref(
//                                               "orders/order/" + user['Name'])
//                                               .getDownloadURL();
//                                           Navigator.push(
//                                               context,
//                                               MaterialPageRoute(
//                                                 builder: (context) =>
//                                                     final_details(
//                                                         user: user,
//                                                         index: index,
//                                                         url: downloadUrl,
//                                                         url1: downloadUrl1),
//                                               ));
//                                         }
//                                       //trailing: Icon(Icons.delete),
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             );
//                           }
//
//
//                     },
//
//
//                   ),
//                 ),
//               ],
//             ),
//
//           ),
//
//         ],
//
//       ),
//     );
//     return "hi";
//   }
// }
//
//
//
//
//
