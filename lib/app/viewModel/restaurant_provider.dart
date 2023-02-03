import 'package:flutter/cupertino.dart';
import 'package:restaurant_app/app/model/data_source/remote_data_source.dart';
import 'package:restaurant_app/app/model/restaurant_model.dart';
import 'package:restaurant_app/core/global_widget/load.dart';

class RestaurantProvider extends ChangeNotifier {
  RestaurantState _state = RestaurantState.none;
  RestaurantState get state => _state;

  RemoteDataSource data = RemoteDataSource();
  List<RestaurantModel> restaurantList = [];

  void changeState(RestaurantState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void getAllRestaurantData() async {
    changeState(RestaurantState.loading);

    try {
      restaurantList = await data.getAllRestaurant();
      notifyListeners();

      changeState(RestaurantState.none);
    } on Exception catch (e) {
      changeState(RestaurantState.error);
    }
  }
}
