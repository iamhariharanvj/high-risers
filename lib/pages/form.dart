import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/pages/details.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'home.dart';
class sForm extends StatefulWidget {
  final String type;
  final String doorSize;
  final File img;
  final String contact;


  const sForm({Key? key,required this.img,required this.type,required this.doorSize, required this.contact}) : super(key: key);

  @override
  _sFormState createState() => _sFormState();
}

class _sFormState extends State<sForm> {

  late DatabaseReference databaseref;
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    databaseref = FirebaseDatabase.instance.ref().child('users');

  }
  String _name = "";
  String _phno = "";
  String _dueDate = "";
  String _doorNo = "";
  String _street = "";
  String _city = "";
  String _pinCode = "";
  TextEditingController dateinput = TextEditingController();



  File? _image;

  Future getImage(bool isCamera) async {
    File? image;
    XFile i;
    if (isCamera) {
      i = (await ImagePicker().pickImage(source: ImageSource.camera))!;
      image = File(i.path);
    }
    else {
      i = (await ImagePicker().pickImage(source: ImageSource.gallery))!;
      image = File(i.path);
    }

    setState(() {
      _image = image;
    });
  }
  String _orderId = "";
  String order()
  {
    _orderId = "";
    _orderId += "#";
    _orderId += widget.contact.substring(0,5);
    Random random = new Random();
    int randomNumber = random.nextInt(100000);
    _orderId += randomNumber.toString();
    return _orderId;
  }


  createAlertDialog(BuildContext context){
    return showDialog(context:context,builder: (context){
      return Padding(
        padding: const EdgeInsets.only(top: 130.0),
        child: ListView(
          children: [AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),

              title:Text(
                  'Successful!',
                      textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',

                      fontSize: 30.0)
              ),
              actions: <Widget>[
                Column(
                  children: [
                    Image.file(widget.img!,width: 150.0,height: 150.0,),
                    SizedBox(height: 13.0,),
                    Text(
                        'Order Id : ' + order(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'JosefinSans',

                            fontSize: 22.0)
                    ),
                    SizedBox(height: 13.0,),
                    Text(
                        'Name : ' + _name,
                      textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'JosefinSans',

                            fontSize: 22.0)
                    ),
                    SizedBox(height: 13.0,),
                    Text('Contact No : ' + _phno,
                      textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'JosefinSans',

                            fontSize: 22.0)
                    ),
                    SizedBox(height: 13.0,),
                    Text('Due Date ' + _dueDate,
                      textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: 'JosefinSans',

                            fontSize: 22.0)
                    ),
                    SizedBox(height: 13.0,),
                    Center(

                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blueGrey[50],
                        ),
                        child: Text(
                            'Confirm',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 22.0)
                        ),

                        onPressed: () async {
                          FirebaseStorage _storage = FirebaseStorage.instance;
                          var file = await File(widget.img.path);
                          var file1 = await File(_image!.path);

                          // Reference reference = _storage.ref().child("orders/" + _name);
                          // String imageUrl = await reference.getDownloadURL();
                          // print(imageUrl);
                          String url = "" ;
                          //Upload the file to firebase
                          // UploadTask uploadTask = reference.putFile(file);
                          // uploadTask.whenComplete(() {
                          //   url = reference.getDownloadURL() as String;
                          // });
                          //   print(url);
                          try {
                            var snapshot = _storage.ref()
                                .child("orders/order/$_name/" + _name)
                                .putFile(file);

                            print("hi");
                          } catch (e){
                            print(e);
                          }
                          try {
                            var snapshot1 = _storage.ref()
                                .child("orders/people/$_name/" + _name)
                                .putFile(file1);

                          } catch (e){
                            print(e);
                          }


      // setState(() {
      // imageUrl = downloadUrl;
      // });


                          Map<String,String> users = {
                            'Name' : _name,
                            'ContactNo' : widget.contact,
                            'DueDate' : _dueDate,
                            'City' : _city,
                            'OrderId' : _orderId,
                            'OrderType' : widget.type,
                            'Size' : widget.doorSize,
                            'Orders' : "1",
                          };
                          await databaseref.push().set(users);

                          await Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => details(
                                oimage: widget.img,
                                type: (widget.type),
                                doorSize: widget.doorSize,
                                pimage : _image!,
                                phno : widget.contact,
                                city : _city,
                                name : _name,
                                due : _dueDate,
                                id : _orderId,
                              )));
                          _orderId = "";
                      },

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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    //final _dbref = FirebaseDatabase.instance.reference();
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
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.all(24),
            child: Column(
              children: [
                Text(
                  'User Details',
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',

                        fontSize: 30.0)
                ),
                SizedBox(height: 10.0,),

                SizedBox(height: 20.0,),
            Row(
              children: [
                Text(
                    'Profile picture : ',
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',

                        fontSize: 30.0)
                ),
                SizedBox(
                  width: 80.0,
                  child:  IconButton(
                    icon: Icon(
                      Icons.camera_alt,
                      color: Color.fromARGB(255, 175, 106, 4),
                    ),

                    onPressed: (){
                          getImage(true);
                    },
                  ),
                ),
              ],
            ),
            _image == null? Container() : Image.file(_image!,height: 150.0,width: 150.0,),
            SizedBox(height: 20.0,),
            Container(

              child: Padding(
                padding: const EdgeInsets.only(left:15.0),
                child: SizedBox(
                  height: 80.0,
                  child: Center(
                    child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter your Name',
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Color.fromARGB(255, 175, 106, 4),
                          ),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Color.fromARGB(255, 175, 106, 4),
                          ),
                          //labelText: 'Name',
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
                          if(value == null || value.isEmpty)
                            return "Please Enter your name";
                        },
                        onSaved: (String? value){
                          _name = value!;
                          print(_name);
                        },
                      ),
                    ),
                  ),
                ),
            ),
            //     SizedBox(height: 20.0,),
            // Container(
            //   child: Padding(
            //     padding: const EdgeInsets.only(left:15.0),
            //     child:SizedBox(
            //       height: 80.0,
            //       child: Center(
            //         child: TextFormField(
            //           decoration: InputDecoration(
            //             hintText: 'Enter your Phone Number',
            //             labelText: 'Contact Number',
            //             labelStyle: TextStyle(
            //               color: Color.fromARGB(255, 175, 106, 4),
            //             ),
            //             prefixIcon: Icon(
            //               Icons.phone,
            //               color: Color.fromARGB(255, 175, 106, 4),
            //             ),
            //             errorBorder: OutlineInputBorder(
            //               borderSide: BorderSide(color: Colors.red),
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //             focusedErrorBorder: OutlineInputBorder(
            //               borderSide: BorderSide(color: Colors.red),
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //             errorStyle: TextStyle(
            //               color: Colors.red,
            //               fontSize: 12.0,
            //             ),
            //             //labelText: 'Name',
            //             enabledBorder: OutlineInputBorder(
            //               borderSide: BorderSide(color: Colors.black),
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //             focusedBorder: OutlineInputBorder(
            //               borderSide: BorderSide(color: Color.fromARGB(255, 175, 106, 4)),
            //               borderRadius: BorderRadius.circular(12.0),
            //             ),
            //
            //           ),
            //           maxLength: 10,
            //           validator: (String? value){
            //             if(value == null || value.isEmpty)
            //               return "Please Enter your Contact Number";
            //             if(value.length != 10)
            //               {
            //                 return "Enter valid Phone Number";
            //               }
            //           },
            //           keyboardType: TextInputType.phone,
            //           onSaved: (String? value){
            //             _phno = value!;
            //           },
            //
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
                SizedBox(height: 20.0,),

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
                SizedBox(height: 10.0,),
                Divider(
                  color: Colors.black,
                ),
                SizedBox(height: 20.0,),
                Text(
                  'Address',
                  textAlign: TextAlign.center,
                  style:  TextStyle(
                        color: Colors.black,
                        fontFamily: 'JosefinSans',

                        fontSize: 30.0)
                ),
                SizedBox(height: 10.0,),
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20.0,),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: SizedBox(
                        height: 80.0,
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter you Door No',
                              labelText: 'Door No',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 175, 106, 4),
                              ),
                              //labelText: 'Name',
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
                            onSaved: (String? value){
                              _doorNo = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(

                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: SizedBox(
                        height: 80.0,
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Street Name',
                              labelText: 'Street ',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 175, 106, 4),
                              ),
                              //labelText: 'Name',
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
                            onSaved: (String? value){
                              _street = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(

                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: SizedBox(
                        height: 80.0,
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your City',
                              labelText: 'City',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 175, 106, 4),
                              ),
                              //labelText: 'Name',
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
                              if(value == null || value.isEmpty)
                                return "Please Enter your City";
                            },
                            onSaved: (String? value){
                              _city= value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Container(

                    child: Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: SizedBox(
                        height: 80.0,
                        child: Center(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Enter your Pin Code',
                              labelText: 'Pin Code',
                              labelStyle: TextStyle(
                                color: Color.fromARGB(255, 175, 106, 4),
                              ),
                              //labelText: 'Name',
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
                            maxLength: 6,
                            keyboardType: TextInputType.phone,
                            onSaved: (String? value){
                              _pinCode = value!;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                SizedBox(height: 20.0,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 50.0,
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
                        child: Text('Order',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 22.0)
                        ),
                      ),
                        onPressed: () async{

                          _formKey.currentState?.save();
                          if((_formKey.currentState!.validate())){
                            //await Firebase.initializeApp();

                            createAlertDialog(context);



                          }
                        }
                    ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
