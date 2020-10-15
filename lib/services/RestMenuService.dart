//===================================================
// IMPORT
//===================================================
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../models/RestMenuModel.dart';

//===================================================
// CONSTANT
//===================================================
const TABLE_COLLECTION_NAME = 'REST_TM_TABLES';
const ORDER_COLLECTION_NAME = 'REST_TT_ORDERS';
const MENU_COLLECTION_NAME = 'REST_TM_MENUS';

//===================================================
// CLASS
//===================================================
class RestMenuService {

//===================================================
// FUNCTION
//===================================================
static Future<void> saveMenu({RestMenuModel menuModel}){
  return Firestore.instance.collection(MENU_COLLECTION_NAME).document(menuModel.menuId).setData(menuModel.toFireStore())
  .then((value){
    print('SAVE MENU TO $MENU_COLLECTION_NAME COMPLETED. ${menuModel.toFireStore().toString()}');
  })
  .catchError((error){
    print('SAVE MENU TO $MENU_COLLECTION_NAME ERROR!!!. $error /n ${menuModel.toFireStore().toString()}');
  });
}

//===================================================
// FUNCTION GET MENUS (BY CATEGORY)
//===================================================
static Stream<QuerySnapshot> getMenusByCategory({String menuCategoryValue}){
  print('GET MENU BY CATEGORY FROM $MENU_COLLECTION_NAME COMPLETED.');
  return Firestore.instance.collection(MENU_COLLECTION_NAME).where('menuCategoryValue',isEqualTo: menuCategoryValue).snapshots();
}

//===================================================
// FUNCTION GET MENU
//===================================================
static Future<RestMenuModel> getMenu({String menuId}){
  return Firestore.instance.collection(MENU_COLLECTION_NAME).document(menuId).get()
  .then((value) {
    print('GET MENU FROM $MENU_COLLECTION_NAME COMPLETED. ${RestMenuModel.fromFireStore(value).toString()}');    
    return RestMenuModel.fromFireStore(value);
  })
  .catchError((error){
    print('GET MENU FROM $MENU_COLLECTION_NAME ERROR!!!. $error');    
  });
}

//==============================================
// FUNCTION UPLOAD MENU IMAGE
//==============================================
static Future<dynamic> uploadMenuImage({File file}) async {
  StorageReference storageReference = FirebaseStorage.instance.ref().child('REST_MENU_IMAGES').child(file.path);
  StorageUploadTask uploadTask = storageReference.putFile(file);
  await uploadTask.onComplete;
  return await storageReference.getDownloadURL();
}


}