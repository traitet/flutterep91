import 'package:cloud_firestore/cloud_firestore.dart';

class MenuModel {
//========================================================
// 1) CALSS PROPERTY
//========================================================
  final String menuId;
  final String menuCategoryValue;
  final String menuNameEng;
  final String menuNameThai;  
  final String menuDescriptionEng;
  final String menuDescriptionThai;    
  final int rating;
  final double price;
  final int spicyLevel;
  final String imageUrl;

//========================================================
// 2) CONSTUCTURE
//========================================================
  MenuModel({
    this.menuId,
    this.menuCategoryValue,
    this.menuNameEng,
    this.menuNameThai,
    this.menuDescriptionEng,
    this.menuDescriptionThai,
    this.rating,
    this.price,
    this.spicyLevel,
    this.imageUrl,
  });

//========================================================
// 3) MAP DATA TO FIRESTORE FORMAT
//========================================================
Map<String, dynamic> toFireStore() => {
  'menuId': menuId,
  'menuCategoryValue':menuCategoryValue,
  'menuNameEng':menuNameEng,
  'menuNameThai':menuNameThai,
  'menuDescriptionEng':menuDescriptionEng,
  'menuDescriptionThai':menuDescriptionThai,
  'rating':rating,
  'price': price,
  'spicyLevel':spicyLevel ,
  'imageUrl': imageUrl,

};

//========================================================
// 6) FACTORY METHOD (FROMFILESTORE) TO GENERATE MENU OBJECT
//========================================================
  factory MenuModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return MenuModel(
      menuId: data['menuId'],
      menuCategoryValue: data['menuId'],
      menuNameEng: data['menuNameEng'],
      menuNameThai: data['menuNameThai'],
      menuDescriptionEng: data['menuDescriptionEng'],
      menuDescriptionThai: data['menuDescriptionThai'],
      rating: data['rating'],
      price: data['price'],   
      spicyLevel: data['spicyLevel'],
      imageUrl: data['imageUrl'],                                           
    );
  }

}



