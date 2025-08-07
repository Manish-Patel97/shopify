import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.2,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF2E7DFF), // vibrant blue
                  Color(0xFF00E5FF), // cyan/light aqua
                ],
              ),
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0.5,
                  blurRadius: 4,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Manish Kumar',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white)),
                    const SizedBox(height: 4),
                    Text('manish@gmail.com',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.white70)),
                  ],
                )
              ],
            ),
          ),
      
          // 🧾 Options Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _buildOptionTile(
                  context,
                  icon: Icons.shopping_bag,
                  label: 'My Orders',
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.favorite_border,
                  label: 'Wishlist',
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.account_circle_outlined,
                  label: 'Manage Profile',
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.settings,
                  label: 'Settings',
                ),
                _buildOptionTile(
                  context,
                  icon: Icons.logout,
                  label: 'Logout',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildOptionTile(BuildContext context,
      {required IconData icon, required String label}) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(icon, size: 28, color: Colors.blueAccent),
        title: Text(label, style: Theme.of(context).textTheme.bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {},
      ),
    );
  }
}
