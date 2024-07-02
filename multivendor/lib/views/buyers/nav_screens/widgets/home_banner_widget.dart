import 'package:cached_network_image/cached_network_image.dart';
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

  final _bannerImagesList = [];

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
            color: Color.fromARGB(255, 228, 227, 223), borderRadius: BorderRadius.circular(10)),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: PageView.builder(
              itemCount: _bannerImagesList.length,
              itemBuilder: ((context, index) {
                // return Image.network(

                //   _bannerImagesList[index],
                //   fit: BoxFit.cover,
                // );

                //this followin same as above but only one resioned we use wheb ever we have the us downloaded image without calling every time to new requst we use the
                //cached_network_image package:
                ///--it store the image or data locally when ever we want to access it accessing for local storage and
                ///

                return CachedNetworkImage(
                  imageUrl: _bannerImagesList[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    alignment: Alignment.center,
                    height: 20,
                  width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    )),
                  
                  errorWidget: (context, url, error) => Icon(Icons.error),
                );
              })),
        ));
  }
}
