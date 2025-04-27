import 'package:flutter/material.dart';

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          // Welcome Section
          const Text(
            "Welcome to your next adventure!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const Text(
            "Explore smarter. Travel better.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 20),

          // Search Bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 6,
                  offset: const Offset(0, 2),
                )
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: "Search destinations, experiences...",
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.deepOrange),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Banner with Plane
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              height: 130,
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Background (smaller, behind)
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(100),
                      right: Radius.circular(100),
                    ),
                    child: Image.asset(
                      'images/cloude2.jpg',
                      width: 250,
                      height: 130,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // Foreground (larger, in front)
                  ClipRRect(
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(100),
                      right: Radius.circular(100),
                    ),
                    child: Image.asset(
                      'images/plane4.png',
                      width: 550,
                      height: 350,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Categories
          const Text(
            "Categories",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: SizedBox(
              height: 130,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildRoundedImageCard("images/Booking.jpg", "Booking"),
                  buildRoundedImageCard("images/exploring.jpg", "Exploring"),
                  buildRoundedImageCard("images/itinarary.jpg", "Itinerary"),
                  buildRoundedImageCard("images/Dining.jpg", "Dining"),
                ],
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Featured Deals
          const Text(
            "Featured Deals",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          buildActivity("images/activity5.jpg", "Santorini - 30% OFF"),
          buildActivity("images/activity2.jpg", "Tokyo Explorer Tour"),
          buildActivity("images/activity3.jpg", "Morocco Adventure"),
          const SizedBox(height: 30),

          // Activities Section
          const Text(
            "Top Activities",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 20),

          buildActivity("images/activity1.jpg", "Camel Safari - Dubai"),
          buildActivity("images/activity4.jpg", "Italian Cuisine Tour"),
        ],
      ),
    );
  }

  Widget buildRoundedImageCard(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              imagePath,
              width: 150,
              height: 150,
              fit: BoxFit.fill,
            ),
            Container(
              width: 150,
              padding: const EdgeInsets.symmetric(vertical: 8),
              color: Colors.black,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildActivity(String imagePath, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: 100,
              fit: BoxFit.cover,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 6),
              color: Colors.black,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 