import 'package:cloud_firestore/cloud_firestore.dart';

//==================================================
// CLASS CUSTOMER MODEL
//==================================================


class RestCustomerModel{
//==================================================
// 1) CLASS PROPERTY
//==================================================
final String customerName;
final String mobileNo;
final int noOfGuest;

//==================================================
// 2) CONSTUCTURE
//==================================================
RestCustomerModel({
  this.customerName,
  this.mobileNo,
  this.noOfGuest,
});

//==================================================
// 3) FUNCTION TO FIRESTORE
//==================================================
Map<String, dynamic> toFireStore(){
  return {
    'customerName': customerName,
    'mobileNo': mobileNo,
    'noOfGuest': noOfGuest,    
  }; 
}

//========================================================
// 4) FACTORY METHOD (FROMFILESTORE) TO GENERATE  OBJECT
//========================================================
  factory RestCustomerModel.fromFireStore(DocumentSnapshot doc){
    Map data = doc.data;
    return RestCustomerModel(
      customerName: data['customerName'],
      mobileNo: data['mobileNo'],
      noOfGuest: data['noOfGuest'],      
                                          
    );
  }


}
