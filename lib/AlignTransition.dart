import 'package:flutter/material.dart';

class AlignTransitionH extends StatefulWidget {
  @override
  _AlignTransitionHState createState() => _AlignTransitionHState();
}

class _AlignTransitionHState extends State<AlignTransitionH>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

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
    _animation =
        Tween<Offset>(begin:Offset(0.0,1.0), end:Offset(0.0,1.0)).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
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
          child: SlideTransition(
            position: _animation,
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: FlutterLogo(size: 184),
            ),
          )),
    );
  }
// عند استخدان ال AlignTransition يجب تعديل نوع animation
  // AlignTransition buildAlignTransition() {
  //   return AlignTransition(
  //     alignment: _animation,
  //     child: const Padding(
  //       padding: EdgeInsets.all(8.0),
  //       child: FlutterLogo(size: 184),
  //     ),
  //   );
  // }
}
