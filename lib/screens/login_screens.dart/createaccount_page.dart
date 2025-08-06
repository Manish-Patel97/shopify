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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

void signUpUser() async {
  FirebaseAuthMethods(FirebaseAuth.instance).signUpWithEmail(
    email: emailController.text, 
    password: passwordController.text, 
    context: context);
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
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                    const SizedBox(
                      height: 36,
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
                      hintText: 'mzni.123@gmail.com',
                      obscureText: false,
                      controller :emailController
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
                      hintText: '************',
                      obscureText: true,
                      controller: passwordController,
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
                  //CREATE A NEW ACCOUNT

                   Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? ",
                          style: Theme.of(context).textTheme.bodySmall,
                          ),
                        TextButton(
                          onPressed: (){
                           Navigator.pop(context); 
                          }, 
                          child: Text("SIGN IN",
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
    );
  }
}