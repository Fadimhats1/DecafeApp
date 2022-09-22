import 'dart:convert';
import 'package:decafe_app/model/dataModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Categories {
  String id;
  String name;
  String description;
  String icon;
  List<Menu> menus;

  Categories({
    required this.id,
    required this.name,
    required this.description,
    required this.icon,
    required this.menus,
  });

  static Future<List<Categories>> fetchCategories() async {
    Uri url = Uri.parse("http://decafe-admin.herokuapp.com/api/v1/category");
    var response = await http.get(url);
    var data = json.decode(response.body) as List;
    return data.map(
      (e) {
        var dataMenus = e['menus'] as List;
        List<Menu> tempMenus = dataMenus
            .map((d) => Menu(
                  id: d['id'],
                  name: d['name'],
                  description: d['description'],
                  image: d['image'],
                  price: d['price'],
                  UpdatedAt: DateTime.parse(d['updated_at']),
                  categoryId: d['category_id'],
                  createdAt: DateTime.parse(d['created_at']),
                  isAvailable: d['is_available'],
                ))
            .toList();
        return Categories(
          id: e['id'].toString(),
          name: e['name'],
          description: e['description'],
          icon: e['icon'],
          menus: tempMenus,
        );
      },
    ).toList();
  }
}

class postData {
  static Future<http.Response> post(Map<String, dynamic> dataOrder) async {
    Uri urlApi = Uri.parse("http://decafe-admin.herokuapp.com/api/v1/order");

    var result = await http.post(
      urlApi,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(dataOrder),
    );
    return result;
  }
}

// class Categoriess {
//   String id;
//   String name;
//   String description;
//   String icon;

//   Categoriess({
//     required this.id,
//     required this.name,
//     required this.description,
//     required this.icon,
//   });

//   static fetchCategories() async {
//     Uri url = Uri.parse("http://decafe-admin.herokuapp.com/api/v1/category");
//     var response = await http.get(url);
//     var data = json.decode(response.body) as List;
//     print(data[0][);
//   }
// }

// class Menu {
//   String id;
//   String name;
//   int categoryId;
//   String Price;
//   String description;
//   String discountedPrice;
//   bool isAvailable;
//   String image;
//   DateTime createdAt;
//   DateTime UpdatedAt;

//   Menu({
//     required this.id,
//     required this.name,
//     required this.Price,
//     required this.UpdatedAt,
//     required this.categoryId,
//     required this.createdAt,
//     required this.description,
//     required this.discountedPrice,
//     required this.image,
//     required this.isAvailable,
//   });
//   static Future<List<Menu>> fetchMenu(int index) async {
//     Uri url = Uri.parse("http://decafe-admin.herokuapp.com/api/v1/menu/" +
//         (index + 1).toString());
//     var response = await http.get(url);
//     var data = json.decode(response.body) as List;

//     return data
//         .map((e) => Menu(
//             id: e['id'].toString(),
//             name: e['name'],
//             description: e['description'],
//             image: e['image'],
//             Price: e['price'].toString(),
//             UpdatedAt: DateTime.parse(e['updated_at']),
//             categoryId: e['category_id'],
//             createdAt: DateTime.parse(e['created_at']),
//             discountedPrice: e['discounted_price'].toString(),
//             isAvailable: e['is_available']))
//         .toList();
//   }
// }

// class Menus {
//   String id;
//   String name;
//   String categoryId;
//   String Price;
//   String description;
//   String discountedPrice;
//   String isAvailable;
//   String image;
//   DateTime createdAt;
//   DateTime UpdatedAt;

//   Menus({
//     required this.id,
//     required this.name,
//     required this.Price,
//     required this.UpdatedAt,
//     required this.categoryId,
//     required this.createdAt,
//     required this.description,
//     required this.discountedPrice,
//     required this.image,
//     required this.isAvailable,
//   });
//   static fetchMenu() async {
//     Uri url = Uri.parse("http://decafe-admin.herokuapp.com/api/v1/menu");
//     var response = await http.get(url);
//     var data = json.decode(response.body) as List;
//     print(data);
//   }
// }
