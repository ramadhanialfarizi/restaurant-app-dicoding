import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/app/model/data_source/remote_data_source.dart';
import 'package:restaurant_app/app/model/restaurant_model.dart';

class RestaurantProvider extends ChangeNotifier {
  RemoteDataSource data = RemoteDataSource();
  List<RestaurantModel> restaurantList = [];

  void getAllRestaurantData() async {
    restaurantList = await data.getAllRestaurant();
    notifyListeners();
  }
}
