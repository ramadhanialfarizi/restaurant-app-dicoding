class RestaurantModel {
  String? name;
  String? description;
  String? pictureId;
  String? city;
  String? rating;
  String? foodMenu;
  String? drinkMenu;

  RestaurantModel({
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
    this.foodMenu,
    this.drinkMenu,
  });

  factory RestaurantModel.fromJson(Map<dynamic, dynamic> json) {
    return RestaurantModel(
      name: json['name'],
      description: json['description'],
      pictureId: json['pictureId'],
      city: json['city'],
      rating: json['rating'].toString(),
      foodMenu: json['menus']['foods'][0]["name"],
      drinkMenu: json['menus']['drinks'][0]["name"],
    );
  }
}
