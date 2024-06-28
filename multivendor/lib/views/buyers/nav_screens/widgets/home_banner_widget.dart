
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({
    super.key,
  });

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final _bannerImagesList=[];
 

  getBanners() {
    return _firestore
        .collection("Banners")
        .get()
        .then((QuerySnapshot querySnapshot) { 
          querySnapshot.docs.forEach((doc) {
            setState(() {
               _bannerImagesList.add(doc['image']);
            });
           });
        });
  }

  @override
  void initState() {
    getBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration( 
        color: Colors.amber,
        borderRadius: BorderRadius.circular(10)
    
    
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: PageView.builder(
          
          itemCount: _bannerImagesList.length,
          itemBuilder: ((context, index){
          return Image.network( 
              
            _bannerImagesList[index],
            fit: BoxFit.cover,
          );
        })),
      )
    );
    
  }
}
