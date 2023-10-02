


import 'dart:io' as io;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/pages/form.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:network_to_file_image/network_to_file_image.dart';

import 'details.dart';

class Date1 extends StatefulWidget {
  final String type;
  final String doorSize;
  final img;
  final String contact;
  const Date1({Key? key,this.img,required this.type,required this.doorSize,required this.contact}) : super(key: key);
  static String verify = "";
  @override
  State<Date1> createState() => _Date1State();
}

class _Date1State extends State<Date1> {
  TextEditingController countryController = TextEditingController();
  String _dueDate = "";
  late DatabaseReference databaseref;
  TextEditingController dateinput = TextEditingController();

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
  Future<io.File> fileFromDocsDir(String filename) async {
    io.Directory dir = await getApplicationDocumentsDirectory();
    String pathName = p.join(dir.path, filename);
    return io.File(pathName);
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
                "Enter the Due Date",
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
                    child: SizedBox(
                      height: 80.0,
                      child: Center(
                        child: TextFormField(
                            controller: dateinput, //editing controller of this TextField
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.calendar_today,
                                color: Color.fromARGB(255, 175, 106, 4),
                              ), //icon of text field
                              hintText: "Selct your Due Date" ,
                              labelText: 'Due Date',
                              labelStyle: TextStyle(
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
                            validator: (String? value){
                              if(value == null || value.isEmpty){
                                return "Please Select date";
                              }
                            },
                            readOnly: true,  //set it true, so that user will not able to edit text
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(

                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Color.fromARGB(255,250, 152, 5), // <-- SEE HERE
                                        onPrimary: Colors.white, // <-- SEE HERE
                                        onSurface: Colors.black, // <-- SEE HERE
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          primary: Colors.red, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              );
                              if(pickedDate != null ){
                                print(pickedDate);  //pickedDate output format => 2021-03-10 00:00:00.000
                                _dueDate = DateFormat('dd-MM-yyyy').format(pickedDate);
                                print(_dueDate); //formatted date output using intl package =>  2021-03-16
                                //you can implement different kind of Date Format here according to your requirement

                                setState(() {
                                  dateinput.text = _dueDate; //set output date to TextField value.
                                });
                              }
                            }
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
                    String? order;
                    String? date;
                    String? size;
                    String? orders;
                    String? name;
                    String? city;
                    String? orderid;
                    databaseref.get().then((snapshot) async {
                      for (final hospital in snapshot.children) {
                        if ((hospital
                            .child("ContactNo")
                            .value == widget.contact)) {
                          id = hospital.key;
                          order = hospital.child("OrderType").value as String?;
                          date = hospital.child("DueDate").value as String?;
                          size = hospital.child("Size").value as String?;
                          orders = hospital.child("Orders").value as String?;
                          name = hospital.child("Name").value as String?;
                          city = hospital.child("City").value as String?;
                          orderid = hospital.child("OrderId").value as String?;
                          flag = false;
                          break;
                        }
                      }
                      if(flag == false) {
                        print(id);

                        FirebaseStorage _storage = FirebaseStorage.instance;
                        databaseref
                            .child(id!)
                            .update({"OrderType": order! + " , " + widget.type,"DueDate" : date! + " , " + _dueDate , "Size" : size! + " , " + widget.doorSize,"Orders":(int.parse(orders!)+1).toString()});
                        var snapshot = _storage.ref()
                            .child("orders/order/$name/" + name!)
                            .putFile(widget.img);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => details(
                              oimage: widget.img,
                              type: (widget.type),
                              doorSize: widget.doorSize,
                              phno : widget.contact,
                              city : city,
                              name : name,
                              due : _dueDate,
                              id : orderid,
                            )));

                      } else {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => sForm(
                              img: widget.img,
                              type: (widget.type),
                              doorSize: widget.doorSize,
                              contact : widget.contact,
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
