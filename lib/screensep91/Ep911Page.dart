import 'package:flutter/material.dart';


class Ep911Page extends StatefulWidget {
  @override
  _Ep911PageState createState() => _Ep911PageState();
}

class _Ep911PageState extends State<Ep911Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP81-1: Download and upload Github'),),
      body: ListView(children: <Widget>[
        Image(image: AssetImage('assets/images/ep81 (1).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (2).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (3).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (4).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (5).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (6).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (7).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (8).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (9).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (10).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (11).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (12).JPG'),),
        Image(image: AssetImage('assets/images/ep81 (13).JPG'),),                                                                                                          
      ],),
      
    );
  }
}