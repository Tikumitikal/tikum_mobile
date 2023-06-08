import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tikum_mobile/models/kategori.dart';
import 'package:tikum_mobile/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:tikum_mobile/models/reservasi.dart';
import 'package:tikum_mobile/models/user.dart';
import 'package:tikum_mobile/screen/login_screen.dart';
import 'package:tikum_mobile/services/api_connect.dart';

class ApiServices {
  //logout
  Future logout(BuildContext context) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var res = await http.post(Uri.parse(ApiConnect.logout),
          headers: {"Authorization": "Bearer $token"});
      if (res.statusCode == 200) {
        prefs.remove('token');
        prefs.remove('user');
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //get data user login
  Future<User?> me() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      var res = await http.get(Uri.parse(ApiConnect.me),
          headers: {"Authorization": "Bearer $token"});
      if (res.statusCode == 200) {
        final jsonData = json.decode(res.body)['user'];
        final user = User.fromJson(jsonData);
        prefs.setString('user', json.encode(jsonData));
        return user;
      } else {
        throw Exception("Failed to fetch user data");
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //get product
  Future<List<Product>> getProduct(String id) async {
    final response = await http
        .post(Uri.parse(ApiConnect.product), body: {"id_kategori": id});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get no meja
  Future<List<Meja>> getTable() async {
    final response = await http.get(Uri.parse(ApiConnect.table));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Meja.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get kategori
  Future<List<Kategori>> getKategori() async {
    final response = await http.get(Uri.parse(ApiConnect.kategori));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Kategori.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get top product
  Future<List<Product>> getProductTop() async {
    final response = await http.get(Uri.parse(ApiConnect.producttop));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  //get reservasi
  Future<List<Reservasi>> getreservasi(String status) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final response = await http.post(Uri.parse(ApiConnect.reservasistatus),
        body: {"status": status}, headers: {"Authorization": "Bearer $token"});
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['data'];
      return jsonResponse.map((e) => Reservasi.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }
}
