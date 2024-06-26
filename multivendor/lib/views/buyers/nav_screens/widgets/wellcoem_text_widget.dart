import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class WellcomeWidget extends StatelessWidget {
  const WellcomeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row( 
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ 
        Text( 
          "Howdy, What are You\nLooking For👀",
          style: TextStyle( 
            fontSize: 22,
            fontWeight: FontWeight.bold
          ),
        ),
        SvgPicture.asset(
          "assets/icons/cart.svg"
        )
      ],
    );
  }
}