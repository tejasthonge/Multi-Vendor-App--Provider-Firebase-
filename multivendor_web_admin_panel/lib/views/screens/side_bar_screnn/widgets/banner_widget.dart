

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
final Stream<QuerySnapshot> _bannerStream = FirebaseFirestore.instance.collection('Banners').snapshots();

  @override
  Widget build(BuildContext context) {
    
    return StreamBuilder<QuerySnapshot>(  //for this go to https://firebase.flutter.dev/docs/firestore/usage
      stream: _bannerStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return  Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center( 
            child: CircularProgressIndicator( 
              color: Colors.cyan,
            ),
          );
        }

        return GridView.builder(
          shrinkWrap: true,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 6,mainAxisSpacing: 8,crossAxisSpacing: 8), 
          itemCount: snapshot.data!.size,
        itemBuilder: (context,index){
          final bannerData = snapshot.data!.docs[index];

          return Column( 
            children: [ 
              Container(
                width: 150,
                height: 70,
                decoration: BoxDecoration( 
                  border: Border.all(color: Colors.grey.shade300)
                ),
                child: Image.network(
                  bannerData['image'],
                  fit: BoxFit.cover,
                ),
              ),
              // Flexible(
              //   child: Text(
              //     categoryData['categoryName'],
              //     style: TextStyle( 
              //       // fontSize: 18,
              //       fontWeight: FontWeight.w800
              //     ),
              //   ),
              // )
            ],
          );
        });
      },
    );
  }
}