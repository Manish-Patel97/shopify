import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/widgets/login_controller.dart';
import 'package:shop_app/services/firebase_auth_methods.dart';

class CreateaccountPage extends StatefulWidget {
  const CreateaccountPage({super.key});

  @override
  State<CreateaccountPage> createState() => _CreateaccountPageState();
}

class _CreateaccountPageState extends State<CreateaccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  String? _nameValidator(String? v) {
    if ( v == null || v.trim().isEmpty) return 'Name is required';
    return null;
  }


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

    void signUpUser() async{
    if (_formKey.currentState!.validate()) {
      FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
      name: nameController.text,
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
                    Text("Create your account",
                    style: Theme.of(context).textTheme.titleLarge
                    ),
                    
                    
                    Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        child: Column(
                          children: [
                // NAME CONTROLLER================================================================
                            const SizedBox(
                              height: 36,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Name",
                              style: Theme.of(context).textTheme.bodyMedium
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                             LoginController(
                                  controller: nameController,
                                  hintText: '',
                                  obscureText: false,
                                  validator: _nameValidator,
                            ),
                //EMAIL CONTROLLER================================================================
                          const SizedBox(
                              height: 15,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text("Email",
                              style: Theme.of(context).textTheme.bodyMedium
                              ),
                            ),
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
              //PASSWORD CONTROLLER================================================================
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
                    onPressed:signUpUser,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: Color(0xFF2E7DFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(12),
                      ),
                
                    ),
                 
                  child: Text("CREATE ACCOUNT",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      color: Colors.white
                    ),
                  
                  ),
                ),
               ],
            ),
          ),
        ),
      ),
    );
  }
}