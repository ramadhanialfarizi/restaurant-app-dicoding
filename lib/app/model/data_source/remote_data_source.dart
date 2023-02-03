import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:restaurant_app/app/model/restaurant_model.dart';

class RemoteDataSource {
  Future<List<RestaurantModel>> getAllRestaurant() async {
    try {
      final response =
          await rootBundle.loadString('assets/json_file/restaurant.json');
      final List<dynamic> data = await json.decode(response)['restaurants'];

      /// debuging
      if (data != null) {
        print(data.toString());
        //debugPrint(data);
      } else {
        print('kosong');
      }

      List<RestaurantModel> restaurantData = [];
      for (int counter = 0; counter < data.length; counter++) {
        restaurantData.add(RestaurantModel.fromJson(data[counter]));
      }
      return restaurantData;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
