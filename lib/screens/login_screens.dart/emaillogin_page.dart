import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_screens.dart/createaccount_page.dart';
import 'package:shop_app/services/firebase_auth_methods.dart';
import 'package:shop_app/widgets/login_controller.dart';


class EmailloginPage extends StatefulWidget {
  const EmailloginPage({super.key});

  @override
  State<EmailloginPage> createState() => _EmailloginPageState();
}

class _EmailloginPageState extends State<EmailloginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? _emailValidator(String? v) {
    if (v == null || v.trim().isEmpty) return 'Email is required';
    final ok = RegExp(r'^[\w\.-]+@[\w\.-]+\.\w+$').hasMatch(v.trim());
    if (!ok) return 'Enter a valid email';
    return null;
  }

  String? _passwordValidator(String? v) {
    if (v == null || v.isEmpty) return 'Password is required';
    if (v.length < 8) return 'Min 8 characters';
    return null;
  }

    void loginUser() async{
    if (_formKey.currentState!.validate()) {
      debugPrint('Email: ${emailController.text}');
      FirebaseAuthMethods(FirebaseAuth.instance).logInWithEmail(
      email: emailController.text, 
      password: passwordController.text, 
      context: context); 
    }
  }


@override
void dispose(){
  super.dispose();
  emailController.dispose();
  passwordController.dispose();
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical:20),
            child: Column(
              children: [
                    Image.asset("assets/logo.png",
                    width: 54,
                    height:54,
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                    ),
                    Text("Sign in your account",
                    style: Theme.of(context).textTheme.titleLarge
                    ),
                    const SizedBox(
                      height: 36,
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Email",
                      style: Theme.of(context).textTheme.bodyMedium
                      ),
                    ),
                    Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                          const SizedBox(
                              height: 15,
                            ),
                            LoginController(
                                  controller: emailController,
                                  hintText: 'mzni@gmail.com',
                                  obscureText: false,
                                  validator: _emailValidator,
                            ),
                             const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Password",
                              style: Theme.of(context).textTheme.bodyMedium
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            LoginController(
                                  controller: passwordController,
                                  hintText: '*******',
                                  obscureText: true,
                                  validator: _passwordValidator,
                            ),
                          ],
                        ),
                  ),
                      const SizedBox(
                      height: 36,
                    ),
                    ElevatedButton(
                      onPressed:loginUser,
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Color(0xFF2E7DFF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      
                      ),
                       
                    child: Text("SIGN IN",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white
                      ),
                    
                    ),
                  ),
                    //CREATE A NEW ACCOUNT
                   
                   Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don’t have an account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                          ),
                        TextButton(
                          onPressed: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                                return CreateaccountPage();
                          }),
                        );
                          }, 
                          child: Text("CREATE ACCOUNT",
                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.blue
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
               ],
            ),
          ),
        ),
      ),
    );
  }
}