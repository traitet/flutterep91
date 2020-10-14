

//==================================================
// CLASS ORDER MODEL
//==================================================
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/RestCustomerModel.dart';
import '../models/RestOrderItemModel.dart';

class RestOrderModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
RestCustomerModel customerInfo;
List <RestOrderItemModel> listOrderItemModel;
final String tableNo;
final String orderNo;
final DateTime timeStamp;

//==================================================
// 2) CONSTUCTURE
//==================================================
RestOrderModel({
  this.listOrderItemModel,
  this.customerInfo,
  this.tableNo,
  this.orderNo,
  this.timeStamp,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'listOrderItemModel': List<dynamic>.from(listOrderItemModel.map((e) => e.toFireStore())), // VERY DIFFICULT CODE
    'customerInfo': customerInfo.toFireStore(),
    'tableNo': tableNo,
    'orderNo': orderNo,
    'timeStamp': DateTime.now(),    
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory RestOrderModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return RestOrderModel(
      tableNo: data['tableNo'],
      orderNo: data['orderNo'],
      timeStamp: data['timeStamp'],
      customerInfo: RestCustomerModel.fromFireStore(doc),
      listOrderItemModel: List<RestOrderItemModel>.from(data['RestOrderItemModel'].map((e) { 
        RestOrderItemModel.fromFireStore(doc);
      })),
                                        
    );
  }

}//END CLASS