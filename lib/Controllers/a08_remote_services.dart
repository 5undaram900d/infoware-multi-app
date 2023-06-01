
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:infoware_multi_app/Modules/a07_product_module.dart';

class RemoteServices {
  Future<List<ProductModule>?> getProducts() async {
    var client = http.Client();
    var uri = Uri.parse('https://fakestoreapi.com/products');
    var response = await client.get(uri);
    debugPrint(response.body);

    if(response.statusCode == 200){
      var json = response.body;
      return productModuleFromJson(json);
    }
    return null;
  }
}