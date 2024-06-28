import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/category_screen.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/dashboar_sceen.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/orders_screen.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/product_sceen.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/upload_banner_screen.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/vendors_screen.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/withdrowal_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

   Widget _sellectedScreen = DashboardScreen();



  getSellectedScreen(item){
    switch (item.route) {
      case CategoryScreen.routeName:
        setState(() {
         _sellectedScreen= CategoryScreen();
        });
        break;
        case VendorsScreen.routeName:
          setState(() {
            _sellectedScreen =VendorsScreen();
          });
        break;
        case OrdersScreen.routeName:
          setState(() {
            _sellectedScreen =OrdersScreen();
          });
        break;
        case ProductScreen.routeName:
          setState(() {
            _sellectedScreen =ProductScreen();
          });
        break;
        case UploadBannerSceen.routeName:
          setState(() {
            _sellectedScreen =UploadBannerSceen();
          });
        break;
        case WithdralSceen.routeName:
          setState(() {
            _sellectedScreen =WithdralSceen();
          });
        break;
      default:
        setState(() {
          _sellectedScreen =DashboardScreen();
        });
    }

  }
  @override
  Widget build(BuildContext context) {
    return  AdminScaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( 
        backgroundColor: Colors.yellow.shade900 ,
        title: const Text("Manegment"),
      ),
        sideBar:  SideBar(
          items: const [
            AdminMenuItem(title: "Dashboard", icon: Icons.dashboard,route: DashboardScreen.routeName),
            AdminMenuItem(title: "Vendors", icon: CupertinoIcons.person_3,route:  VendorsScreen.routeName),
            AdminMenuItem(title: "Withdrawal ", icon: CupertinoIcons.money_dollar,route:WithdralSceen.routeName),
            AdminMenuItem(title: "Ordors", icon: CupertinoIcons.cart,route: OrdersScreen.routeName),
            AdminMenuItem(title: "Category", icon: Icons.category,route: CategoryScreen.routeName),
            AdminMenuItem(title: "Products", icon: Icons.shop,route: ProductScreen.routeName),
            AdminMenuItem(title: "Upload Banners", icon: Icons.add,route: UploadBannerSceen.routeName),
            
            ],
          selectedRoute: '',
          onSelected: (item){
            getSellectedScreen(item);
          },
          header: Container( 
            height: 50,
            width: double.infinity,
            alignment: Alignment.center,
            color:const Color(0xff444444),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Amarraj Caffe",
                  style: TextStyle( 
                    color:Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                ),
                Text("admin pannel",
                  style: TextStyle( 
                    color:const Color.fromARGB(255, 218, 182, 151),

                  ),
                ),
              ],
            ),
          ),
          footer: Container( 
            height: 50,
            alignment: Alignment.center,
            color:const Color(0xff444444),
            width: double.infinity,
            child:  Text("www.tejasthonge.tech",
                  style: TextStyle( 
                    fontSize:10,
                    color:Colors.white,

                  ),
                ),
          ),
          
          ),
          
      
        body:_sellectedScreen );
  }
}
