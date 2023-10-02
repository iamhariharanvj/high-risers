


import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/pages/form.dart';

import 'date.dart';

class Phone extends StatefulWidget {
  final String type;
  final String doorSize;
  final img;
  const Phone({Key? key,this.img,required this.type,required this.doorSize}) : super(key: key);
  static String verify = "";
  @override
  State<Phone> createState() => _PhoneState();
}

class _PhoneState extends State<Phone> {
  TextEditingController countryController = TextEditingController();
  String phone = "";
  late DatabaseReference databaseref;

  @override
  void initState() {
    // TODO: implement initState
    countryController.text = "+91";
    databaseref = FirebaseDatabase.instance.ref().child('users');
    super.initState();
    // FirebaseAuth.instance
    //     .idTokenChanges()
    //     .listen((User? user) {
    //   if (user == null) {
    //     print('User is currently signed out!');
    //   } else {
    //     Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    //   }
    // });
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
      body: Container(
        margin: EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/img1.png',
                width: 150,
                height: 150,
              ),

              SizedBox(
                height: 25,
              ),
              Text(
                "Enter your Contact Number",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 30,
              ),
          Container(
              child: Padding(
                padding: const EdgeInsets.only(left:15.0),
                child:SizedBox(
                  height: 80.0,
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
                      validator: (String? value){
                        if(value == null || value.isEmpty)
                          return "Please Enter your Contact Number";
                        if(value.length != 10)
                          {
                            return "Enter valid Phone Number";
                          }
                      },
                      keyboardType: TextInputType.phone,
                      onChanged: (String? value){

                        phone = value!;
                        print(phone);
                      },

                    ),
                  ),
                ),
              ),
            ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey[50],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      bool flag = true;
                      String? id;
                      String? val;
                      databaseref.get().then((snapshot) {
                        for (final hospital in snapshot.children) {
                          if ((hospital
                              .child("ContactNo")
                              .value == phone)) {
                            id = hospital.key;
                            val = hospital.child("OrderType").value as String?;
                            flag = false;
                            break;
                          }
                        }
                         if(flag == false) {
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (context) => Date1(img:widget.img,type:widget.type,doorSize:widget.doorSize,contact:phone))
                           );
                          print(id);
                          // databaseref
                          //     .child(id!)
                          //     .update({"OrderType": val! + "hari"});

                      } else {
                           Navigator.of(context).push(
                               MaterialPageRoute(builder: (context) => sForm(
                                   img: widget.img,
                                   type: (widget.type),
                                   doorSize: widget.doorSize,
                                 contact : phone,
                               ))
                           );
                         }
                      }, onError: (error) {
                        print('Error');
                      });


                    },



                    child: Text("Next",
                        style: TextStyle(
                            color: Color.fromARGB(255,225, 137, 5),
                            fontFamily: 'JosefinSans',

                            fontSize: 22.0)),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}