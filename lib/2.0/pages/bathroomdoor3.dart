import 'package:flutter/material.dart';
import 'package:highrisers/dsize/singleSize.dart';

import 'bathroomdoor2.dart';
import 'bathroomdoor4.dart';
import 'door2.dart';


class bathroomdoor3 extends StatefulWidget {
  final users;
  final index;
  const bathroomdoor3({Key? key,this.users, this.index}) : super(key: key);

  @override
  _bathroomdoor3State createState() => _bathroomdoor3State();
}

class _bathroomdoor3State extends State<bathroomdoor3> {
  int door = -1;
  static const d = {
    0 : 'Membrane doors',
    1:'Wooden doors',
    2:'Lamination doors',
    3:'Mich doors',
    4:'Flush doors',
    5:'Others'
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

  final _textEditingController = TextEditingController();
  String? setSize(int door){
    if(door != 5)
      return d[door];
    else
    {
      String s = _textEditingController.text;
      return s;
    }
  }

  Widget build(BuildContext context) {
    String other = "";
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
      body :SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child : Padding(
            padding: EdgeInsets.only(top: 150.0,left: 30.0),
            child: Column(
              children: [
                Text(
                  "Doors",
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,

                      fontSize: 35.0),),
                SizedBox(height: 10.0,),
                RadioListTile(
                  title: Text(
                      'Membrane Doors',
                      style: TextStyle(
                          color: Color.fromARGB(255,225, 137, 5),
                          fontFamily: 'JosefinSans',

                          fontSize: 25.0)
                  ),
                  value: 0,
                  groupValue: door,
                  activeColor: Color.fromARGB(255, 175, 106, 4),
                  onChanged: (val)
                  {
                    setDoor(val);
                  },
                ),
                RadioListTile(
                  title: Text(
                      'Wooden doors',
                      style: TextStyle(
                          color: Color.fromARGB(255,225, 137, 5),
                          fontFamily: 'JosefinSans',

                          fontSize: 25.0)
                  ),
                  value: 1,
                  groupValue: door,
                  onChanged: (val)
                  {
                    setDoor(val);
                  },
                  activeColor: Color.fromARGB(255, 175, 106, 4),
                ),
                RadioListTile(
                  title: Text(
                      'Lamination doors',
                      style: TextStyle(
                          color: Color.fromARGB(255,225, 137, 5),
                          fontFamily: 'JosefinSans',

                          fontSize: 25.0)
                  ),
                  value: 2,
                  groupValue: door,
                  onChanged: (val)
                  {
                    setDoor(val);
                  },
                  activeColor: Color.fromARGB(255, 175, 106, 4),
                ),
                RadioListTile(
                  title: Text(
                      'Mich doors',
                      style: TextStyle(
                          color: Color.fromARGB(255,225, 137, 5),
                          fontFamily: 'JosefinSans',

                          fontSize: 25.0)
                  ),
                  value: 3,
                  groupValue: door,
                  activeColor: Color.fromARGB(255, 175, 106, 4),
                  onChanged: (val)
                  {
                    setDoor(val);
                  },
                ),
                RadioListTile(
                  title: Text(
                      'Flush doors',
                      style: TextStyle(
                          color: Color.fromARGB(255,225, 137, 5),
                          fontFamily: 'JosefinSans',

                          fontSize: 25.0)
                  ),
                  value: 4,
                  groupValue: door,
                  activeColor: Color.fromARGB(255, 175, 106, 4),
                  onChanged: (val)
                  {
                    setDoor(val);
                  },
                ),
                RadioListTile(
                  activeColor: Color.fromARGB(255,225, 137, 5),
                  title: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        Text(
                            'Others : ',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 25.0)
                        ),
                        SizedBox(width: 10.0,),
                        SizedBox(
                          height: 60.0,
                          width: 100.0,
                          child: TextFormField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
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
                            onSaved: (String? value){
                              other = value!;
                            },

                          ),
                        ),
                      ],
                    ),
                  ),
                  value: 4,
                  groupValue: door,
                  onChanged: (val)
                  {
                    setDoor(val);
                  },
                ),
                // RadioListTile(
                //   title: Text(
                //     'Special',
                //       style: TextStyle(
                //           color: Color.fromARGB(255,225, 137, 5),
                //           fontFamily: 'JosefinSans',
                //
                //           fontSize: 25.0)
                //   ),
                //   value: 4,
                //   groupValue: door,
                //   activeColor: Color.fromARGB(255, 175, 106, 4),
                //   onChanged: (val)
                //   {
                //     setDoor(val);
                //   },
                // ),
                SizedBox(height: 60.0,),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 60.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFFF17532)
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueGrey[50],
                      ),
                      child: Center(
                        child: Text('Next',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 22.0)
                        ),
                      ),
                      onPressed: () async{
                        String? s = await setSize(door);
                        Map<String, String> map = Map.from(widget.users["bedroomdoors"][widget.index]);
                        map['bedroomdoor Type2'] = s.toString();
                        widget.users["bedroomdoors"][widget.index] = map;

                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => bathroomdoor2(users:widget.users, index: widget.index),
                            ));
                        // switch(door){
                        //   case 0:
                        //     Navigator.pushNamed(context,'/home');
                        //     break;
                        // }
                      },

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

