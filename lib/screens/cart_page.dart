import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/payment_page.dart';

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
                        title: Text('Remove Item',
                        style: Theme.of(context).textTheme.titleMedium
                        ),
                        content: Text('Are you sure you want to remove?',
                        style: Theme.of(context).textTheme.bodySmall
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Cancel',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.green)
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false).removeFromCart(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: Text('Remove',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red)
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
                        style: Theme.of(context).textTheme.bodyMedium
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
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                                return PaymentPage();
                      }),
                     );
                      
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.flash_on_outlined,
                          size: 25,
                        ),
                        SizedBox(width: 6),
                        Text('Buy this now',
                         style: Theme.of(context).textTheme.bodyMedium
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
