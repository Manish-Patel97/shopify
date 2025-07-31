import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});



  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        centerTitle: true,
      ),
      body:ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index){
          final cartItem = cart[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
            child: Card(
               elevation: 1,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset(cartItem['image_url'].toString(),
                      height: 100,
                      width: 100,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(cartItem['title'].toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Text('Price: ₹${cartItem['price']}',
                            style: Theme.of(context).textTheme.bodySmall,
                            ),
                            if (cartItem['sizes'] != null)
                            Text(cartItem['sizes'].toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                
                  InkWell(
                    splashColor: Colors.grey.withAlpha(160),
                    onTap:(){
                      showDialog(
                        context: context, 
                        builder: (context){
                          return AlertDialog(
                        title: Text('Remove Item'),
                        content: Text('Are you sure you want to remove this item from the cart?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel',
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false).removeFromCart(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: Text('Remove',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.bold,
                            )
                            ),
                          ),
                        ],
                      );
                        });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.delete_outline,
                          size: 25,
                         ),
                        SizedBox(width: 6),
                        Text('Remove', 
                        style: Theme.of(context).textTheme.bodySmall
                          ),
                      ],
                    ),
                  ),
                  // Vertical Divider
                   Container(
                    height: 30,
                    width: 1,
                    color: Colors.grey.shade300,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                  ),
              
                  // Buy this now
                  InkWell(
                    splashColor: Colors.grey.withAlpha(160),
                    onTap: () {
                    if(kDebugMode){
                      print("purchse now");
                    }
                      
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flash_on_outlined,
                          size: 25,
                        ),
                        SizedBox(width: 6),
                        Text('Buy this now',
                         style: Theme.of(context).textTheme.bodySmall
                         ),
                      ],
                    ),
                  ),
                ],
              )
              ],
              ),
            ),
          );
          },
          ),
    );
  }
}
