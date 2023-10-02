import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/shutter3.dart';
import 'package:highrisers/2.0/pages/shutter5.dart';
import 'package:highrisers/Window/shutter_size.dart';
import 'package:highrisers/Window/windowSize.dart';



class shutter2 extends StatefulWidget {
  final users;
  final index;
  const shutter2({Key? key,required this.users, this.index}) : super(key: key);

  @override
  _shutter2State createState() => _shutter2State();
}

class _shutter2State extends State<shutter2> {
  static const l = ["4 \" x 3\""];
  int door = -1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    door = 0;
  }

  String setSize(int door){
    if(door == 0)
      return l[0];
    else
    {
      String s = _textEditingController.text + "\" x " + _textEditingController1.text + "\"";
      return s;
    }
  }
  String s = "";

  final _textEditingController = TextEditingController();
  final _textEditingController1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Shutters',
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
            padding: EdgeInsets.only(top: 170.0,left: 30.0),
            child: Column(
              children: [

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,10.0),
                      child: Text(
                          'Size : ' ,
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'JosefinSans',

                              fontSize: 25.0)
                      ),
                    ),

                    Row(
                      children: [
                        SizedBox(
                          height: 40.0,
                          width: 80.0,
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
                            keyboardType: TextInputType.phone,


                          ),
                        ),

                        SizedBox(width: 10.0,),
                        Text(
                            '" x ',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 20.0)
                        ),
                        SizedBox(width: 10.0,),

                        SizedBox(
                          height: 40.0,
                          width: 80.0,
                          child: TextFormField(
                            controller: _textEditingController1,
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
                            keyboardType: TextInputType.phone,
                            //onChanged: (newValue) => sController.text.value = newValue,

                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Text(
                            '" ',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 20.0)
                        ),
                      ],
                    ),
                  ],
                ),



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
                        String s = await setSize(door);

                        s = _textEditingController.text + "\" - " + _textEditingController1.text + "\"";
                        Map<String, String> map = Map.from(widget.users["shutters"][widget.index]);

                        map["shutter Door Size"] = s;
                        widget.users["shutters"][widget.index] = map;
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => shutter5(users: widget.users, index:widget.index),
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
    );;
  }
}
