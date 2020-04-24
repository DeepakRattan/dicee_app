import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:math';

void main() {
  return runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('Dicee'),
        backgroundColor: Colors.red,
      ),
      body: DicePage(),
    ),
  ));
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    // On hot reload build function is called again and it looks what has updated here since
    // the last time it was run.
    return Center(
      child: Row(
        children: <Widget>[
          // Expanded widget expands the child of Row,column or Flex
          // to fill the available space in the main axis
          Expanded(
            /*child: Image(
              image: AssetImage('images/dice1.png'),
            ),*/
            // To detect user interaction ,wrap the Image widget with
            // FlatButton which contains onPressed attribute
            child: FlatButton(
              onPressed: () {
                changeDiceFace();
              },
              child: Image.asset('images/dice$leftDiceNumber.png'),
            ),
          ),
          Expanded(
            child: FlatButton(
                onPressed: () {
                  changeDiceFace();
                },
                child: Image.asset('images/dice$rightDiceNumber.png')),
          )
        ],
      ),
    );
  }

  void changeDiceFace() {
    // setState() method triggers a rebuild .So it looks within these curly braces
    // of build method and see what has changed. The only thing that has been changed
    // is our images should no longer be displaying the previous dice based on the previous
    // left dice number . So when we call setState() and we update a value, it will see where it
    // needs the updates and it will do so accordingly .

    // setState() marks certain things as dirty .So in our code,when we call setState() and we
    // update our leftDiceNumber , it will mark all of the places where it's being used as dirty .
    // It means when we call build again and everything inside here gets re-evaluated , it will finds
    // the things that are marked as dirty and it will redraw .

    // So when we click on the FlatButton , it tells the app that left dice number has been changed
    // and everywhere leftDiceNumber is used needs to be updated and it marks it as dirty and then
    // it redraws the entire screen and updates the dice .

    setState(() {
      // Random().nextInt(6) - Generate random number between 0 - 5
      // Random().nextInt(6) + 1 - Generate random number between 1 - 6
      leftDiceNumber = Random().nextInt(6) + 1;
      rightDiceNumber = Random().nextInt(6) + 1;
    });
  }
}
