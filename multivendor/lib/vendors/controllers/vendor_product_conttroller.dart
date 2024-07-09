



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
    List<String>? imagUrlList ,
    bool? chargeShipping,
    double? shippongCharge,
    String? brandName,
    List<String>? sizeList,
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
    if(imagUrlList!=null){
      productData["imagUrlList"] =imagUrlList;
    }
    if (chargeShipping !=null) {
      productData["chargeShipping"] =chargeShipping;
    }
    if (shippongCharge!=null) {
      productData["shippongCharge"] =shippongCharge;
    }
    if(brandName!=null) {
      productData["brandName"] =brandName;
    }
    if(sizeList!=null) {
      productData["sizeList"] =sizeList;
    }
    notifyListeners();
  }
}
