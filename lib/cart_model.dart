class Cart {

  late final String itemDescription;
  late final String imageUrl;
  late final String rating;
  late final String reviews;
  late final String sold;
  late final String brand;
  late final String color;
  late final String price;

  Cart({
    required this.itemDescription,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.sold,
    required this.brand,
    required this.color,
    required this.price,
});

  Cart.fromMap(Map<dynamic , dynamic> res)
  : itemDescription = res['itemDescription'],
  imageUrl = res['imageUrl'],
        rating = res['rating'],
        reviews = res['reviews'],
        sold = res['sold'],
        brand = res['brand'],
        color = res['color'],
        price = res['price'];

  Map<String, Object?> toMap(){
    return {
      'itemDescription': itemDescription,
      'imageUrl': imageUrl,
      'rating': rating,
      'sold': sold,
      'brand':brand,
      'color':color,
      'price':price
    };
  }
}