import 'package:ecommerce/cart_provider.dart';
import 'package:ecommerce/cart_screen.dart';
import 'package:ecommerce/home_page.dart';
import 'package:ecommerce/product_2_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainHomePage extends StatelessWidget {
  const  MainHomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: 70, // Adjusted height
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0), // Adjusted padding
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()), // Replace HomeScreen with your desired screen
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.home_filled, size: 20),
                        SizedBox(height: 2),
                        Text('Home', style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartScreen()), // Replace HomeScreen with your desired screen
                      );
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.shopping_cart, size: 20),
                        SizedBox(height: 2),
                        Text('Cart', style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.settings, size: 20),
                        SizedBox(height: 2),
                        Text('Settings', style: TextStyle(fontSize: 11)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body:ListView(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40.0,left: 18,right: 10),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        width: 280,
                        child: TextField(
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search,size: 40,color: Colors.grey,),
                              hintText: 'Search..',
                              hintStyle: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      InkWell(
                        onTap: ()
                            {
                              Navigator.push(context,
                                MaterialPageRoute(builder: (context) => CartScreen()), // Replace with your actual screen
                              );
                            },
                      child: Badge(
                        label: Consumer<CartProvider>(
                          builder:(context, value, child){
                            return Text(value.getCounter().toString(),style: TextStyle(color: Colors.white),
                            );
                          }
                        ),
                        child:  Image(
                            height: 40,
                            width: 40,
                            image: AssetImage('images/icon_card.png',)),
                      ),
    ),

                      const SizedBox(width: 10,),
                      const Badge(
                        label: Text('9+'),
                        child:  Image(
                            height: 30,
                            width: 30,
                            image: AssetImage('images/icon.jpg',)),
                      ),

                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                    height: 170,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image: AssetImage(
                            'images/discount_image.jpeg',
                          ),
                        fit: BoxFit.cover
                      ),
                    )
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0),
                  child: Row(
                    children: [
                      Container(
                        height: 120,
                        width: 380,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.only(right:8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:51,
                                      width: 51,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF6F6F6),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Container(
                                          child: const Icon(Icons.grid_view_outlined,size: 32,)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Text('Category',style: TextStyle(
                                        fontSize: 13
                                    ),)
                                  ],

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:51,
                                      width: 51,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF6F6F6),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: const Icon(Icons.height,size: 32,),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    const Text('Size',style: TextStyle(
                                        fontSize: 13),
                                    ),
                                  ],

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:51,
                                      width: 51,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF6F6F6),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Container(
                                          child: const Icon(Icons.border_color_outlined,size: 32,)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Text('Order',style: TextStyle(
                                        fontSize: 13
                                    ),),
                                  ],

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:51,
                                      width: 51,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF6F6F6),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Container(
                                          child: const Icon(Icons.data_exploration_outlined,size: 32,)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Text('New',style: TextStyle(
                                        fontSize: 13
                                    ),),
                                  ],

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height:51,
                                      width: 51,
                                      decoration: BoxDecoration(
                                          color: const Color(0xffF6F6F6),
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      child: Container(
                                          child: const Icon(Icons.upcoming_outlined,size: 32,)
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 14,
                                    ),
                                    const Text('Insider',style: TextStyle(
                                        fontSize: 13
                                    ),),
                                  ],

                                ),
                              )
                            ],
                          ),
                        ),

                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 18.0,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Best Sale Product',style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                      ),),
                      Text('See more',style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color(0xff2A977D),
                      ),)
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,
                      left: 18,right: 18),
                  child: Row(
                    children: [
                    const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail2Page(itemDescription: 'Essentials Men Short-Sleeve T-Shirt',
                          imageUrl: 'images/shirt1.jpg',
                          rating: '4.9', reviews: '2.3k+', sold: '2.9k+',brand:'ChApp',color:'Aprikot',price:'\$12')));

                    },
                      child: Container(
                        height: 250,
                        width: 170,
                        color:Colors.white,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              height: 118,
                              image: AssetImage(
                                  'images/shirt1.jpg'
                              ),),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('T-Shirt',style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Essential Men's Short-\nSleeve T-Shirt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,),
                                      Text('4.9 | 2336',style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text('\$12.00',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xff2A977D)
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Detail2Page(
                              itemDescription: 'Essentials Men Short-Sleeve T-Shirt',
                              imageUrl: 'images/shirt2.jpg',
                              rating: '4.5', reviews: '2.3k+',
                              sold: '2.9k+',
                              brand:'ChApp',
                              color:'Aprikot',
                          price:'\$18')));
                        },
                        child: Container(
                          height: 257,
                          width: 170,
                          color:Colors.white,
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image(
                                height: 124,
                                image: AssetImage(
                                    'images/shirt2.jpg'
                                ),),
                              SizedBox(
                                height: 5,
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('T-Shirt',style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold
                                    ),),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text("Essential Men's Short-\nSleeve T-Shirt",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13
                                      ),),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.orange,),
                                        Text('4.5 | 2326',style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12,
                                        ),),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text('\$18.00',style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17,
                                            color: Color(0xff2A977D)
                                        ),)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,
                      left: 18,right: 18),
                  child: Row(
                    children: [
                    const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail2Page(
                          itemDescription: 'Essentials Men Short-Sleeve T-Shirt',
                          imageUrl: 'images/shirt3.png',
                          rating: '4.9', reviews: '2.3k+',
                          sold: '2.9k+',
                          brand:'ChApp',
                          color:'Aprikot',
                      price: '\$20')));
                    },
                      child: Container(
                        height: 250,
                        width: 170,
                        color:Colors.white,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              height: 118,
                              image: AssetImage(
                                  'images/shirt3.png'
                              ),),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('T-Shirt',style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Essential Men's Short-\nSleeve T-Shirt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,),
                                      Text('4.9 | 2338',style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text('\$20.00',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xff2A977D)
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail2Page(
                          itemDescription: 'Essentials Men Short-Sleeve Shirt',
                          imageUrl: 'images/shirt4.jpeg',
                          rating: '4.9', reviews: '2.3k+',
                          sold: '2.9k+',
                          brand:'ChApp',
                          color:'Aprikot',
                      price:'\$12')));
                    },
                      child: Container(
                        height: 257,
                        width: 170,
                        color:Colors.white,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              height: 124,
                              image: AssetImage(
                                  'images/shirt4.jpeg'
                              ),),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Shirt',style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Essential Men's Short-\nSleeve Shirt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,),
                                      Text('4.9 | 2336',style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text('\$12.00',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xff2A977D)
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0,
                      left: 18,right: 18),
                  child: Row(
                    children: [
                    const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail2Page(
                          itemDescription: 'Essentials Men Short-Sleeve T-Shirt',
                          imageUrl: 'images/shirt5.jpg',
                          rating: '4.1', reviews: '2.3k+',
                          sold: '2.9k+',
                          brand:'ChApp',
                          color:'Aprikot',
                      price:'\$13')));
                    },

                    child: Container(
                        height: 250,
                        width: 170,
                        color:Colors.white,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              height: 118,
                              image: AssetImage(
                                  'images/shirt5.jpg'
                              ),),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('T-Shirt',style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Essential Men's Short-\nSleeve T-Shirt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,),
                                      Text('4.1 | 2325',style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text('\$13.00',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xff2A977D)
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Detail2Page(
                          itemDescription: 'Essentials Men Full-Sleeve T-Shirt',
                          imageUrl: 'images/shirt6.jpeg',
                          rating: '4.2', reviews: '2.3k+',
                          sold: '2.9k+',
                          brand:'ChApp',
                          color:'Aprikot', price: '\$14',)));
                    },
                      child: Container(
                        height: 257,
                        width: 170,
                        color:Colors.white,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image(
                              height: 124,
                              image: AssetImage(
                                  'images/shirt6.jpeg'
                              ),),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child:Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('T-Shirt',style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold
                                  ),),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Essential Men's Full-\nSleeve T-Shirt",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 13
                                    ),),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orange,),
                                      Text('4.2 | 2216',style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Text('\$14.00',style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Color(0xff2A977D)
                                      ),)
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ],
        )
    );
  }
}