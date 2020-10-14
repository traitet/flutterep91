import 'package:flutter/material.dart';


class Ep921Page extends StatefulWidget {
  @override
  _Ep921PageState createState() => _Ep921PageState();
}

class _Ep921PageState extends State<Ep921Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('EP92-1: Coding: Model Mapping FireStore DB and Flutter Class',style: TextStyle(fontSize: 14),maxLines: 2,),),      
      body: ListView(children: <Widget>[
        Image(image: AssetImage('assets/images/ep92 (1).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (2).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (3).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (4).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (5).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (6).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (7).JPG'),),
        Image(image: AssetImage('assets/images/ep92 (8).JPG'),),        
                                                                                                        
      ],),
      
    );
  }
}