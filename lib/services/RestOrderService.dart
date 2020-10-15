//===================================================
// IMPORT
//===================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterep11/models/RestOrderItemModel.dart';

//===================================================
// CONSTANT
//===================================================
const TABLE_COLLECTION_NAME = 'REST_TM_TABLES';
const ORDER_COLLECTION_NAME = 'REST_TT_ORDERS';
const ORDER_ITEM_COLLECTION_NAME = 'REST_TT_ORDER_ITEMS';
const MENU_COLLECTION_NAME = 'REST_TM_MENUS';

//===================================================
// CLASS
//===================================================
class RestOrderService {

//===================================================
// FUNCTION ADD ORDER ITEM
//===================================================
static Future<DocumentReference> addOrderItem({String orderNo, RestOrderItemModel restOrderItemModel})
{
  return Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME).add(restOrderItemModel.toFireStore())
  .then((value){
    print('ADD ORDER ITEM TO $ORDER_ITEM_COLLECTION_NAME COMPLTED WITH REF NO ${value.toString()} \n ${restOrderItemModel.toFireStore().toString()}');
  })
  .catchError((error){
    print('ADD ORDER ITEM TO $ORDER_ITEM_COLLECTION_NAME ERROR!!  \n ${restOrderItemModel.toFireStore().toString()}');    
  });

}

//===================================================
// FUNCTION UPDATE ORDER ITEM
//===================================================
static Future<void> updateOrderItem({String orderNo, RestOrderItemModel restOrderItemModel, String orderItemDocumentId}){
  return Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME).document(orderItemDocumentId).setData(restOrderItemModel.toFireStore())
  .then((value){
    print('ADD ORDER ITEM $orderItemDocumentId TO $ORDER_ITEM_COLLECTION_NAME COMPLTED \n ${restOrderItemModel.toFireStore().toString()}');
  })
  .catchError((error){
    print('ADD ORDER ITEM $orderItemDocumentId TO $ORDER_ITEM_COLLECTION_NAME ERROR!!  \n ${restOrderItemModel.toFireStore().toString()}');    
  });  
}

//===================================================
// FUNCTION DELETE ORDER ITEM
//===================================================
static Future<void> deleteOrderItem({String orderNo, String orderItemDocumentId}){
    return Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME).document(orderItemDocumentId).delete()
  .then((value){
    print('DELETE ORDER ITEM $orderItemDocumentId TO $ORDER_ITEM_COLLECTION_NAME COMPLTED');
  })
  .catchError((error){
    print('DELETE ORDER ITEM $orderItemDocumentId TO $ORDER_ITEM_COLLECTION_NAME ERROR!!');    
  });  
}

//===================================================
// FUNCTION GET ORDER ITEM (1 DOCUMENT)
//===================================================
static Future<RestOrderItemModel> getOrderItem({String orderNo, String orderItemDocumentId}){
    return Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME).document(orderItemDocumentId).get()
  .then((value){
    print('GET ORDER ITEM $orderItemDocumentId TO $ORDER_ITEM_COLLECTION_NAME COMPLTED \n ${RestOrderItemModel.fromFireStore(value)}');
    return RestOrderItemModel.fromFireStore(value);
  })
  .catchError((error){
    print('GET ORDER ITEM $orderItemDocumentId TO $ORDER_ITEM_COLLECTION_NAME ERROR!!');    
  });  
}

//===================================================
// FUNCTION GET ORDER ITEMS (MANY DOCUMENTS) FOR SUBMIT ORDER
//===================================================
static Stream<QuerySnapshot> getOrderItemsForSubmitOrder({String orderNo}){
  print('START STREAM GET ORDER ITEMS FOR SUBMIT ORDER OF ORDER NO $orderNo');
  return Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME).where('status',isEqualTo: 'ORDER').snapshots();
}

//===================================================
// FUNCTION GET ORDER ITEMS (MANY DOCUMENTS) FOR SUBMIT CHECK STATUS
//===================================================
static Stream<QuerySnapshot> getOrderItemsForCheckStatus({String orderNo}){
  print('START STREAM GET ORDER ITEMS FOR CHECK STATUS OF ORDER NO $orderNo');
  return Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME).snapshots();  
}

//===================================================
// FUNCTION GET ORDER ITEMS (MANY DOCUMENTS) FOR SUBMIT CHECK STATUS
//===================================================
static Stream<QuerySnapshot> getOrderItemsForMakePayment({String orderNo}){
  print('START STREAM GET ORDER ITEMS FOR CHECK STATUS OF ORDER NO $orderNo');
  return Firestore.instance.collection(ORDER_COLLECTION_NAME).snapshots();  
}


//===================================================
// FUNCTION
//===================================================
static submitOrder({String orderNo}) async {
//===================================================
// TRY
//===================================================  
  try
  {
//===================================================
// 1) GET ORDER ITEMS (ALL)
//===================================================    
  CollectionReference _ref =  Firestore.instance.collection(ORDER_COLLECTION_NAME).document(orderNo).collection(ORDER_ITEM_COLLECTION_NAME);
//===================================================
// 2) FILTER ORDER STATUS = ORDER
//===================================================  
  QuerySnapshot _snapshot = await _ref.where('status',isEqualTo: 'ORDER').getDocuments();
//===================================================
// 3) FOR EACH LOOK TO UPDATE DATA TO SUBMIT
//===================================================  
  _snapshot.documents.forEach((element) {
    element.reference.updateData({'status': 'SUMIT'});
  });
//===================================================
// 4) PRINT RESULT
//===================================================  
    print('SUBMIT ORDER COMPLETED OF ORDER NO $orderNo \n {${_snapshot.documents.toString()}');  
  }
//===================================================
// CATCH EROR
//===================================================  
  catch(error){
    print('SUBMIT ORDER ERROR OF ORDER NO $orderNo');      
  }


}




}