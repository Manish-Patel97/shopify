import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/screens/login_screens.dart/emaillogin_page.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final user = FirebaseAuth.instance.currentUser;

   

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: size.height * 0.25,
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
                    Text(user!.displayName ?? "No name",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(color: Colors.white)),
                    const SizedBox(height: 4),
                    Text(user!.email ?? "No email",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: Colors.white70)),
                  ],
                )
              ],
            ),
          ),
      
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
                  onTap: (){
                    _showLogoutDialog(context);
                  }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }



  Widget _buildOptionTile(BuildContext context,
      {
        required IconData icon, 
        required String label,
        VoidCallback? onTap,
        }) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        leading: Icon(icon, size: 28, color: Colors.blueAccent),
        title: Text(label, style: Theme.of(context).textTheme.bodySmall),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }

    // Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Confirm Logout",
        style: Theme.of(context).textTheme.titleMedium
        ),
        content:Text("Are you sure you want to log out?",
        style: Theme.of(context).textTheme.bodySmall
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child:Text("Cancel",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.green)
            ),
          ),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              await FirebaseAuth.instance.signOut();
              if (context.mounted) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => EmailloginPage()),
                );
              }
            },
            child:Text("Logout",
            style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red)
            ),
          ),
        ],
      ),
    );
  }
}
