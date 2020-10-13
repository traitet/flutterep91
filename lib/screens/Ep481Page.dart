import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Ep481Page extends StatefulWidget {
  @override
  _Ep481PageState createState() => _Ep481PageState();
}

class _Ep481PageState extends State<Ep481Page> {
//======================================================
// STEP#1: SNACKBAR
//======================================================  
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();  
//======================================================
// DECLARE VARIABLE
//======================================================    
  final TextEditingController menuIdController = TextEditingController()..text = 'M0001';
  final TextEditingController menuNameEngController = TextEditingController()..text = 'Fried Rice';
  final TextEditingController menuNameThaiController = TextEditingController()..text = 'ข้าวผัดหมู';
  final TextEditingController menuDescriptionEngController = TextEditingController()..text = 'Fried Rice. Awesome';
  final TextEditingController menuDescriptionThaiController = TextEditingController()..text = 'ข้าวผัดหมู อร่อยมาก ๆ';    
  final TextEditingController priceController = TextEditingController()..text = '100';         
  final TextEditingController remarkController = TextEditingController()..text = 'Good for forigeners';   
  final TextEditingController ratingController = TextEditingController()..text = '3';
  final TextEditingController spicyLevelController = TextEditingController()..text = '1';   
  String menuCategoryValue = 'Food';       
  @override
  Widget build(BuildContext context) {

    return Scaffold(
//======================================================
// STEP#2: SNACKBAR : DEFINE KEY
//======================================================  
      key: scaffoldKey,         
      appBar: AppBar(title: Text('EP48-1: Save New Food Menu'),
//===================================================
// ACTION
//===================================================      
        actions: <Widget>[
          IconButton(icon: Icon(Icons.photo_camera), onPressed: (){}),
          IconButton(icon: Icon(Icons.add), onPressed: (){}),          
        ],
      ),
//===================================================
// BODY
//===================================================
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: <Widget>[
//===================================================
// UPLOAD IMAGE
//===================================================          
          RaisedButton(onPressed: (){}, child: Text('Click to upload photo',style: TextStyle(color: Colors.white),), color: Colors.blue,),   
          Image(
            height: 150,
            width: 150,
            image: AssetImage('assets/images/pic1.jpg'),)  ,        

//===================================================
// TEXT FORM FIELD
//===================================================                       
          TextFormField(controller: menuIdController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu ID',hintText: 'Menu ID 20 digits'),),
//===================================================
// MENU CATEGORY (DROPDOWN)
//===================================================
          DropdownButton<String>(
            value: menuCategoryValue,
            icon: Icon(Icons.arrow_drop_down),
            iconSize: 24,
            elevation: 18,
            underline: Container(height: 2, color: Colors.blue,),
            style: TextStyle(color: Colors.red, fontSize: 20),
            items: <String> ['Food','Drinks','Dessert','Set Menu'].map<DropdownMenuItem<String>>((String value){
              return DropdownMenuItem<String>(child: Text(value),value: value);
            }).toList(),
            onChanged: (String newValue){menuCategoryValue = newValue;}),    
//===================================================
// TEXT FORM FIELD
//===================================================                   
          TextFormField(validator: (String value){if (value.isEmpty)  {return 'Please fill data';}else return null;},controller: menuNameEngController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Name Eng',hintText: 'Menu Name Eng 20 digits'),),
          TextFormField(controller: menuNameThaiController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Name Thai',hintText: 'Menu Name Thai 20 digits'),),
          TextFormField(validator: (String value){if (value.isEmpty)  {return 'Please fill data';}else if (value.length > 30)  {return 'Please fill equal or less than 20 digits';}
            else return null;},controller: menuDescriptionEngController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Desc Eng',hintText: 'Menu Description Eng 30 digits'),),
          TextFormField(validator: (String value){if (value.isEmpty)  {return 'Please fill data';}else if (value.length > 30)  {return 'Please fill equal or less than 30 digits';}
            else return null;},controller: menuDescriptionThaiController,autovalidate: true,decoration: InputDecoration(labelText: 'Menu Desc Thai',hintText: 'Menu Description Thai 20 digits'),),
          TextFormField(keyboardType: TextInputType.number,controller: priceController,autovalidate: true,decoration: InputDecoration(labelText: ' Price',hintText: 'Price 2 digits'),),       
          TextFormField(keyboardType: TextInputType.number,controller: spicyLevelController,autovalidate: true,decoration: InputDecoration(labelText: ' Spicy Level',hintText: 'Spicy Level'),), 
          TextFormField(keyboardType: TextInputType.number,controller: ratingController,autovalidate: true,decoration: InputDecoration(labelText: ' Rating',hintText: 'Rating'),),           
          TextFormField(controller: remarkController,autovalidate: true,decoration: InputDecoration(labelText: ' Remark',hintText: 'Remark',),maxLines: 5,minLines: 2,),
//===================================================
// BUTTON
//===================================================          
          RaisedButton(onPressed: (){
//===================================================
// EP48-1: CALL SAVE MENU FUNCTION
//===================================================              
              fnSaveMenuToDb();
          }, child: Text('Save',style: TextStyle(color: Colors.white),), color: Colors.blue,),   
                                                             
        ],),
      ),
      
    );
  }
//===================================================
// EP48-1: SAVE MENU FUNCTION
//===================================================  
  fnSaveMenuToDb() {
//===================================================
// SAVE DATA TO DB
//===================================================      
    Firestore.instance.collection('TM_MENUS').document(menuIdController.text).setData({
      'menuId': menuIdController.text,
      'menuCategoryValue': menuCategoryValue,
      'menuDescriptionEng': menuDescriptionEngController.text,
      'menuDescriptionThai': menuDescriptionThaiController.text,
      'menuNameEng': menuNameEngController.text,
      'menuNameThai': menuNameThaiController.text,
      'price': double.parse(priceController.text),
      'spicyLevel': int.parse(spicyLevelController.text),
      'rating': int.parse(ratingController.text),
      'remark': remarkController.text,
    })
//===================================================
// SAVE OK
//===================================================      
    .then((value) {
    //======================================================
    // OK: SNACKBAR : SHOW SNACKBAR
    //====================================================== 
        scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text('Save Menu: ${menuIdController.text} completed' ))) ;   

    })
//===================================================
// SAVE ERROR
//===================================================        
    .catchError((error){
    //======================================================
    // ERROR: SNACKBAR : SHOW SNACKBAR
    //====================================================== 
        scaffoldKey.currentState.showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text('Register Menu error due to $error' ))) ;         
    });
   
  }// END FUNCTION

}// END CLASS