import 'package:flutter/material.dart';
import 'package:multivendor/views/buyers/nav_screens/widgets/categary_widget.dart';
import 'package:multivendor/views/buyers/nav_screens/widgets/home_banner_widget.dart';
import 'package:multivendor/views/buyers/nav_screens/widgets/search_input_widget.dart';
import 'package:multivendor/views/buyers/nav_screens/widgets/wellcoem_text_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:Padding( 
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 40),
        child: Column( 
          children: [ 
            WellcomeWidget(),
            const SizedBox(height: 10,),
            SearchInputWidget(),
            const SizedBox(height: 10,),
            BannerWidget(),
            const SizedBox(height: 10,),
            CategoryWidget(),
          ],
        ),
      )
    );
  }
}
