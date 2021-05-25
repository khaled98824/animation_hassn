import 'package:flutter/material.dart';

class ExplicitAnimationH extends StatefulWidget {
  @override
  _ExplicitAnimationHState createState() => _ExplicitAnimationHState();
}

class _ExplicitAnimationHState extends State<ExplicitAnimationH>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
      // lowerBound: 0.5,
      // upperBound: 1.0,
    )..repeat(reverse: true, max: 1.0, min: 0.2);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animation'),
      ),
      body: Center(
          child: buildFadeTransition()),
    );
  }

  FadeTransition buildFadeTransition() {
    return FadeTransition(
          opacity: _animation,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: FlutterLogo(size: 184),
          ),
        );
  }

  SizeTransition buildSizeTransition() {
    return SizeTransition(
      sizeFactor: _animation,
      axis: Axis.horizontal,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(size: 184),
      ),
    );
  }

  ScaleTransition buildScaleTransition() {
    return ScaleTransition(
      scale: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(
          size: 184,
        ),
      ),
    );
  }

  RotationTransition buildRotationTransition() {
    return RotationTransition(
      turns: _animation,
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: FlutterLogo(
          size: 144,
        ),
      ),
    );
  }
}
