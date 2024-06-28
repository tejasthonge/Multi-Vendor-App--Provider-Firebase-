import 'package:flutter/material.dart';

class UploadBannerSceen extends StatelessWidget {
  const UploadBannerSceen({super.key});
  static  const String routeName ='/UploadBannerSceen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: Text("UploadBanner "),
      ));
  }
}