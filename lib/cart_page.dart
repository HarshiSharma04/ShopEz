import 'package:flutter/material.dart';

// Sample data for cart items
class CartItem {
  final String name;
  final double price;
  final String assetImagePath;

  CartItem(this.name, this.price, this.assetImagePath);
}

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<CartItem> cartItems = [
    CartItem('Onion 1 kg', 10.0, 'lib/images/onion.jpg'),
    CartItem('Tomato 3 kg', 15.0, 'lib/images/tomato.jpeg'),
    CartItem('Parle-G Glucose Biscuit', 20.0, 'lib/images/biscuit.webp'),
    CartItem('Amul Fresh Malai Paneer', 20.0, 'lib/images/paneer.jpeg'),
    CartItem('English Oven Brown Bread', 20.0, 'lib/images/bread.jpg'),
    CartItem('Whisper Ultra Nights Sanitary Pads XXL', 20.0, 'lib/images/pad.jpeg'),
  ];

  List<CartItem> recommendations = [
    CartItem('Lays Masala Munch', 10.0, 'lib/images/lays.jpeg'),
    CartItem('Recommended Item 2', 15.0, 'lib/images/recommended2.jpg'),
    CartItem('Recommended Item 3', 20.0, 'lib/images/recommended3.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    double totalPrice = cartItems.fold(
      0,
          (previousValue, element) => previousValue + element.price,
    );

    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 8),
                Text(
                  'MY CART',
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 14),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length + 2,
                itemBuilder: (context, index) {
                  if (index < cartItems.length) {
                    // Display cart item
                    return ListTile(
                      leading: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(cartItems[index].assetImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(cartItems[index].name),
                      subtitle: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              // Remove item from cart
                            },
                          ),
                          Text('1'), // Quantity
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              // Add item to cart
                            },
                          ),
                          Text('\$${cartItems[index].price.toString()}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          setState(() {
                            cartItems.removeAt(index);
                          });
                        },
                      ),
                    );
                  } else if (index == cartItems.length) {
                    // Display recommendations heading
                    return Container(
                      color: Color(0xFFBD1F1F),
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: Text(
                        'Recommendations',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    );
                  } else {
                    // Display recommendation
                    int recommendationIndex = index - cartItems.length - 1;
                    return ListTile(
                      leading: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                            image: AssetImage(recommendations[recommendationIndex].assetImagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      title: Text(recommendations[recommendationIndex].name),
                      subtitle: Row(
                        children: [
                          Text('\$${recommendations[recommendationIndex].price.toString()}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.add_shopping_cart),
                        onPressed: () {
                          // Add recommendation to cart
                        },
                      ),
                    );
                  }
                },
              ),
            ),
            Text(
              'Total: \$${totalPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xFFBD1F1F),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to checkout page
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFBD1F1F),
              ),
              child: Text(
                'Proceed to Checkout',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
