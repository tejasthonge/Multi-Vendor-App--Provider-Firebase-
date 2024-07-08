



import 'package:flutter/material.dart';

class VendorProductController extends ChangeNotifier{

   



  Map<String ,dynamic> productData = {};

  getFormData( {
    String? productName,
    double? productPrice,
    int? productQuantity,
    String? productCategory,
    String? productDescription,
    String? productShceduleDate,
  }){


    if (productName!=null) {
      productData["productName"] =productName;
    }
    if (productPrice!=null) {
      productData["productPrice"] =productPrice;
    }
    if (productQuantity!=null) {
      productData["productQuantity"] =productQuantity;
    }
    if (productCategory!=null) {
      productData["productCategory"] =productCategory;
    }
    if (productDescription!=null) {
      productData["productDescription"] =productDescription;
    }
    if(productShceduleDate!=null){
      productData["productShceduleDate"] =productShceduleDate;
    }
    notifyListeners();
  }
}
