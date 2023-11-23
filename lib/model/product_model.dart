class Productmodel {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  Rating? rating;
  Productmodel(
      {this.id,
      this.title,
      this.description,
      this.category,
      this.price,
      this.image,
      this.rating});
  Productmodel.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    title = json['title'];
    price = double.parse(json['price'].toString());
    description = json['description'];
    category = json['category'];
    image = json['image'];
    rating = json['rating'] != null ? Rating.fromJson(json['rating']) : null;
  }
  List<Productmodel> fromList(List json) {
    return json.map((e) => Productmodel.fromJson(e)).toList();
  }
}

class Rating {
  double? rate;
  int? count;
  Rating({this.count, this.rate});
  Rating.fromJson(Map<String, dynamic> json) {
    rate = double.parse(json['rate'].toString());
    count = int.parse(json['count'].toString());
  }
}
