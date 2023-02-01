import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:restaurant_app/app/model/restaurant_model.dart';

class RemoteDataSource {
  //<List<RestaurantModel>>
  Future<void> getAllRestaurant() async {
    try {
      final response =
          await rootBundle.loadString('assets/json_file/restaurant.json');
      final data = await json.decode(response);
      print(response);
    } catch (e) {}
  }
}
