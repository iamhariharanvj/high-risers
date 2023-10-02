import 'package:flutter/material.dart';
import 'package:highrisers/pages/orderDetails.dart';
import 'package:highrisers/views/doorView.dart';
class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
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
        body:ListView(
          children: <Widget>[
            SizedBox(height: 10.0,),
            SizedBox(height: 15.0,),


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
                  _buildCard('Doors','images/door.jpg','/door',context),
                  _buildCard('Nilai','images/nilai.jpg','/nilais',context),
                  _buildCard('Window','images/window.jpg','/window',context),
                  _buildCard('Shutters','images/shutter.jpg','/shutter',context),
                  _buildCard('Loouvers','images/shutters-window.jpg','/loouver',context),
                  _buildCard('Order Details','images/details.jpg','/orderDetails',context),

                ],
              ),
            ),
            //SizedBox(height: -50.0,),
            
          ],
        )
    );
  }
  Widget _buildCard(String name,String imgPath,String path , context)
  {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 10.0, right: 5.0),
      child: InkWell(
        onTap: (){
          Navigator.pushNamed(context, path);
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
                  Text(name,
                      style: TextStyle(
                          color: Color.fromARGB(255,225, 137, 5),
                          fontFamily: 'JosefinSans',

                          fontSize: 22.0))
                ],
              ),

            ),
          ],
          ),
        ),
      ),
    );
  }
}
