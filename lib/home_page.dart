import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage>{
  int bmi = 0;
  bool flag = true;
  int index = -1;
  List<Map<String,dynamic>>map=[
    {
      "bgColor" : Colors.lightBlueAccent.shade200,
      "images" : Image.asset("assets/images/unhealthy.jpeg",fit: BoxFit.contain,),
      "health" : "Under Weight",
    },
    {
      "bgColor" : Colors.green.shade200,
      "images" : Image.asset("assets/images/healthy_person.jpeg",fit: BoxFit.contain,),
      "health" : "Healthy",
    },
    {
      "bgColor" : Colors.redAccent.shade100,
      "images" : Image.asset("assets/images/overweight.jpeg",fit: BoxFit.contain,),
      "health" : "Over Weight",
    },

  ];
  @override
  Widget build(BuildContext context) {
    TextEditingController wtController = TextEditingController();
    TextEditingController htFtController = TextEditingController();
    TextEditingController htInController = TextEditingController();
    return Scaffold(
       backgroundColor:index == -1 ? Colors.pinkAccent.shade100 : map[index]["bgColor"],
      appBar: AppBar(
        title: Center(child: Text("BMI Calculator")),
        backgroundColor: Colors.pinkAccent.shade200,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Weight(kg)",style: TextStyle(fontSize: 25,fontFamily: "Main"),),
                    SizedBox(height: 25,),
                    Text("Height(ft)",style: TextStyle(fontSize: 25,fontFamily: "Main"),),
                    SizedBox(height: 25,),
                    Text("Height(inch)",style: TextStyle(fontSize: 25,fontFamily: "Main"),),
                  ],
                ),
              ),
              SizedBox(width: 30,),
              Column(
                children: [
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextField(
                      controller: wtController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextField(
                      controller: htFtController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 50,
                    width: 250,
                    child: TextField(
                      controller: htInController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                          )
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                if(wtController.text.isNotEmpty &&
                    htInController.text.isNotEmpty &&
                     htFtController.text.isNotEmpty) {
                  int wt = int.parse(wtController.text.toString());
                  int htF = int.parse(htFtController.text.toString());
                  int htI = int.parse(htInController.text.toString());
                  var tinch = (htF * 12) + htI;
                  var tcm = tinch * 2.54;
                  var tHeight = tcm / 100;
                  bmi = wt ~/ pow(tHeight, 2);
                  if(bmi < 18){
                    index = 0;
                  }else if(bmi >= 18 && bmi <= 25){
                    index = 1;
                  }else index = 2;
                  flag = true;
                  setState(() {

                  });
                }else{
                  flag = false;
                  setState(() {

                  });
                }
          },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: Text("Calculate",style: TextStyle(fontFamily: "Main",fontSize: 20,),)
          ),
          SizedBox(height: 20,),
          flag == true ?Text("Your BMI is",style: TextStyle(fontSize: 25,fontFamily: "Main"),) :
          Text("Please fill all required blanks",style: TextStyle(fontSize: 25,fontFamily: "Main"),) ,
          SizedBox(height: 15,),
          flag == true?Text(bmi.toString(),style: TextStyle(fontSize: 30,fontFamily: "Main",),): Container(),
          SizedBox(height: 15,),
          index != -1 ? Text("You are ${map[index]["health"]}",style: TextStyle(fontFamily: "Main",fontSize: 15,fontWeight: FontWeight.bold),) : Container(),
          SizedBox(height: 15,),
          Container(
            height: 150,
            width: 150,
            child: index > -1 ? map[index]["images"] : Container(),
          )
        ],
      ),
    );
  }
}