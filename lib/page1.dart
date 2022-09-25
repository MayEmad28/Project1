import 'package:flutter/material.dart';
import 'main.dart';
import 'package:intl/intl.dart';
bool _swVal=false;
bool _swVal1=false;
bool _swVal2=false;
String sw="";
class Page1 extends StatefulWidget{
  @override
  State<Page1> createState() => _Page1State();
}
class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    var s = TextStyle(color: Colors.brown[400], fontWeight: FontWeight.w700);
    var ss = TextStyle(color: Colors.brown[400], fontWeight: FontWeight.w500);
    return Scaffold(
        body: Scaffold(
            appBar: AppBar(
              title: const Text("CostaWay Resort"),
              backgroundColor: Colors.brown[400],
            ),
            body:Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(leading:Image.asset("images/s.jpg",fit: BoxFit.cover,height: 300,width: 100,)
                    ,title: Row(
                      children: [
                        Text("Single Room",style: s,),
                        SizedBox(
                          width: 15,
                        ),
                        Switch(
                          value: _swVal,
                          onChanged: (bool v){
                            setState(() {
                              _swVal=v;
                              sw='Single';
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                    children: [
                      ListTile(
                        leading: Image.asset("images/R1.png",height:100,width: 100 ,),
                        title: Text("A Room assigned to one person",style: ss,),
                      )
                    ],

                  ),
                ),
                SizedBox(
                  height: 15,

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(leading:Image.asset("images/dd.jpg",fit: BoxFit.cover,height: 300,width: 100,)
                    ,title: Row(
                      children: [
                        Text("Double Room",style: s,),
                        SizedBox(
                          width: 10,
                        ),
                        Switch(
                          value: _swVal1,
                          onChanged: (bool v){
                            setState(() {
                              _swVal1=v;
                              sw='Double';
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                    children: [
                      ListTile(
                        leading: Image.asset("images/R.png",height:100,width: 100 ,),
                        title: Text("A Room assigned to two people",style: ss,),
                      ),

                    ],

                  ),

                ),
                SizedBox(
                  height: 15,

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ExpansionTile(leading:Image.asset("images/hh3.jpg",fit: BoxFit.cover,height: 300,width: 100,)
                    ,title: Row(
                      children: [
                        Text("Suite Room",style: s,),
                        SizedBox(
                          width: 20,
                        ),
                        Switch(
                          value: _swVal2,
                          onChanged: (bool v){
                            setState(() {
                              _swVal2=v;
                              sw='Suite';
                            });
                          },
                          activeColor: Colors.blue,
                        ),
                      ],
                    ),
                    children: [
                      ListTile(
                        leading: Image.asset("images/R.png",height:100,width: 100 ,),

                        title: Text("A Room with one or more bedrooms and seprate living space",style: ss,),
                      ),

                    ],

                  ),

                ),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                  width: 250,
                  child: Container(
                      child:   RaisedButton(onPressed: (){
                        showDialog(barrierDismissible: false,context: context,
                            builder: (BuildContext context ){
                              return AlertDialog(
                                title: Text('Are you sure you want to proceed?'),
                                content:Container(
                                  height: 200,
                                  child: Column(
                                      children: [
                                        Text("This is a confirmation message that you agree on all data you entered:"),
                                        Text("Check-in Date:${DateFormat.yMMMd().format(selectedDate)}"),
                                        Text("Check-out Date:${DateFormat.yMMMd().format(selectedDate1)}"),
                                        Text("Number of Adults:${value.round()}"),
                                        Text("Number of children:${v.round()}"),
                                        Text("Extras:${check}"),
                                        Text("View:${check1}"),
                                        Text("Chosen Rooms:${sw}"),
                                      ]),
                                ),
                                actions: <Widget>[
                                  RaisedButton( onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => MyApp()));
                                  },
                                    child: Text("Confirm",style: TextStyle(color: Colors.white),),color: Colors.brown[400],),
                                  RaisedButton(onPressed: (){Navigator.of(context).pop();},
                                    child: Text("Discard",style: TextStyle(color: Colors.white),),color: Colors.brown[400],),
                                ],
                              );
                            });
                      },
                        child: Text("Book Now!",style: TextStyle(color: Colors.white)),
                        color: Colors.brown[400],
                      )
                  ),
                )
              ],
            )
        )
    );
  }
}