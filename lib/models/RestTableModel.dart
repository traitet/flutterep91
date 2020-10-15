import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/RestCustomerModel.dart';


//==================================================
// CLASS TABLE MODEL
//==================================================
class RestTableModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String tableNo;
final String orderNo;
final String orderStatus;
final DateTime timeStamp;
final RestCustomerModel customerInfo;

//==================================================
// 2) CONSTUCTURE
//==================================================
RestTableModel({
  this.tableNo,
  this.orderNo,
  this.orderStatus,
  this.timeStamp,  
  this.customerInfo,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'tableNo': tableNo,
    'orderNo': orderNo,
    'orderStatus': orderStatus,
    'timeStamp': DateTime.now(),
    'customerInfo': customerInfo.toFireStore(),        
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory RestTableModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return RestTableModel(
      tableNo: data['tableNo'],
      orderNo: data['orderNo'],
      orderStatus: data['orderStatus'],
      timeStamp: DateTime.now(),
      customerInfo: RestCustomerModel.fromFireStore(doc),       
                                          
    );
  }
}