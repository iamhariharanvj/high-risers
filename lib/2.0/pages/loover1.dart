import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/shutter1.dart';
import 'anyWoodNilai2.dart';
import 'loover2.dart';
import 'myNilai2.dart';
class loover1 extends StatefulWidget {
  final users;
  const loover1({Key? key, required this.users}) : super(key: key);

  @override
  _loover1State createState() => _loover1State();
}

class _loover1State extends State<loover1> {
  int number = 0;
  final _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey[100],
        appBar: AppBar(
          title: Text(
            'Loover',
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
                    SizedBox(height: 20.0,),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,10.0),
                          child: Text(
                              'No. of pieces : ' ,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'JosefinSans',

                                  fontSize: 25.0)
                          ),
                        ),

                        Container(

                          child: Padding(
                            padding: const EdgeInsets.only(left:15.0),
                            child: SizedBox(
                              height: 80.0,
                              width: 150.0,
                              child: Center(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    // hintText: 'Enter type of wood',
                                    labelText: 'No.of pieces',
                                    labelStyle: TextStyle(
                                      color: Color.fromARGB(255, 175, 106, 4),
                                    ),
                                    // prefixIcon: Icon(
                                    //   Icons.person,
                                    //   color: Color.fromARGB(255, 175, 106, 4),
                                    // ),
                                    //labelText: 'Name',
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
                                  validator: (String? value){
                                    if(value == null || value.isEmpty)
                                      return "Please Enter number of pieces";
                                  },
                                  onChanged: (String? value){
                                    number = int.parse(value!);
                                  },
                                ),
                              ),
                            ),
                          ),
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
                                widget.users["loover No. of pieces"] = number;
                                widget.users["loovers"] = List<Map<String, String>>.filled(number, Map(), growable: false);

                                Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => loover2(users:widget.users, index:0))
                                  );
                                print(widget.users);




                              }

                          ),
                        ),
                      ),
                    ),
                  ],
                )
            ),
          ),
        )
    );
  }

}
