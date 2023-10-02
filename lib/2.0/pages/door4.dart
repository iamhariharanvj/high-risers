import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/door1.dart';
import 'anyWoodNilaiOrder.dart';
import 'bathroomdoor.dart';
import 'doorOrder.dart';
import 'myNilai2.dart';
import 'myNilaiOrder.dart';
class door4 extends StatefulWidget {
  final users;
  final index;
  const door4({Key? key, required this.users, this.index}) : super(key: key);

  @override
  _door4State createState() => _door4State();
}

class _door4State extends State<door4> {
  String carving = "";
  final _textEditingController = TextEditingController();
  setDoor(val){
    setState(() {
      carving= val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Doors',
          style: TextStyle(
            color: Colors.blueGrey[50],
            fontSize: 25.0,
            fontFamily: 'JosefinSans',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 175, 106, 4),
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children :[
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0,200.0,0.0,0.0),
            child: Container(
              child:Column(

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
                        child: Text(
                            'Carving : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'JosefinSans',

                                fontSize: 25.0)
                        ),
                      ),
                      Row(
                        children : [
                          Radio(
                              value: "Yes",
                              groupValue: carving,
                              activeColor: Color.fromARGB(255, 175, 106, 4),
                              onChanged: (value){
                                setDoor(value);//selected value
                              }
                          ),
                          Text(
                              'Yes',
                              style: TextStyle(
                                  color: Color.fromARGB(255,225, 137, 5),
                                  fontFamily: 'JosefinSans',

                                  fontSize: 25.0)
                          ),
                        ],
                      ),
                      Row(
                        children : [
                          Radio(
                              value: "No",
                              groupValue: carving,
                              activeColor: Color.fromARGB(255, 175, 106, 4),
                              onChanged: (value){
                                setDoor(value);//selected value
                              }
                          ),
                          Text(
                              'No',
                              style: TextStyle(
                                  color: Color.fromARGB(255,225, 137, 5),
                                  fontFamily: 'JosefinSans',

                                  fontSize: 25.0)
                          ),
                        ],
                      ),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(50.0,50.0,0.0,0.0),
                    child: Container(
                      width: 200.0,
                      height: 50.0,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25.0),
                          color: Color(0xFFF17532)
                      ),
                      child: Container(
                        child:ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(255, 175, 106, 4),
                            ),
                            child: Center(
                              child: Text('Next',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'JosefinSans',

                                      fontSize: 22.0)
                              ),
                            ),
                            onPressed: () async{
                              Map<String, String> map = Map.from(widget.users["doors"][widget.index]);

                              map["door Carving"] = carving;
                              if(carving == "Yes") {
                                widget.users["doors"][widget.index] = map;
                                Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => doorOrder(index: widget.index,users:widget.users))

                                );
                              }
                              else
                              {

                                map["door Orderimage"] = "NA";
                                widget.users["doors"][widget.index] = map;
                                if (widget.index+1 == widget.users["door No. of pieces"]) {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) =>
                                          bathroomdoor(users: widget.users))
                                  );
                                }
                                else{
                                  widget.users["doors"][widget.index] = map;
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) =>
                                          door1(users:widget.users, index: widget.index+1))
                                  );
                                }
                              }

                              print(widget.users);




                            }

                        ),
                      ),
                    ),
                  ),
                ],





              ),
            ),
          ),
        ],

      ),
    );
  }

}
