import 'package:flutter/material.dart';
import 'package:highrisers/Window/shutter.dart';
import 'package:highrisers/Window/windowSize.dart';
import 'package:highrisers/Window/windows.dart';
import 'package:highrisers/dsize/singleSize.dart';



class Window extends StatefulWidget {
  const Window({Key? key}) : super(key: key);

  @override
  _WindowState createState() => _WindowState();
}

class _WindowState extends State<Window> {
  int door = -1;
  static const d = {
    0 : 'Single',
    1:'Double',
    2:'Triple',
  };
  @override
  void initState(){
    super.initState();
    door = 0;
  }
  setDoor(val){
    setState(() {
      door = val;
    });
  }
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
        body:ListView(
          children: <Widget>[
            SizedBox(height: 20.0,),
            Center(
              child: Text(
                'Windows',
                style: TextStyle(
                    color: Color.fromARGB(255,225, 137, 5),
                    fontFamily: 'JosefinSans',
                    fontWeight: FontWeight.bold,

                    fontSize: 35.0),),
            ),

            SizedBox(height: 15.0,),
            Container(
              padding: EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height-50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[

                  _buildCard('images/w.jpeg',context,'A'),
                  _buildCard('images/w1.jpeg',context,'B'),
                  _buildCard('images/w2.jpeg',context,'C'),
                ],
              ),
            ),
            SizedBox(height: 15.0,),
          ],
        )
    );
  }
}

Widget _buildCard(String imgPath,context,type)
{
  return Padding(
    padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
    child: InkWell(
      onTap: (){
        if(type == "Shutters")
          {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => shutter(type: "Window " + type))
            );
          }
        else {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => windows(type: "Window " + type))
          );
        }
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
            color: Colors.blueGrey[50]),
        child: Column(children: [
          SizedBox(height: 20.0,),
          Hero(
              tag: imgPath,
              child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath),
                          fit: BoxFit.contain)))),
          SizedBox(height: 25.0,),
          Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
          Padding(
            padding: EdgeInsets.only(left: 5.0, right: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(type,
                    style: TextStyle(
                        color: Color.fromARGB(255,225, 137, 5),
                        fontFamily: 'JosefinSans',

                        fontSize: 25.0))
              ],
            ),

          ),
        ],
        ),
      ),
    ),
  );
}