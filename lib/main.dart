import 'dart:math';
import 'package:animation_hassn/AnimatedAlign.dart';
import 'package:animation_hassn/Animated_Positioned.dart';
import 'package:flutter/material.dart';

import 'AlignTransition.dart';
import 'AnimatedPadding.dart';
import 'AnimatedBuilder.dart';
import 'ExplicitAnimation.dart';
import 'HeroAnimation.dart';
import 'Login_Screen_Animation.dart';
import 'TweenAnimation.dart';

void main() => runApp(MaterialApp(
  home: LogIn_Up_Screen_Animation(),
));

class AnimatedContainerApp extends StatefulWidget {
  @override
  _AnimatedContainerAppState createState() => _AnimatedContainerAppState();
}

class _AnimatedContainerAppState extends State<AnimatedContainerApp> {
  // Define the various properties with default values. Update these properties
  // when the user taps a FloatingActionButton.
  bool visible = true;
  double _width = 50;
  double _height = 50;
  Color _color = Colors.green;
  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('AnimatedContainer Demo'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                // Use the properties stored in the State class.
                width: _width,
                height: _height,
                decoration: BoxDecoration(
                  color: _color,
                  borderRadius: _borderRadius,
                ),
                // Define how long the animation should take.
                duration: Duration(seconds: 1),
                // Provide an optional curve to make the animation feel smoother.
                curve: Curves.fastOutSlowIn,
              ),

              AnimatedOpacity(
                opacity: visible==true?1:0,
                duration: Duration(microseconds: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('jhaled alali '),
                    Text('jhaled alali '),
                    Text('jhaled alali ')

                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          // When the user taps the button
          onPressed: () {
            setState(() {
              // Create a random number generator.

              visible=!visible;
              double opacity = visible == true?1:0;
              final random = Random();

              // Generate a random width and height.
              _width = random.nextInt(300).toDouble();
              _height = random.nextInt(300).toDouble();

              // Generate a random color.
              _color = Color.fromRGBO(
                random.nextInt(256),
                random.nextInt(256),
                random.nextInt(256),
                visible==true?0:1,
              );

              // Generate a random border radius.
              _borderRadius =
                  BorderRadius.circular(random.nextInt(100).toDouble());
            });
          },
          child: Icon(Icons.flip),
        ),
      ),
    );
  }
}
