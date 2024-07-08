import 'package:flutter/material.dart';
import 'package:multivendor/vendors/views/auth/vendors_auth_screen.dart';
import 'package:multivendor/views/buyers/auth/registor_screen.dart';

class SellecUserTypeScreen extends StatelessWidget {
  const SellecUserTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BuyersRegistorScreen()));
              },
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Buyer",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, 
                  MaterialPageRoute(builder: (_)=>VendorAuthScreen())
                );
              },
              child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 30,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Vendor",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 4,
                        fontWeight: FontWeight.bold),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
