import 'package:flutter/material.dart';
import 'anyWoodDoor4.dart';
import 'anyWoodNilai4.dart';
import 'myNilai2.dart';
class anyWoodDoor2 extends StatefulWidget {
  final users;
  final index;
  const anyWoodDoor2({Key? key, required this.users, this.index}) : super(key: key);

  @override
  _anyWoodDoor2State createState() => _anyWoodDoor2State();
}

class _anyWoodDoor2State extends State<anyWoodDoor2> {
  String woodType = "";
  String s1 = "";
  String s2 = "";
  String t1 = "";
  String t2 = "";
  String polish = "";
  setPolish(val){
    setState(() {
      polish = val;
    });
  }
  setValue(){
    s1 = _textEditingController.text + "\" - " + _textEditingController1.text + "\"";
    t1 = _textEditingController2.text + "\" - " + _textEditingController3.text + "\"";
  }
  final _textEditingController = TextEditingController();
  final _textEditingController1 = TextEditingController();
  final _textEditingController2 = TextEditingController();
  final _textEditingController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Pooja Border Door',
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
          padding: const EdgeInsets.fromLTRB(0.0,200.0,0.0,0.0),
          child: Container(
            child:Column(

              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,10.0),
                  child: Text(
                      'Size ' ,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'JosefinSans',

                          fontSize: 30.0)
                  ),
                ),

                SizedBox(height: 20.0,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,10.0),
                      child: Text(
                          'Side : ' ,
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


                SizedBox(height: 20.0,),

                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,10.0),
                      child: Text(
                          'Top : ' ,
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
                SizedBox(height: 20.0,),
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
                            groupValue: polish,
                            activeColor: Color.fromARGB(255, 175, 106, 4),
                            onChanged: (value){
                              setPolish(value);//selected value
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
                              setPolish(value);//selected value
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
                  padding: const EdgeInsets.fromLTRB(20.0,50.0,0.0,0.0),
                  child: Container(
                    width: 250.0,
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

                            await setValue();
                            Map<String, String> map = Map.from(widget.users["anyWoodDoors"][widget.index]);

                            map["anyWoodDoor Top Size"] = t1;
                            map["anyWoodDoor Side Size"] = s1;
                            map["anyWoodDoor Polish"] = polish.toString();

                            widget.users["anyWoodDoors"][widget.index] = map;

                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => anyWoodDoor4(users:widget.users, index:widget.index))
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
      ),
    );
  }

}
