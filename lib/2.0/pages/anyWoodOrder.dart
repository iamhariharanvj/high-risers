import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/views/doorView.dart';
import 'package:image_picker/image_picker.dart';

import 'anyWoodNilaiView.dart';
import 'anyWoodView.dart';
import 'myNilaiView.dart';


class anyWoodDoorOrder extends StatefulWidget {
  final users;
  final index;
  const anyWoodDoorOrder({Key? key,required this.users, this.index}) : super(key: key);



  @override
  _anyWoodDoorOrderState createState() => _anyWoodDoorOrderState();
}

class _anyWoodDoorOrderState extends State<anyWoodDoorOrder> {
  File? _image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _image = null;
  }

  storeImage(image) async
  {
    FirebaseStorage _storage = FirebaseStorage.instance;
    var file = await File(image.path);
    try {
      var folder = widget.users["ContactNo"];
      var snapshot = _storage.ref()
          .child("orders/$folder/" + "AnyWoodDoor Order")
          .putFile(file);

      print("hi");
    } catch (e){
      print(e);
    }

  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(
            'Pooja Border Door',
            style: TextStyle(
              color: Colors.blueGrey[50],
              fontSize: 25.0,
              fontFamily: 'JosefinSans',
            ),
          ),
          backgroundColor: Color.fromARGB(255, 175, 106, 4),
        ),
        body: ListView(
          children: <Widget>[
            SizedBox(height: 20.0,),


            SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 30.0,
              height: MediaQuery
                  .of(context)
                  .size
                  .height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 5.0, left: 10.0, right: 5.0),
                    child: InkWell(
                      onTap: () async {
                        await getImage(true);
                        Map<String, String> map = Map.from(widget.users["anyWoodDoors"][widget.index]);
                        map["anyWoodDoor Orderimage"] = _image!.path;
                        widget.users["anyWoodDoors"][widget.index] = map;
                        storeImage(_image);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => anyWoodView(
                                users:widget.users, index: widget.index))
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3.0,
                                  blurRadius: 5.0)
                            ],
                            color: Colors.white),
                        child: Column(children: [
                          SizedBox(height: 20.0,),
                          Hero(
                              tag: IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {
                                  getImage(true);
                                },
                              ),
                              child: Container(
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/camera.jpg'),
                                          fit: BoxFit.contain)))),
                          SizedBox(height: 10.0,),
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                  color: Color(0xFFEBEBEB), height: 1.0)),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Camera',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 225, 137, 5),
                                        fontFamily: 'JosefinSans',

                                        fontSize: 25.0))
                              ],
                            ),

                          ),
                        ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: 5.0, left: 10.0, right: 5.0),
                    child: InkWell(
                      onTap: () async {
                        await getImage(false);
                        Map<String, String> map = Map.from(widget.users["anyWoodDoors"][widget.index]);
                        map["anyWoodDoor Orderimage"] = _image!.path;
                        widget.users["anyWoodDoors"][widget.index] = map;
                        storeImage(_image);
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => anyWoodView(
                                users:widget.users, index: widget.index))
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 3.0,
                                  blurRadius: 5.0)
                            ],
                            color: Colors.white),
                        child: Column(children: [
                          SizedBox(height: 20.0,),
                          Hero(
                              tag: IconButton(
                                icon: Icon(Icons.camera_alt),
                                onPressed: () {

                                },
                              ),
                              child: Container(
                                  height: 120.0,
                                  width: 120.0,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'images/gallery.jpg'),
                                          fit: BoxFit.contain)))),
                          SizedBox(height: 10.0,),
                          Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Container(
                                  color: Color(0xFFEBEBEB), height: 1.0)),
                          Padding(
                            padding: EdgeInsets.only(left: 5.0, right: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('Gallery',
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 225, 137, 5),
                                        fontFamily: 'JosefinSans',

                                        fontSize: 25.0))
                              ],
                            ),

                          ),
                        ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
          ],
        )
    );
  }
}