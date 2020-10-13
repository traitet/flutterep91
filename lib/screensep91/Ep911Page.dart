import 'package:flutter/material.dart';


class Ep911Page extends StatefulWidget {
  @override
  _Ep911PageState createState() => _Ep911PageState();
}

class _Ep911PageState extends State<Ep911Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ep91-1: Download and upload Github'),),
      body: ListView(children: <Widget>[
        Image(image: AssetImage('assets/images/ep91 (1).JPG'),),
        Image(image: AssetImage('assets/images/ep91 (2).JPG'),),
        Image(image: AssetImage('assets/images/ep91 (3).JPG'),),
        Image(image: AssetImage('assets/images/ep91 (4).JPG'),),
        Image(image: AssetImage('assets/images/ep91 (5).JPG'),),
        Image(image: AssetImage('assets/images/ep91 (6).JPG'),),                                                                                                        
      ],),
      
    );
  }
}