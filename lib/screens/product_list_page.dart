import 'package:flutter/material.dart';
import 'package:shop_app/models/products_models.dart';

import 'package:shop_app/screens/product_Details_page.dart';
import 'package:shop_app/widgets/product_card.dart';

class ProductListPage extends StatefulWidget {
  final String initialCategory; 

  const ProductListPage({
    required this.initialCategory,
    super.key });

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {

  String isSelected = "For You";

  final List categories = const[
    "For You",
    "Cloth",
    "Mobiles",
    "Appliances",
    "Accessories",
    "Footwear",
  ];
final List<String> filterIcons = const [
  'assets/logo.png',
  'assets/icons/Fashion.png',
  'assets/icons/Mobiles.png',
  'assets/icons/Appliances.png',
  'assets/icons/Accessories.png',
  'assets/icons/Footwear.png',
];

@override
void initState() {
  super.initState();
  isSelected = widget.initialCategory.isEmpty ? "For You" : widget.initialCategory;
}


  @override
  Widget build(BuildContext context) {
    // Filtered product list based on selected category
       final List<Map<String, dynamic>> filteredProducts = isSelected == "For You"
              ? finalProducts
              : finalProducts
                  .where((product) => product['category'] == isSelected)
                  .toList();    


    // Designing Border for the search bar
      final border =OutlineInputBorder(
                   borderSide: BorderSide(
                    color: Colors.black,
                    ),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(50),
                   ),
                  );
      return Scaffold(
        body: Column(
          children: [
            // Header with Logo and Search Bar
            Container(
          height: MediaQuery.of(context).size.height * 0.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
        Color(0xFF2E7DFF), // vibrant blue
        Color(0xFF00E5FF), // cyan/light aqua
              ],
            ),
            boxShadow: [
              BoxShadow(
        color: Colors.black,
        spreadRadius:1,
        blurRadius: 8,
        offset: Offset(0, 4),
              ),
            ],
          ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Image(
                  image: AssetImage('assets/logo.png'),
                  height: MediaQuery.of(context).size.height * 0.1,
                ),
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search,
                     color: Colors.black,
                    ),
                    hintText: "Search",
                    enabledBorder: border,
                    focusedBorder: border,
                    fillColor: Colors.white,
                    filled: true,
                    ),
                ),
                ),
                ],
              ),
            ),
           
           
            // Horizontal Filter Chips
        
            Container(
              color: Colors.white,
              height: 85,
              child: ListView.builder(
                 scrollDirection: Axis.horizontal,
                 itemCount: categories .length,
                 itemBuilder: (context, index) {
                   final filter = categories [index] ;
                   return GestureDetector(
                     onTap: () {
                       setState(() {
                         isSelected = filter;
                       });
                     },
                     child: Padding(
                       padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                       child: Container(
                          decoration: BoxDecoration(
                            
                          border: isSelected == filter
                              ? Border(
                                  bottom: BorderSide(
                                    color: Theme.of(context).colorScheme.secondary,
                                    width: 4,
                                  ),
                                )
                              : null,
                        ),
                         child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image.asset(
                              filterIcons[index],
                              height: 36,
                              width: 36,
                            ),
                          SizedBox(height: 8),
                          Text(
                            filter,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 14,
                              fontWeight:isSelected == filter?FontWeight.bold: FontWeight.w500,
                              color: Colors.black,
                            ),
                            ),
                          ],
                         ),
                       ),
                     )
                   );
                 },
               ),
        
            ),
        
            // Category wise Product List
        
            Expanded(
              child: GridView.builder(
                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 1.0,
                  crossAxisSpacing: 0.0,
                  childAspectRatio: 0.8,
                  ),
                itemCount: filteredProducts.length,
                itemBuilder: (context, index){
                  final product = filteredProducts[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return ProductDetailsPage(product: product); 
                      }
                      ),
                      );
                    },
                    child: ProductCard(
                        title: product['title'] as String, 
                        price: product['price'] as double, 
                        imageUrl: product['image_url'] as String, 
                        backgroundColor: index.isEven ? Colors.blue.shade100 : Color.fromRGBO(225, 225, 225, 0.5),
                        ),
                  );
              
                },
                ),
            )
          ],
        ),
      ) ;
    
  }
}