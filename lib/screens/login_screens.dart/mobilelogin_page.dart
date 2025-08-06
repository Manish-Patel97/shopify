import 'package:flutter/material.dart';
import 'package:shop_app/widgets/login_controller.dart'; // reuse same input widget

class MobileloginPage extends StatefulWidget {
  const MobileloginPage({super.key});

  @override
  State<MobileloginPage> createState() => _MobileloginPageState();
}

class _MobileloginPageState extends State<MobileloginPage> {

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
              Image.asset(
                "assets/logo.png",
                width: 54,
                height: 54,
              ),
              SizedBox(height: MediaQuery.sizeOf(context).height * 0.1),
              Text(
                "Login with Phone",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 36),

              // Phone number input
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Phone Number",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const SizedBox(height: 15),
              LoginController(
                hintText: 'Enter phone number',
                obscureText: false,
                controller: TextEditingController(),
              ),

              
                const SizedBox(height: 30),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "OTP Code",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(height: 15),
                LoginController(
                  hintText: 'Enter OTP',
                  obscureText: false,
                  controller: TextEditingController(),
                ),
              

              const SizedBox(height: 36),

              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: const Color(0xFF2E7DFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  "SEND OTP",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ),

              const SizedBox(height: 12),

              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to email login
                  },
                  child: Text(
                    "Use Email Instead",
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
