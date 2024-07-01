

import 'package:flutter/material.dart';

showMySnakBar({required BuildContext context ,required String message}){
  ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.yellow.shade600,
        
        content: Text(message,
        
        style: TextStyle(
          color: Color.fromARGB(255, 88, 70, 70),
          fontWeight: FontWeight.bold,
        ),),
      ),
    );
}