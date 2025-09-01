import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shop_app/screens/home_page.dart';
import 'package:shop_app/screens/login_screens.dart/emaillogin_page.dart';
import 'package:shop_app/utils/snackbar_utils.dart';

class FirebaseAuthMethods {
 final FirebaseAuth _auth;
 FirebaseAuthMethods(this._auth);

 //EMAIL SIGN UP
 Future<void> signUpWithEmail({
  required String name,
  required String email,
  required String password,
  required BuildContext context,
 })async{
  try{ 
    await _auth.createUserWithEmailAndPassword(
      email: email, 
      password: password,
      );
    
    // update display name
    await _auth.currentUser!.updateDisplayName(name);

    // Show success message
    if (context.mounted) {
      showSnackBar(context, "Account created successfully!");
      Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => EmailloginPage()));
    }

    //await sendEmailVerification(context);
    
  }on FirebaseAuthException catch (e) {
    if (context.mounted) {
    showSnackBar(context, e.message ?? "Something went wrong");
      }
    }
  }
  //EMAIL VERIFICATION

  Future<void> sendEmailVerification(BuildContext context)async{
    try{
      await _auth.currentUser!.sendEmailVerification();
      if(context.mounted){
        showSnackBar(context, "Email verification sent!!");
      }
      
    }on FirebaseAuthException catch (e) {
      if (context.mounted) {
      showSnackBar(context, e.message ?? "Something went wrong");
      }
    }
  }

  //EMAIL LOGIN
 Future<void> logInWithEmail({
  required String email,
  required String password,
  required BuildContext context,
 })async{
  try{
    await _auth.signInWithEmailAndPassword(
      email: email,
      password: password
      );

    // Show success message
    if (context.mounted) {
      showSnackBar(context, "Logged in successfully!");
      Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => HomePage()));
    }
  }on FirebaseAuthException catch (e) {
    if (context.mounted) {
    showSnackBar(context, e.message ?? "Something went wrong");
      }
    }
 }

   //EMAIL LOGOUT
 Future<void> logOutEmail({
  required String email,
  required String password,
  required BuildContext context,
 })async{
  try{
    await _auth.signOut();

    // Show success message
    if (context.mounted) {
      showSnackBar(context, "Logged out successfully!");
      Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (_) => EmailloginPage()));
    }
  }on FirebaseAuthException catch (e) {
    if (context.mounted) {
    showSnackBar(context, e.message ?? "Something went wrong");
      }
    }
 }

}