import 'package:flutter/material.dart';
import 'package:part1_project/pages/mainPage.dart';
import 'package:part1_project/pages/loginPage.dart';
import 'package:part1_project/pages/profile_page.dart';
import 'package:part1_project/models/user_model.dart';
import 'dart:typed_data';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
