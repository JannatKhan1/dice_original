import 'package:flutter/material.dart';
import 'dart:math';
//random number generator

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        centerTitle: true,
        title: Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {

  int leftDiceNumber = 1; //var-keyword for variable, use $ to use variable name in string
  int rightDiceNumber = 1;
  void imageDisplay() {
    leftDiceNumber=Random().nextInt(6)+1;//0. to eliminate 0 add 1, 1. excluding the max in nextInt(max) 2.for whole number
    rightDiceNumber = Random().nextInt(6)+1; // you can also include set state here
  }
  @override
  Widget build(BuildContext context) {
    return Center( //use flutter outline to center
      child: Row(
        children: <Widget>[
          Expanded( //use bulb or alt+enter to remove widget and wrap and add padding
            flex:1 ,  //size of expanded widget ratio of flexibility with 2 expanded widgets
            child: TextButton(
              onPressed: (){
                setState(() {
                  imageDisplay();
                });
                //void callback-anonymous function
                //inside curly braces define what will happen in the function
              }, //onpressed expects void callback- no argument and return no data
              child: Image.asset('images/dice$leftDiceNumber.png' //image.asset and image.network-constructor shorten the code

                //to stop overflow: change width of images, it doesn't work in every mobile
                //use Expanded class - child of row /column, expand to fill the available space in main axis
              ),
            ),
          ),
          Expanded(
            flex: 1,//by default
            child: TextButton(
              onPressed: (){
                setState(() {
                  imageDisplay();
                });

              },
              child: Image.asset('images/dice$rightDiceNumber.png'
                //to stop overflow: change width of images, it doesn't work in every mobile
                //use Expanded class - child of row /column, expand to fill the available space in main axis
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//see buttons in documentation whichever you want- we will pick flat button
//use flutter inspector and flutter outline to check padding and stuff
//raised button comes with shape
//dart functions - bits of code together in a block - block of code
//void nameOfFunction(){//do Something}, nameOfFunction();<-- named function
//anonymous function --> (){} no name - very useful - do something without giving its name
//onpressed: (){} void call back function
// hot reload - reload only build method before build nothing will change
//variable using $ to insertion - called string interpolation
//variables - container
//syntax: var myName = 'Angela';
// when computer sees var- it create a box, the box gets named as myName and Angela is stored in it ;-closes the box
//print(myName); --> computer will pick up the box named myName, see the content and print the content in it
// string is in single quotes- dart convention
//you can reassign variable
//code runs from top to bottom
// var myName = 'x'; myName = 123- syntax error
// Dart = Statically Typed Language
//types of data: primitive data types: string(''), int-integer-whole numbers,double,bool-boolean value
//when we create the variable it will get the data type
//we can't change type of variable , that is Statically Typed Language
//javascript - dynamically typed language a can be string or int because variable is decided at run time
//dynamic-flexible,static-safe
// dart static--> dynamic by var a;<-- dynamic type variable
// a = 123; data type of a is dynamic
// a = 'hello'; no error
//Dart has a data type named dynamic - var doesn't have fixed data type
// dynamic c;
//String a = 123; error
// to not do accidents use String a or int a or double a or bool a
//avoid using var or dynamic -- unexpected things occuring

//Stateful vs Stateless Widgets
// action of clicking button to change the image
//create a variable outside the build method but update it inside build method
// Stateless - state of widget don't change- if you create row it will always be row
//Stateful - to update - use stateful widget
// state of app: the way that things are
//if app is always gonna have top app bar- then it is gonna be stateless widget
//creating something which is going to change- stateful widget
//stateless to stateful doesn't do hot reload -rerun the code

//set state- changes the state //do not forget set state
//working of set state-
// it will mark all the places where it is used as dirty,
//when build will called set state will clean the data where it is build
//update the whole screen
//if you already assign the variable in build method it doesn't change in set state-REMEMBER
