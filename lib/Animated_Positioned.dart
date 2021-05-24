import 'package:flutter/material.dart';
import 'dart:math';

class Animated_Positioned extends StatefulWidget {

  @override
  _Animated_PositionedState createState() => _Animated_PositionedState();
}

class _Animated_PositionedState extends State<Animated_Positioned> {
  bool visible = true;
  double _height=50;
  double _width=50;
  Color _color = Colors.green;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Positioned'),

      ),

      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.black12,
          ),

          Center(
            child: Text('My Text',style: TextStyle(fontSize: 32),),
          ),
          AnimatedPositioned(
            duration: Duration(seconds: 2),
            bottom: visible==true?250:340,
            right: 110,
            child: Container(
              width: _width,
              height: _height,
              color: _color,
            ),
          ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow_outlined),
        onPressed: (){
          setState(() {
            Random random = Random();
            visible = !visible;

            _width = random.nextInt(200).toDouble();
            _height = random.nextInt(200).toDouble();
            _color = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);


          });
        },
      ),
    );
  }
}
