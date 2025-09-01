import 'package:flutter/material.dart';

class LoginController extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String hintText;
  final String? Function(String?)? validator;
  const LoginController({
    required this.hintText,
    required this.obscureText,
    required this.controller,
    required this.validator,
    super.key, });

  @override
  Widget build(BuildContext context) {
    return Container(
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFDD0),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(120),
                            spreadRadius: 1,
                            blurRadius: 6,
                            offset: Offset(0, 3)
                          )
                        ]
                      ),
                      child: TextFormField(
                        controller: controller,
                        obscureText: obscureText,
                        cursorColor: Colors.black,
                        validator: validator,
                        style: Theme.of(context).textTheme.bodySmall,
                        decoration: InputDecoration(
                          hintText: hintText,
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        ),
                        ),
                    );
  }
}