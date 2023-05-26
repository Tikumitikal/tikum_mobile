import 'package:flutter/material.dart';
import 'package:tikum_mobile/pages/HomePage.dart';
import 'package:tikum_mobile/pages/food/popular_food_detail.dart';
import 'package:tikum_mobile/pages/food/recommended_food_detail.dart';
import 'package:tikum_mobile/pages/home/main_food_page.dart';
import 'package:tikum_mobile/pages/CartPage.dart';
import 'package:tikum_mobile/pages/ItemPage.dart';
import 'package:get/get.dart';
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
        "/": (context) => RecommendedFoodDetail(),
        // "/": (context) => MainFoodPage(),
        // "/": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage()
      },
    );
  }
} 

// hayolohh