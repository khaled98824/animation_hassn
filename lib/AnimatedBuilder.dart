import 'package:flutter/material.dart';

class AnimatedBuilderH extends StatefulWidget {
  @override
  _AnimatedBuilderHState createState() => _AnimatedBuilderHState();
}

class _AnimatedBuilderHState extends State<AnimatedBuilderH>
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
      lowerBound: 0.5,
      upperBound: 3.0,
    )..repeat(
        reverse: true,
        // max: 1.0,
        // min: 0.2,
      );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    );
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
          child: Transform.scale(
        scale: 3,
        child: AnimatedBuilder(
          animation: _controller,
          builder: (ctx, child) => OutlineButton(
            onPressed: () {},
            child: Text('Click Me'),
            borderSide: BorderSide(width: _controller.value),
          ),
        ),
      )),
    );
  }
}

// class OutlineButtonTrainsition extends AnimatedWidget {
//    OutlineButtonTrainsition({width}) : super(listenable:width );
//
// Animation? get width => listenable;
//
//   @override
//   Widget build(BuildContext context) {
//     return OutlineButton(
//       onPressed: (){
//
//       },
//       child: Text('Click Me'),
//       borderSide: BorderSide(width: width!.value),
//     );
//   }
//
// }
