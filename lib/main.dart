import 'package:flutter/material.dart';
import 'package:tikum_mobile/controllers/popular_product_controller.dart';
import 'package:tikum_mobile/pages/HomePage.dart';
import 'package:tikum_mobile/pages/food/popular_food_detail.dart';
import 'package:tikum_mobile/pages/food/recommended_food_detail.dart';
import 'package:tikum_mobile/pages/home/main_food_page.dart';
import 'package:tikum_mobile/pages/CartPage.dart';
import 'package:tikum_mobile/pages/ItemPage.dart';
import 'package:get/get.dart';
import 'package:tikum_mobile/pages/profile/login.dart';
import 'package:tikum_mobile/pages/profile/register.dart';
import 'helper/dependencies.dart' as dep;

Future<void> main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      Get.find<PopularProductController>().getPopularProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      routes: {
        "/": (context) => PopularFoodDetail(),
        // "/": (context) => MainFoodPage(),
        // "/": (context) => HomePage(),
        "cartPage": (context) => CartPage(),
        "itemPage": (context) => ItemPage()
      },
    );
  }
} 

// hayolohh
//dilihat lihat makin pusing 😒