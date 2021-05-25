import 'dart:math';

import 'package:flutter/material.dart';


class TweenAnimationH extends StatefulWidget {

  @override
  _TweenAnimationHState createState() => _TweenAnimationHState();
}

class _TweenAnimationHState extends State<TweenAnimationH> {
  var _angle = 2.0;
  var _value = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder<double>(
              tween:Tween(begin: 0,end: _angle) ,

              duration: Duration(seconds: 2),
                child: Container(
                  height: 200,
                  width: 300,
                  color: Colors.green,
                ),
                builder:(_,angle,child)=>Transform.rotate(
                    angle:angle,
                  child:  child,
                ) ,
            ),
            Text('${(_value * (180 / pi)).round()}',
            style: TextStyle(fontSize: 32),),
            Slider(value: _value, onChanged: (val){
             setState(() {
               _value = val;
               _angle = val;
             });
            },
            min: 0,
              max: pi *2,
              divisions: 4,
            ),
          ],
        ),
      ),
    );
  }
}
