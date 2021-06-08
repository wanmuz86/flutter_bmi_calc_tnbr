import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double _heightValue = 170;
  double _weightValue = 65;
  // Create a new variable String
  String _message = "";
  // Create a new variable double
  double _bmi = 0;
  // Variable that stores color
  Color _bmiTextColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BMI Calculator"),backgroundColor: Colors.red,),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text("BMI Calculator", style: TextStyle(color: Colors.red, fontSize: 32),),
                SizedBox(height: 8,),
                Text("We care about your health"),
                SizedBox(height: 8,),
                Image.network("https://i.pinimg.com/originals/2c/91/a8/2c91a84269260953e662320dd798796e.png", height: 180,),
                SizedBox(height: 8,),
                Text("Height : ${_heightValue.toStringAsFixed(0)} cm"),
                Slider(
                  value: _heightValue,
                  min: 140,
                  max: 200,
                  onChanged: (double value) {
                    setState(() {
                      _heightValue = value;
                    });
                  },
                ),
                SizedBox(height: 8,),
                Text("Weight : ${_weightValue.toStringAsFixed(0)} kg"),
                Slider(
                  value: _weightValue,
                  min: 40,
                  max: 200,
                  onChanged: (double value) {
                    setState(() {
                      _weightValue = value;
                    });
                  },
                ),
                TextButton.icon(
                    onPressed: (){
                      // local variable
                      var bmiCalc = _weightValue/ (pow(_heightValue/100 , 2));
                      var tempMessage = "";
                      var tempColor = Colors.green ;
                      if (bmiCalc < 25){
                        tempMessage = "You are underweight";
                        tempColor = Colors.red;
                      }
                      else if (bmiCalc < 30){
                        tempMessage = "Normal weight";
                      }
                      else if (bmiCalc < 35){
                        tempMessage = "Overweight";
                        tempColor = Colors.red;
                      }
                      else {
                        tempMessage = "Obese";
                        tempColor = Colors.red;
                      }
                      setState(() {
                        _bmi = bmiCalc;
                        _message = tempMessage;
                        _bmiTextColor = tempColor;
                      });
                    },
                    icon: Icon(Icons.favorite),
                    label: Text("Calculate"),
                  style:TextButton.styleFrom(
                      backgroundColor: Colors.red,
                      primary: Colors.white)
                ),
                _message != "" ? Text("${_bmi.toStringAsFixed(1)}  :  $_message",
                  style: TextStyle(
                  color: _bmiTextColor
                ),) : SizedBox()

              ],
            ),
          ),
        ),
      ),
    );
  }
}


