

//==================================================
//CLASS ORDER ITEM INFO --> LIST
//==================================================
import 'package:cloud_firestore/cloud_firestore.dart';

class RestOrderItemModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String menuId;
final String menuNameEng;
final int qty;
final String status;
final String imageUrl;
final String menuDescriptionEng;
final DateTime orderTime;

//==================================================
// 2) CONSTUCTURE
//==================================================
RestOrderItemModel({
  this.menuId,
  this.menuNameEng,
  this.qty,
  this.status,
  this.imageUrl,
  this.menuDescriptionEng,
  this.orderTime,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'menuId': menuId,
    'menuNameEng': menuNameEng,
    'qty': qty,
    'status': status,
    'imageUrl': imageUrl,
    'menuDescriptionEng': menuDescriptionEng,
    'orderTime': DateTime.now(),            
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory RestOrderItemModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return RestOrderItemModel(
      menuId: data['menuId'],
      menuNameEng: data['menuNameEng'],
      qty: data['qty'],
      status: data['status'],          
      imageUrl: data['imageUrl'],  
      menuDescriptionEng: data['menuDescriptionEng'],  
      orderTime: data['orderTime']!=null?data['orderTime'].toDate():null,     //  PREVENT ERROR ABOUT MISMATCH BETWEEN FIRESTORE AND FLUTTER                                              
    );
  }


}