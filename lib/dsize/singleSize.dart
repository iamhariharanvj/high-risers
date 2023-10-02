import 'package:flutter/material.dart';
import 'package:highrisers/doors/single.dart';

class single_size extends StatefulWidget {
  final type;

  const single_size({ Key? key, this.type }): super(key: key);

  @override
  _single_sizeState createState() => _single_sizeState();
}

class _single_sizeState extends State<single_size> {
  String s1 = "";
  String s2 = "";
  static const t = {
    'Single' : ["81\" x 27\"","81\" x 30\"","81\" x 32\"","81\" x 33\"","81\" x 36\"","81\" x 38\"","81\" x 42\""],
    'Double' : ["81\" x 27\"","81\" x 30\"","81\" x 32\"","81\" x 33\"","81\" x 36\"","81\" x 38\"","81\" x 42\""],
    '2 Panel' : ["81\" x 27\"","81\" x 30\"","81\" x 32\"","81\" x 33\"","81\" x 36\"","81\" x 38\"","81\" x 42\""],
    'Pooja' : ["81\" x 27\"","81\" x 30\"","81\" x 32\"","81\" x 33\"","81\" x 36\"","81\" x 38\"","81\" x 42\""],
    'Other' : ["81\" x 27\"","81\" x 30\"","81\" x 32\"","81\" x 33\"","81\" x 36\"","81\" x 38\"","81\" x 42\""],

  };
  static const s = {
    0 : "81\" x 27\"",
    1 : "81\" x 30\"",
    2 : "81\" x 32\"",
    3 : "81\" x 33\"",
    4: "81\" x 36\"",
    5 : "81\" x 38\"",
    6 : "81\" x 42\"",
    7 : "81\" x 30\""
  };
  List<Widget> myWidgets = [];
  int size = -1;

  final _textEditingController = TextEditingController();
  final _textEditingController1 = TextEditingController();
  @override
  void initState(){
    super.initState();
    size = 0;
    int length = t['Single']!.length;
    for(int i = 0;i<length;i++)
    {
      myWidgets.add(
          _build_opt('Single',i)
      );
    }
  }
  setDoor(val){
    setState(() {
      size = val;
    });
  }
  String setSize(int door){
    if(door != 7)
      return t['Single']![door];
    else
    {

      String s = _textEditingController.text + "\" x " + _textEditingController1.text + "\"";
      return s;
    }
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
      body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 50.0,left: 40.0),
            child: Column(
              children : [
                Text(
                  "Select Door size",
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,

                      fontSize: 35.0),),
                SizedBox(height: 10.0,),
                ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: t['Single']!.length,
                  itemBuilder: (BuildContext context,int index) => _build_opt(context, index),
                ),
                SizedBox(height: 5.0,),
                RadioListTile(
                  activeColor: Color.fromARGB(255,225, 137, 5),
                  title: Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 60.0,
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
                            'x',
                            style: TextStyle(
                                color: Color.fromARGB(255,225, 137, 5),
                                fontFamily: 'JosefinSans',

                                fontSize: 30.0)
                        ),
                        SizedBox(width: 10.0,),

                        SizedBox(
                          height: 60.0,
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


                      ],
                    ),
                  ),
                  value: 7,
                  groupValue: size,
                  onChanged: (val)
                  {
                    size = 7;
                  },
                ),
                SizedBox(height: 60.0,),

                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width - 80.0,
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
                        String s = await setSize(size);
                        await Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => single(doorSize : s,type:(widget.type + " Doors"))));
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

    );;
  }

  Widget _build_opt(context , int i)
  {
    return RadioListTile(
      title: Text(
        t['Single']![i],
        style: TextStyle(
            color: Color.fromARGB(255,225, 137, 5),
            fontFamily: 'JosefinSans',


            fontSize: 25.0),
      ),
      value: i,
      groupValue: size,
      activeColor: Color.fromARGB(255,225, 137, 5),
      onChanged: (val)
      {
        setDoor(val);
      },
    );
  }
}



