

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatefulWidget {
  const CategoryWidget({super.key});

  @override
  State<CategoryWidget> createState() => _CategoryWidgetState();
}

class _CategoryWidgetState extends State<CategoryWidget> {
final Stream<QuerySnapshot> _categoryStream = FirebaseFirestore.instance.collection('Category').snapshots();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(  //for this go to https://firebase.flutter.dev/docs/firestore/usage
      stream: _categoryStream,
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
          final categoryData = snapshot.data!.docs[index];

          return Column( 
            children: [ 
              SizedBox(
                height: 100,
                width: 100,
                child: Image.network(
                  categoryData['image'],
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                categoryData['categoryName']
              )
            ],
          );
        });
      },
    );
  }
}