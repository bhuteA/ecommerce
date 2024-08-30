import 'package:ecommerce/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_model.dart';
import 'cart_provider.dart';

DBHelper dbHelper = DBHelper();

class Detail2Page extends StatelessWidget {
  final String itemDescription;
  final String imageUrl;
  final String rating;
  final String reviews;
  final String sold;
  final String brand;
  final String color;
  final String price;

  const Detail2Page({
    Key? key,
    required this.itemDescription,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.sold,
    required this.brand,
    required this.color,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      const Icon(
                        Icons.share,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 13,
                      ),
                      Badge(
                        label: Text('1'),
                        child: const Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 15,),
            ItemDetailWidget(
              itemDescription: itemDescription,
              imageUrl: imageUrl,
              rating: rating,
              reviews: reviews,
              sold: sold,
              brand: brand,
              color: color,
              price: price,
              cart: cart,
            ),
          ],
        ),
      ),
    );
  }
}

class ItemDetailWidget extends StatelessWidget {
  final String itemDescription;
  final String imageUrl;
  final String rating;
  final String reviews;
  final String sold;
  final String brand;
  final String color;
  final String price;
  final CartProvider cart;

  const ItemDetailWidget({
    Key? key,
    required this.itemDescription,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    required this.sold,
    required this.brand,
    required this.color,
    required this.price,
    required this.cart,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          height: 380,
          width: 380,
          image: AssetImage(imageUrl),
        ),
        Row(
          children: const [
            Icon(Icons.on_device_training_sharp, color: Colors.grey,),
            Text('App.id', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),),
          ],
        ),
        const SizedBox(height: 10,),
        Text(itemDescription, style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
          color: Colors.black,
        ),),
        const SizedBox(height: 14,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.star, color: Colors.orange,),
            Text('$rating Ratings', style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            const Text('-', style: TextStyle(fontSize: 30,),),
            Text('$reviews Reviews', style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
            const Text('-', style: TextStyle(fontSize: 30,),),
            Text('$sold Sold', style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),),
          ],
        ),
        const SizedBox(height: 10,),
        Row(
          children: const [
            Text('About Items', style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xff2A977D),
            ),),
            SizedBox(width: 20,),
            Text('Reviews', style: TextStyle(
              fontSize: 20,
              color: Colors.grey,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
        const Divider(color: Colors.black,),
        const SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Text('Brand:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                  const SizedBox(width: 7,),
                  Text('$brand ', style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),),
                ],
              ),
              Row(
                children: [
                  const Text('Color:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                  const SizedBox(width: 7,),
                  Text('$color ', style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),),
                ],
              ),
              Row(
                children: [
                  const Text('Price:', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),),
                  const SizedBox(width: 7,),
                  Text('$price ', style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.black,
                  ),),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                dbHelper.insert(
                  Cart(
                    itemDescription: itemDescription,
                    imageUrl: imageUrl,
                    rating: rating,
                    reviews: reviews,
                    sold: sold,
                    brand: brand,
                    color: color,
                    price: price,
                  ),
                ).then((value) {
                  print('Product is added to cart');
                  cart.addTotalPrice(double.parse(price));
                  cart.addCounter();
                }).onError((error, stackTrace) {
                  print(error.toString());
                });
              },
              child: Container(
                height: 50,
                width: 150,
                decoration: const BoxDecoration(
                  color: Color(0xff2A977D),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(7),
                    topLeft: Radius.circular(7),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10), // Add space between containers
            Container(
              height: 50,
              width: 120,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(7),
                  topRight: Radius.circular(7),
                ),
              ),
              child: const Center(
                child: Text(
                  'Wishlist',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
