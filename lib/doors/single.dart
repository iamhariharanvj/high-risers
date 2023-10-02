import 'dart:io';

import 'package:flutter/material.dart';
import 'package:highrisers/views/doorView.dart';
import 'package:image_picker/image_picker.dart';

import '../pages/contact.dart';

class single extends StatefulWidget {
  final String doorSize;
  final String type;
  const single({Key? key,required this.doorSize,required this.type}) : super(key: key);



  @override
  _singleState createState() => _singleState();
}

class _singleState extends State<single> {
  File? _image;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _image = null;
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
            'High Risers',
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
            Center(
              child: Text(
                widget.type,
                style: TextStyle(
                    color: Color.fromARGB(255, 225, 137, 5),
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,

                    fontSize: 35.0),),
            ),

            SizedBox(height: 20.0,),
            Center(
              child: Text(
                widget.doorSize,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'JosefinSans',

                      fontSize: 25.0),
              ),
            ),

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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => doorView(
                                img: _image,
                                type: (widget.type),
                                doorSize: widget.doorSize))
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
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => doorView(
                                img: _image,
                                type: (widget.type),
                                doorSize: widget.doorSize))
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