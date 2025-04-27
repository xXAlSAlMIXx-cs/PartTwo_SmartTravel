import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.explore,
              size: 100,
              color: Colors.orange[700],
            ),
            const SizedBox(height: 20),
            Text(
              'Explore Page',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.orange[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
} 