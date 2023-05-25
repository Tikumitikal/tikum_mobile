import 'package:flutter/material.dart';
import 'package:tikum_mobile/pages/food/popular_food_detail.dart';
import 'package:tikum_mobile/pages/home/main_food_page.dart';
import 'package:tikum_mobile/pages/CartPage.dart';
import 'package:tikum_mobile/pages/ItemPage.dart';
import 'package:get/get.dart';
import 'package:tikum_mobile/pages/profile/login.dart';
import 'package:tikum_mobile/pages/profile/register.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        //"/": (context) => PopularFoodDetail(),
        "/": (context) => Register(),
        // "/": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage()
      },
    );
  }
} 

// hayolohh