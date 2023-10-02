import 'package:flutter/material.dart';
import 'anyWoodNilaiOrder.dart';
import 'bathroomdoor6.dart';
import 'door4.dart';
import 'myNilai2.dart';
import 'myNilaiOrder.dart';
class bathroomdoor5 extends StatefulWidget {
  final users;
  final index;
  const bathroomdoor5({Key? key, required this.users, this.index}) : super(key: key);

  @override
  _bathroomdoor5State createState() => _bathroomdoor5State();
}

class _bathroomdoor5State extends State<bathroomdoor5> {
  String polish = "";
  final _textEditingController = TextEditingController();
  setDoor(val){
    setState(() {
      polish= val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Bedroom Doors',
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
                            'Polish : ',
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
                              groupValue:polish,
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
                              groupValue: polish,
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
                              // widget.users.update("MainNilai Wood type", (value) => woodType);
                              // widget.users.update("MainNilai pieces", (value) => number);
                              Map<String, String> map = Map.from(widget.users["bedroomdoors"][widget.index]);
                              map['bedroomdoor Polish'] = polish.toString();
                              widget.users["bedroomdoors"][widget.index] = map;

                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => bathroomdoor6(users:widget.users, index:widget.index))
                              );


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
