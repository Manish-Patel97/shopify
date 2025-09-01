import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart_provider.dart';
class ProductDetailsPage extends StatefulWidget {

   final Map<String, dynamic> product;
const ProductDetailsPage({super.key, 
    required this.product
    });

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  int isSizeSelected = 0;



void pressedAddToCart(){
  Provider.of<CartProvider>(
  context, listen: false).addToCart(
    {
    "id": widget.product["id"],
    "title": widget.product["title"],
    "price": widget.product["price"],
    "image_url": widget.product["image_url"],
    "category": widget.product["category"],
    // "sizes": isSizeSelected,
    }
  );

  ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text('Item added to cart'),
    backgroundColor: Colors.blue.shade500,
    duration: Duration(seconds: 2),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
  ),
);
// if(isSizeSelected!=0){
// Provider.of<CartProvider>(
//   context, listen: false).addToCart(
//     {
//     "id": widget.product["id"],
//     "title": widget.product["title"],
//     "price": widget.product["price"],
//     "image_url": widget.product["image_url"],
//     "category": widget.product["category"],
//     // "sizes": isSizeSelected,
//     }
//   );

//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Item added to cart'),
//       duration: Duration(seconds: 2),
//     ),
//   );
// }else{
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       content: Text('Please select a size'),
//       duration: Duration(seconds: 2),
//     ),
//   );
// }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details'),
        centerTitle: true,
      ),
      body: Column(
         children: [
          Text( widget.product["category"] as String, 
            style: Theme.of(context).textTheme.titleLarge,
          ),
        Spacer(),
         Padding(
           padding: const EdgeInsets.all(20.0),
           child: Image.asset(widget.product['image_url'] as String),
         ),
         Spacer(flex: 2),
         Container(
          height: 250,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromRGBO(225, 225, 225, 0.5),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                // Displaying title

                Text(
                  '${widget.product["title"]}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                SizedBox(height: 2),
                // Displaying price
                Text(
                  '₹ ${widget.product["price"]}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                
                // SizedBox(height: 10),
                // // Displaying sizes title
                //  Text(
                //   'Size- UK/India',
                //   style: Theme.of(context).textTheme.bodySmall,
                // ),


                // Displaying sizes
                // SizedBox(
                //   height: 50,
                //   child: ListView.builder(
                //     scrollDirection: Axis.horizontal,
                //     itemCount: (widget.product["sizes"] as List<int>).length,
                //     itemBuilder: (context, index) {
                //     final size = (widget.product["sizes"] as List<int>)[index];

                //   // Displaying each size in a circular container

                //     return GestureDetector(
                //       onTap: () {
                //         setState(() {
                //           isSizeSelected = size;
                //          });
                //       },
                //       child: Container(
                //         margin: EdgeInsets.symmetric(horizontal: 5),
                //         width: 50,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color:isSizeSelected == size? Theme.of(context).colorScheme.secondary: Colors.white,
                //           border: Border.all(color: Colors.black12),
                //         ),
                //                          child: Center(
                //       child: Text(size.toString(),
                //       ),
                //       ),
                //       ),
                //     );
                //   }, 
                //   ),
                // ),
                SizedBox(height: 10),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  minimumSize: Size(double.infinity, 50),
                  
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: pressedAddToCart,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.shopping_cart_outlined, 
                          color: Colors.black54,
                          size: 26,
                          ),
                    SizedBox(width: 10),
                    Text(
                            'Add to Cart',
                            style: Theme.of(context).textTheme.bodySmall
                          ),
                  ],
                ),
                ),
               ],
            ),
          ),
         ),

        ],
      ) 
    );
  }
}