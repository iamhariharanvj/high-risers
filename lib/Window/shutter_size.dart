import 'package:flutter/material.dart';
import 'package:highrisers/doors/single.dart';


class shutter_size extends StatefulWidget {
  final type,ssize;

  const shutter_size({ Key? key, this.type ,this.ssize}): super(key: key);

  @override
  _shutter_sizeState createState() => _shutter_sizeState();
}

class _shutter_sizeState extends State<shutter_size> {

  static const w = ["2\" x 2\"","2\" x 3\"","2\" x 4\"","3\" x 2\"","3\" x 3\"","3\" x 4\"","4\" x 2\"","4\" x 3\"","4\" x 4\"","4\" x 5\"","4\" x 6\""];
  static const shut = ["20\" x 10\"","20\" x 13\"","20\" x 13 1/2\"","20\" x 20\"","32\" x 10\"","32\" x 13\"","32\" x 13 1/2\"","32\" x 20\"","44\" x 10\"","44\" x 13\"","44\" x 13 1/2\"","44\" x 20\""];
  static const s = {
    0 : "81\" x 36\"",
    1 : "81\" x 33\"",
    2 : "81\" x 42\"",
  };

  String size1 = "";
  String size2 = "";


  List<Widget> myWidgets = [];
  int size = -1;
  int length = 0;
  List l = [];
  @override
  void initState(){
    super.initState();
    size = 0;

    length = shut.length;
    l = shut;
    print(length);
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

  String setSize(int door){
    if(door != 12)
      return shut[door];
    else
    {
      String s = _textEditingController.text + "\" x " + _textEditingController1.text + "\"";
      return s;
    }
  }

  final _textEditingController = TextEditingController();
  final _textEditingController1 = TextEditingController();

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
      body: Container(
        height: MediaQuery.of(context).size.height-80,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          children :[ Padding(
            padding: EdgeInsets.only(top: 30.0,left: 30.0),
            child:
            Column(
              children : [
                Text(
                  "Select Shutter size",
                  style: TextStyle(
                      color: Color.fromARGB(255,225, 137, 5),
                      fontFamily: 'JosefinSans',
                      fontWeight: FontWeight.bold,

                      fontSize: 35.0),),
                SizedBox(height: 10.0,),
                SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: length,
                    itemBuilder: (BuildContext context,int index) => _build_opt(context, index),
                  ),
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
                  value: 12,
                  groupValue: size,
                  onChanged: (val)
                  {
                    size = 12;
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
                            MaterialPageRoute(builder: (context) => single(doorSize : (widget.ssize + " - " + s),type:widget.type)));
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
          ],
        ),
      ),

    );;
  }

  Widget _build_opt(context , int i)
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



