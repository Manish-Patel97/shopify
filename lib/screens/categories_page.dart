import 'package:flutter/material.dart';

class CategoriesPage extends StatelessWidget {
  CategoriesPage({super.key});

  final List<Map<String, String>> categories = [
    {"label": "Fashion", "icon": "assets/icons/Fashion.png"},
    {"label": "Mobiles", "icon": "assets/icons/Mobiles.png"},
    {"label": "Appliances", "icon": "assets/icons/Appliances.png"},
    {"label": "Accessories", "icon": "assets/icons/Accessories.png"},
    {"label": "Footwear", "icon": "assets/icons/Footwear.png"},
    // Add more here...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categories"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 0.5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView.builder(
          itemCount: categories.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // 3 per row like Flipkart
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.8,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Image.asset(category['icon']!, fit: BoxFit.contain),
                ),
                SizedBox(height: 8),
                Text(
                  category['label']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
