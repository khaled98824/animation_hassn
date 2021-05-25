import 'package:flutter/material.dart';

class HeroAnimationH extends StatefulWidget {
  @override
  _HeroAnimationHState createState() => _HeroAnimationHState();
}

class _HeroAnimationHState extends State<HeroAnimationH> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
          child: Builder(
            builder: (ctx)=>FlatButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>FlutterHero()));
                },
                child: Hero(
                  tag: 'to_flutter',
                  child: FlutterLogo(size: 55,),
                )),
          )),
    );
  }
}


class FlutterHero extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Big Flutter Logo'),),
      body: Center(child: Hero(
        tag: 'to_flutter',
        child: FlutterLogo(size: 350,),
      ),),
    );
  }

}