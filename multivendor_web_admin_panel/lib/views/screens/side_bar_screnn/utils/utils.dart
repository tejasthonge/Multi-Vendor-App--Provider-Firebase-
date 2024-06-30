 import 'package:flutter/material.dart';

buildRowHeador({required String text,required int flex }){
    return Expanded(
                flex: flex,
                child: Container( 
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration( 
                  color: Colors.yellow.shade900,
                  border: Border.all(
                    color: Colors.grey.shade700,
                    // color:Colors.yellow
                  )
                ),
                child: Text(
                  text,
                  style: TextStyle(
                  color:Colors.white,
                  // fontSize: 22,
                  // fontWeight: FontWeight.bold
                  ),
                ),
              ));
  }