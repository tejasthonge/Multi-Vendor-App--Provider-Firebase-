import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key});

  final _categoryList = [
    "Food",
    "Vegetable",
    "Tea",
    "Coffee",
    "Others"
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container( 
                child: Text("Category",
                  style: TextStyle(fontSize:20),
                ),
              ),
        SizedBox(
          height: 40,
          child: Row(
            children: [

              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ActionChip(
                        label: Text(_categoryList[index]),
                        onPressed: () {
                          // Define what happens when the chip is pressed
                        },
                      ),
                    );
                  },
                ),
              ),
              Icon(Icons.arrow_forward_ios),
            ],
          ),
        ),
      ],
    );
  }
}
