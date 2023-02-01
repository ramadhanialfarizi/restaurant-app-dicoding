class RestaurantModel {
  String? name;
  String? description;
  String? pictureId;
  String? city;
  int? rating;

  RestaurantModel({
    this.name,
    this.description,
    this.pictureId,
    this.city,
    this.rating,
  });

  RestaurantModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    pictureId = json['pictureId'];
    city = json['city'];
    rating = json['rating'];
  }
}
