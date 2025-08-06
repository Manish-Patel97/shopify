import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/firebase_options.dart';
import 'package:shop_app/providers/cart_provider.dart';
import 'package:shop_app/screens/login_screens.dart/auth_wrapper.dart';
import 'package:shop_app/screens/login_screens.dart/emaillogin_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          fontFamily: "Rubik",
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.white,
            primary:  Colors.white,
            secondary: Colors.yellow,
          ),
          appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(
          fontSize: 16,
          ),
        ),
        
        textTheme: TextTheme(
         titleLarge: TextStyle(
           fontSize: 32,
            fontWeight: FontWeight.bold 
          ),
          titleMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
         titleSmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600 
         ),
          bodyLarge: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w500,
          ),
          bodyMedium: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
         ),
        ),
        title: 'Shoes Mart',
        home: AuthWrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}