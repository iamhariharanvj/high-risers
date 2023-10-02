import 'package:flutter/material.dart';
import 'package:highrisers/nilai/nilaiSize.dart';
import 'package:highrisers/views/doorView.dart';
class nilais extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    String door = " Nilai";
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
                door,
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
                  _buildCard('images/nilai1.jpg',context,'A'),
                  _buildCard('images/nilai.jpg',context,'B'),
                  _buildCard('images/nilai2.jpg',context,'C'),
                  _buildCard('images/nilai3.jpg',context,'D'),
                  _buildCard('images/nilai4.jpeg',context,'E'),
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
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => nilai_size(type: "Nilai " + type,))
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

