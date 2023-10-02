import 'package:flutter/material.dart';
import 'package:highrisers/doors/single.dart';

import 'nilais.dart';

class nilai_size extends StatefulWidget {
  final type;

  const nilai_size({ Key? key, this.type }): super(key: key);

  @override
  _nilai_sizeState createState() => _nilai_sizeState();
}

class _nilai_sizeState extends State<nilai_size> {

  static const t = ["7\' 5\'","7\' x 3\'","7\' x 3 1/2\'","7\' x 2 1/2\'"];
  static const l = ["6\" x 4\"","5\" x 4\"","4\" x 3\""];
  static const s = {
    10 : "7\' x 5\' - 6\" x 4\"",
    11 : "7\' x 5\' - 5\" x 4\"",
    12 : "7\' x 5\' - 4\" x 3\"",
    20 : "7\' x 3\' - 6\" x 4\"",
    21 : "7\' x 3\' - 5\" x 4\"",
    22 : "7\' x 3\' - 4\" x 3\"",
    30 : "7\' x 3 1/2\' - 6\" x 4\"",
    31 : "7\' x 3 1/2\' - 5\" x 4\"",
    32 : "7\' x 3 1/2\' - 4\" x 3\"",
    40 : "7\' x 3 1/2\' - 6\" x 4\"",
    41 : "7\' x 3 1/2\' - 5\" x 4\"",
    42 : "7\' x 3 1/2\' - 4\" x 3\"",
    50 : "7\' x 2 1/2\' - 6\" x 4\"",
    51 : "7\' x 2 1/2\' - 5\" x 4\"",
    60 : "7\' x 2 1/2\' - 6\" x 4\"",
    61 : "7\' x 2 1/2\' - 5\" x 4\"",

  };
  List<Widget> myWidgets = [];
  int size = -1;

  @override
  void initState(){
    super.initState();
    size = 0;
    int length = t.length;
    for(int i = 0;i<length;i++)
    {
      myWidgets.add(
          _build_opt(widget.type,i)
      );
    }
  }
  setDoor(val){
    setState(() {
      size = val;
    });
  }

  String? setSize(int door){
    String st = _textEditingController.text + "\" x " + _textEditingController1.text + "\"" ;
    if(door == 40)
          st += " - 6\" x 4\"";
    else if(door == 41)
          st += " - 5\" x 4\"";
    else if(door == 42)
          st += " - 4\" x 3\"";
    else if(door == 60) {
      st = _textEditingController2.text + "\" x " + _textEditingController3.text + "\"" ;
      st += " - 6\" x 4\"";
    }
    else if(door == 61) {
      st = _textEditingController2.text + "\" x " + _textEditingController3.text + "\"" ;
      st += " - 5\" x 4\"";
    }
    else
      return s[door];
    _textEditingController.text = "";
    _textEditingController1.text = "";
    _textEditingController2.text = "";
    _textEditingController3.text = "";

    return st;
  }

  final _textEditingController = TextEditingController();
  final _textEditingController1 = TextEditingController();
  final _textEditingController2 = TextEditingController();
  final _textEditingController3 = TextEditingController();

  Widget build(BuildContext context) {
    String size1 = "";
    String size2 = "";
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
      body: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children :[

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 100.0),
                  child: Text(
                    'Log Size',
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'JosefinSans',
                        fontSize: 25.0),
                  ),
                ),
                SizedBox(height: 5.0,),
                DataTable(
                dataRowHeight: 50.0,
    columns: [
    DataColumn(
    label: Text('Size',
      style: TextStyle(
          color: Colors.black,
          fontFamily: 'JosefinSans',
          fontSize: 25.0),)
    ),
    DataColumn(
    label: Text(l[0],
      style: TextStyle(
          color: Color.fromARGB(255,225, 137, 5),
          fontFamily: 'JosefinSans',
          fontSize: 25.0),)
    ),
    DataColumn(
    label: Text(l[1],
      style: TextStyle(
          color: Color.fromARGB(255,225, 137, 5),
          fontFamily: 'JosefinSans',
          fontSize: 25.0),)
    ),
        DataColumn(
                label: Text(l[2],
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontSize: 25.0),)
        ),
    ],
    rows: [
    DataRow(cells: [
    DataCell(
         Text(
    t[0],
           style: TextStyle(
                   color: Color.fromARGB(255,225, 137, 5),
                   fontFamily: 'JosefinSans',
                   fontSize: 20.0),
    ),
    ),
    DataCell(
          Radio(
                  value: 10,
                  groupValue: size,
                  activeColor: Color.fromARGB(255, 175, 106, 4),
                  onChanged: (value){
                    setDoor(value);//selected value
                  }
          )
    ),
    DataCell(
          Radio(
                  value: 11,
                  groupValue: size,
              activeColor: Color.fromARGB(255, 175, 106, 4),
                  onChanged: (value){
                    setDoor(value); //selected value
                  }
          )
    ),
        DataCell(
          Radio(
          value: 12,
    groupValue: size,
              activeColor: Color.fromARGB(255, 175, 106, 4),
    onChanged: (value){
      setDoor(value); //selected value
    }
    )
        )
    ]),
        DataRow(cells: [
          DataCell(
                Text(
                  t[1],
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontSize: 20.0),
                ),
          ),
          DataCell(
                  Radio(
                      value: 20,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value);//selected value
                      }
                  )
          ),
          DataCell(
                  Radio(
                      value: 21,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value);//selected value
                      }
                  )
          ),
          DataCell(
                  Radio(
                      value: 22,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value); //selected value
                      }
                  )
          )
        ]),
        DataRow(cells: [
          DataCell(
                Text(
                  t[2],
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontSize: 20.0),
                ),
          ),
          DataCell(
                  Radio(
                      value: 30,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value); //selected value
                      }
                  )
          ),
          DataCell(
                  Radio(
                      value: 31,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value);//selected value
                      }
                  )
          ),
          DataCell(
                  Radio(
                      value: 32,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value); //selected value
                      }
                  )
          )
        ]),
      DataRow(cells: [
        DataCell(
          Row(
            children: [
             Padding(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 35.0,
                        width: 50.0,
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

                              fontSize: 20.0)
                      ),
                      SizedBox(width: 10.0,),

                      SizedBox(
                        height: 35.0,
                        width: 50.0,
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



            ],

          ),
        ),
        DataCell(
            Radio(
                value: 40,
                groupValue: size,
                activeColor: Color.fromARGB(255, 175, 106, 4),
                onChanged: (value){
                  setDoor(value); //selected value
                }
            )
        ),
        DataCell(
            Radio(
                value: 41,
                groupValue: size,
                activeColor: Color.fromARGB(255, 175, 106, 4),
                onChanged: (value){
                  setDoor(value); //selected value
                }
            )
        ),
        DataCell(
            Radio(
                value: 42,
                groupValue: size,
                activeColor: Color.fromARGB(255, 175, 106, 4),
                onChanged: (value){
                  setDoor(value); //selected value
                }
            )
        )
      ]),
        DataRow(cells: [
          DataCell(
                Text(
                  t[3],
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontSize: 20.0),
                ),
          ),
          DataCell(
                  Radio(
                      value: 50,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value); //selected value
                      }
                  )
          ),
          DataCell(
                  Radio(
                      value: 51,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value); //selected value
                      }
                  )
          ),
          DataCell(
                  Text(
                    ''
                  )
          )
        ]),

        DataRow(cells: [
          DataCell(
    Row(
                children: [
                  SizedBox(
                    height: 35.0,
                    width: 50.0,
                    child: TextFormField(
                      controller: _textEditingController2,
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

                          fontSize: 20.0)
                  ),
                  SizedBox(width: 10.0,),

                  SizedBox(
                    height: 35.0,
                    width: 50.0,
                    child: TextFormField(
                      controller: _textEditingController3,
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
          DataCell(
                  Radio(
                      value: 60,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value); //selected value
                      }
                  )
          ),
          DataCell(
                  Radio(
                      value:61,
                      groupValue: size,
                      activeColor: Color.fromARGB(255, 175, 106, 4),
                      onChanged: (value){
                        setDoor(value);//selected value
                      }
                  )
          ),
          DataCell(
                  Text('')
          )
        ]),
    ]),
      SizedBox(height: 10.0,),

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
              String? st = await setSize(size);
              await Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => single(doorSize : st!,type:widget.type)));
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
    ],
        ),
      )
    );
  }

  Widget _build_opt(context , int i)
  {
    return RadioListTile(
      title: Text(
        t[i],
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
  Widget _build_opt1(context , int i)
  {
    return RadioListTile(
      title: Text(
        l[i],
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



