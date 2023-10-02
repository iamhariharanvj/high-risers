import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:highrisers/pages/doors.dart';

import '../widgets/Data.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {

  HomeScreen();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Data> dataList = [];
  List<bool> favList = [];
  bool searchState = false;
  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    DatabaseReference referenceData = FirebaseDatabase.instance.ref().child(
        "users");
    referenceData.once().then((event) {
      final dataSnapShot = event.snapshot;
      dataList.clear();
      favList.clear();

      var values = dataSnapShot.value;
      Map<dynamic, dynamic> mapData = {};
      (dataSnapShot as Map<dynamic, dynamic>).forEach((key, value) {
        Data data = new Data(
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],

          //key is the uploadid

        );
        print(mapData);
        dataList.add(data);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Color(0xffff2fc3),
        title: !searchState ? Text("Home") :
        TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            hintText: "Search ...",
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (text) {
            SearchMethod(text);
          },
        ),
        actions: <Widget>[
          !searchState ? IconButton(
              icon: Icon(Icons.search, color: Colors.white,), onPressed: () {
            setState(() {
              searchState = !searchState;
            });
          }
          ) :
          IconButton(
              icon: Icon(Icons.cancel, color: Colors.white,), onPressed: () {
            setState(() {
              searchState = !searchState;
            });
          }
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              height: 170,
              color: Color(0xff000725),
              child: Column(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 30)),

                  SizedBox(height: 10,),

                ],
              ),
            ),
            // ListTile(
            //   title: Text("Upload"),
            //   leading: Icon(Icons.cloud_upload),
            //   onTap: () {
            //     Navigator.pushReplacement(context, MaterialPageRoute(
            //         builder: (BuildContext context) => UploadData()));
            //   },
            // ),

            // ListTile(
            //   title: Text("My Favorite"),
            //   leading: Icon(Icons.favorite),
            //   onTap: () {
            //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => MyFavorite()));
            //   },
            // ),

            ListTile(
              title: Text("My Profile"),
              leading: Icon(Icons.person),
            ),
            Divider(),

            ListTile(
              title: Text("Contact US"),
              leading: Icon(Icons.email),
            )
            //line
          ],
        ),
      ),
      body: dataList.length == 0
          ? Center(
          child: Text("No Data Available", style: TextStyle(fontSize: 30),))
          : ListView.builder(
          itemCount: dataList.length,
          itemBuilder: (_, index) {
            return CardUI(dataList[index].name, dataList[index].city,
                dataList[index].contact, dataList[index].duedate,
                dataList[index].orderid, index);
          }
      ),
    );
  }

  Widget CardUI(String imgUrl, String name, String material, String price,
      String uploadId, int index) {
    return Card(
      elevation: 7,
      margin: EdgeInsets.all(15),
      color: Color(0xffff2fc3),
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(1.5),
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Image.network(imgUrl, fit: BoxFit.cover, height: 100,),
            SizedBox(height: 1,),
            Text(name, style: TextStyle(color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold),),
            SizedBox(height: 1,),
            Text("material:- $material"),
            SizedBox(height: 1,),
            Container(
              width: double.infinity,
              child: Text(price, style: TextStyle(
                  color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,),
            ),
            SizedBox(height: 1,),


          ],
        ),
      ),
    );
  }


  void SearchMethod(String text) {
    DatabaseReference referenceData = FirebaseDatabase.instance.ref().child(
        "users");
    referenceData.once().then((event) {
      final dataSnapShot = event.snapshot;
      dataList.clear();
      favList.clear();
      var values = dataSnapShot.value;
      Map<dynamic, dynamic> mapData = {};
      (dataSnapShot as Map<dynamic, dynamic>).forEach((key, value) {

        Data data = new Data(
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],
          mapData [key][value],

//key is the uploadid

        );
        print(mapData);
        if (data.name.contains(text)) {
          dataList.add(data);
        }
      });
    });
  }


}
