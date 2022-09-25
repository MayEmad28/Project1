import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';
import 'package:mai/page1.dart';
var value = 0.0;
var v = 0.0;

int RadioValue = 0;
List<String> check=[""];
String check1="";
DateTime selectedDate = DateTime.now();
DateTime selectedDate1 = DateTime.now();
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(fontFamily: 'DynaPuff'),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var s = TextStyle(color:Colors.brown[400], fontWeight: FontWeight.w700);

  void _datePicker () {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2023))
        .then((value) {
      if (value == null) return;
      setState(() {
        selectedDate = value;
      });
    });
  }
  void _datePicke1r() {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2023))
        .then((value) {
      if (value == null) return;
      setState(() {
        selectedDate1 = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text(
            "CostaWay Resort",
          ),
        ),
        body: Container(
            child: ListView(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: Image.asset(
                    "images/h4.jpg",
                  ),
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Check-in Date:',
                          style: s,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    IconButton(
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          _datePicker();
                        },
                        icon: Icon(Icons.date_range)),
                    Container(
                      child: Text(('${DateFormat.yMMMd().format(selectedDate)}'),
                          style: s),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Check-out Date:',
                          style: s,
                        )),
                    SizedBox(
                      width: 3,
                    ),
                    IconButton(
                        alignment: Alignment.topLeft,
                        onPressed: () {
                          _datePicke1r();
                        },
                        icon: Icon(Icons.date_range)),
                    Container(
                      child: Text(('${DateFormat.yMMMd().format(selectedDate1)}'),
                          style: s),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("Number of Adults:", style: s),
                      padding: EdgeInsets.all(5),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      child: Slider(
                        value: value,
                        onChanged: (val) {
                          setState(
                                () {
                              value = val;
                            },
                          );
                        },
                        min: 0,
                        max: 10,
                        label: "Adults",
                        activeColor: Colors.brown[400],
                        inactiveColor: Colors.brown[100],
                      ),
                    ),
                    Container(
                      child: Text("${(value.round())}", style: s),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("Number of Children:", style: s),
                      padding: EdgeInsets.all(5),
                    ),
                    Container(
                      padding: EdgeInsets.all(1),
                      child: Slider(
                        value: v,
                        onChanged: (val) {
                          setState(
                                () {
                              v = val;
                            },
                          );
                        },
                        min: 0,
                        max: 10,
                        label: "Children",
                        activeColor: Colors.brown[400],
                        inactiveColor: Colors.brown[100],
                      ),
                    ),
                    Container(
                      child: Text("${(v.round())}", style: s),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Text("Extras:", style: s),
                  alignment: Alignment.topLeft,
                ),
                Column(
                  children: [
                    CheckboxGroup(
                      labels: <String>[
                        "Breakfast (50EGP/Day)",
                        "Internet Wifi (50EGP/Day)",
                        "Parking (100EGP/Day)"
                      ],
                      onSelected: (List<String> checked) => check=checked,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        "View",
                        style: s,
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    RadioButtonGroup(
                        labels: <String>["Garden View", "Sea View"],
                        onSelected: (String selected) => check1=selected),
                  ],
                ),
                Center(
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Page1()));
                    },
                    child: Text("Check Rooms and Rates",
                        style: TextStyle(color: Colors.white)),
                    color: Colors.brown[400],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
