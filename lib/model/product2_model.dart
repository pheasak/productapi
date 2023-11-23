class ProductmodelSecond {
  int? id;
  String? title;
  double? price;
  String? decription;
  List? images;
  String? creationAt;
  String? updatedAt;
  Category? category;
  ProductmodelSecond(
      {this.id,
      this.title,
      this.images,
      this.decription,
      this.price,
      this.category,
      this.creationAt,
      this.updatedAt});
  ProductmodelSecond.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    title = json['title'];
    price = double.parse(json['price'].toString());
    decription = json['description'];
    images = json['images'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }
  List<ProductmodelSecond> getTolist(List json) {
    return json.map((e) => ProductmodelSecond.fromJson(e)).toList();
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;
  Category({this.creationAt, this.id, this.image, this.name, this.updatedAt});
  Category.fromJson(Map<String, dynamic> json) {
    id = int.parse(json['id'].toString());
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }
}
