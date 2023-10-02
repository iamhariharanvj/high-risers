import 'package:flutter/material.dart';
import 'bedroomNilai4.dart';
import 'myNilai2.dart';
import 'myNilai4.dart';
class bedroomNilai3 extends StatefulWidget {
  final users;
  final index;
  const bedroomNilai3({Key? key, required this.users, required this.index}) : super(key: key);

  @override
  _bedroomNilai3State createState() => _bedroomNilai3State();
}

class _bedroomNilai3State extends State<bedroomNilai3> {
  String woodType = "";
  String number = "";
  String option = "";
  String grillside = "";
  String bottomstep = "";
  String polish = "";
  final _textEditingController = TextEditingController();
  setDoor(val){
    setState(() {
      option = val;
    });
  }
  setSide(val){
    setState(() {
      grillside = val;
    });
  }
  setStep(val){
    setState(() {
      bottomstep = val;
    });
  }
  setPolish(val){
    setState(() {
      polish = val;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      appBar: AppBar(
        title: Text(
          'Bedroom Nilai',
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
                            'Grill Design : ',
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
                              groupValue: option,
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
                              groupValue: option,
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
                  option == "Yes"? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
                        child: Text(
                            'உள்ளே நுழைபவரின் : ',
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'JosefinSans',

                                fontSize: 20.0)
                        ),
                      ),
                      Row(
                        children : [
                          Radio(
                              value: "வலது",
                              groupValue: grillside,
                              activeColor: Color.fromARGB(255, 175, 106, 4),
                              onChanged: (value){
                                setSide(value);
                              }
                          ),
                          Text(
                              'வலது ',
                              style: TextStyle(
                                  color: Color.fromARGB(255,225, 137, 5),
                                  fontFamily: 'JosefinSans',

                                  fontSize: 20.0)
                          ),
                        ],
                      ),
                      Row(
                        children : [
                          Radio(
                              value: "இடது",
                              groupValue: grillside,
                              activeColor: Color.fromARGB(255, 175, 106, 4),
                              onChanged: (value){
                                setSide(value);//selected value
                              }
                          ),
                          Text(
                              'இடது ',
                              style: TextStyle(
                                  color: Color.fromARGB(255,225, 137, 5),
                                  fontFamily: 'JosefinSans',

                                  fontSize: 20.0)
                          ),
                        ],
                      ),
                    ],
                  ): Container(),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
                        child: Text(
                            'Bottom Step: ',
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
                              groupValue: bottomstep,
                              activeColor: Color.fromARGB(255, 175, 106, 4),
                              onChanged: (value){
                                setStep(value);//selected value
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
                              groupValue: bottomstep,
                              activeColor: Color.fromARGB(255, 175, 106, 4),
                              onChanged: (value){
                                setStep(value);//selected value
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
                              Map<String, String> map = Map.from(widget.users["bedroomNilais"][widget.index]);
                              map["bedroom Grill Design"] = option;
                              if(map["bedroomNilai Grill Design"] == "Yes")
                                map["bedroomNilai Grill side"] = grillside;
                              else
                                map["bedroomNilai GrillSide"] = "NA";
                              map["bedroomNilai Bottom Step"] = bottomstep;
                              map["bedroomNilai Polish"] = polish;
                              widget.users["bedroomNilais"][widget.index] = map;
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => bedroomNilai4(users:widget.users, index: widget.index))
                              );
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
