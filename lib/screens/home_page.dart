import 'package:flutter/material.dart';
import 'package:shop_app/screens/account_page.dart';
import 'package:shop_app/screens/cart_page.dart';
import 'package:shop_app/screens/categories_page.dart';
import 'package:shop_app/screens/product_list_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  List<Widget> pages = [
    ProductListPage(initialCategory: '',),
    CategoriesPage(),
    const AccountPage(),
    const CartPage()
    ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
 
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        
        //Designing the Bottom Navigation Bar

        iconSize: 34,
        selectedItemColor: Colors.blue,

        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
         BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
            BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
             
            BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),

        ],
      ),
    );
  }
}