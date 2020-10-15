//===================================================
// IMPORT
//===================================================
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterep11/models/RestOrderModel.dart';
import 'package:flutterep11/models/RestTableModel.dart';
import '../singletons/GlobalAppData.dart';
import '../models/RestCustomerModel.dart';

//===================================================
// CONSTANT
//===================================================
const TABLE_COLLECTION_NAME = 'REST_TM_TABLES';
const ORDER_COLLECTION_NAME = 'REST_TT_ORDERS';

//===================================================
// CLASS
//===================================================
class RestTableService {

//===================================================
// FUNCTION#1: OPEN TABLE
//===================================================
  static openTable({int noOfGuest, String customerName, String customerMobileNo, String tableNo}){
//==================================================
// DECLARE VARIABLE
//==================================================    
    String _orderNo = DateTime.now().millisecondsSinceEpoch.toString();
    RestCustomerModel _customerInfo = RestCustomerModel(customerName: customerName,mobileNo: customerMobileNo,noOfGuest: noOfGuest);
//==================================================
// UPDATE GLOBAL VARIABLE
//==================================================
  globalAppData.tableNo = tableNo;
  globalAppData.orderNo = _orderNo;

//==================================================
// PREPARE VARIABLE (MODEL = OBJECT) TABLE
//==================================================
  RestTableModel _tableModel = RestTableModel(
    customerInfo: _customerInfo,
    tableNo: tableNo,
    orderNo: _orderNo,
    orderStatus: 'OPEN',
  );
//==================================================
// PREPARE VARIABLE (MODEL = OBJECT) ORDER
//==================================================
    RestOrderModel _orderModel = RestOrderModel(
        customerInfo: _customerInfo,
        listOrderItemModel: [],
        tableNo: tableNo,
        orderNo: _orderNo,
    );
//==================================================
// SAVE DATA TO REST_TM_TABLES DATABASE 
//==================================================
  Firestore.instance.collection(TABLE_COLLECTION_NAME).document(tableNo).setData(_tableModel.toFireStore()).then((value) {
    print('Save TABLE_COLLECTION_NAME Completed with ${_tableModel.toFireStore()}' );
  }).catchError((error){
    print('Error to save table $error');
  });

//==================================================
// SAVE DATA TO REST_TT_ORDERS DATABASE 
//================================================== 
  Firestore.instance.collection(ORDER_COLLECTION_NAME).document(_orderNo).setData(_orderModel.toFireStore()).then((value) {
    print('Save ORDER_COLLECTION_NAME Completed with ${_orderModel.toFireStore()}' );
  }).catchError((error){
    print('Error to save ORDER_COLLECTION_NAME $error');
  });   
  }

//===================================================
// FUNCTION#2: CLOSE TABLE
//===================================================
  closeTable(){}

}