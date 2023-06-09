import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tikum_mobile/data/repository/popular_product_repo.dart';
import 'package:tikum_mobile/models/products_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<dynamic> _popularProductList = [];
  List<dynamic> get popularProductList => _popularProductList;

  Future<void> getPopularProductList()async {
    Response response = await popularProductRepo.getPopularProductList();
    if(response.statusCode == 200){
      print("got products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      update();
    }else{
      print("No products");
    }
  }
}