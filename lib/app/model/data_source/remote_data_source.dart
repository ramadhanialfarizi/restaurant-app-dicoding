import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:restaurant_app/app/model/restaurant_model.dart';

class RemoteDataSource {
  Future<List<RestaurantModel>> getAllRestaurant() async {
    try {
      final response =
          await rootBundle.loadString('assets/json_file/restaurant.json');
      // json parse to Map
      var data = json.decode(response);

      List<dynamic> restaurantList = data["restaurants"];
      //final result = RestaurantModel.fromJson(data);

      //return result.restaurants;
      return restaurantList.map((e) => RestaurantModel.fromJson(e)).toList();
    } catch (e) {
      return [];
    }
  }
}
