import 'package:flutter/material.dart';
import 'package:highrisers/2.0/pages/shutter2.dart';
import 'myNilai2.dart';
import 'myNilai4.dart';
class shutter1 extends StatefulWidget {
  final users;
  final index;
  const shutter1({Key? key, required this.users, this.index}) : super(key: key);

  @override
  _shutter1State createState() => _shutter1State();
}

class _shutter1State extends State<shutter1> {
  String woodType = "";
  String number = "";
  String thick = "";
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
          'Shutters',
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
            padding: const EdgeInsets.fromLTRB(0.0,100.0,0.0,0.0),
            child: Container(
              child:Column(

                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20.0,0.0,0.0,0.0),
                        child: Text(
                            'Glass : ',
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
                  padding: const EdgeInsets.fromLTRB(10.0,0.0,0.0,10.0),
                  child: Text(
                  'Thickness(mm) : ' ,
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
    labelText: 'Thickness',
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
    thick = value!;
    },
    ),
    ),
    ),
    ),
    ),
    ],
    ): Container(),

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
                              Map<String, String> map = Map.from(widget.users["shutters"][widget.index]);

                              map["shutter glass"] = option;
                              if(map["shutter Glass"] == "Yes")
                                map["shutter Thickness"] = thick;
                              else
                                map["shutter Thickness"] = "NA";

                              widget.users["shutters"][widget.index] = map;
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => shutter2(users:widget.users, index:widget.index))
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
