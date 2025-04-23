import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Colors.orange[900]??Colors.deepOrange
                  , Colors.orange[400]??Colors.orange
                ]
            )
        ),
      ),
    );
  }


}

























