import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'library_screen.dart'; // Import the LibraryScreen

// Widget for the search screen
class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Widget for building the search bar
              _buildSearchBar(),

              // Title for the top trending songs section
              Text(
                'Top Trending Songs',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
              ),

              // Widgets for displaying suggested songs
              _buildSuggestedItem('alone', 'assets/song1.png'),
              _buildSuggestedItem('kesariya', 'assets/song2.png'),
              _buildSuggestedItem('we own it', 'assets/song3.png'),
            ],
          ),
        ),
      ),

      // Bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          // Home icon with navigation
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Image.asset('assets/home.png', height: 24, width: 24, color: Colors.grey),
            ),
            label: 'Home',
          ),

          // Search icon (active)
          BottomNavigationBarItem(
            icon: Image.asset('assets/search.png', height: 24, width: 24, color: Colors.red),
            label: 'Search',
          ),

          // Library icon with navigation
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryScreen()));
              },
              child: Image.asset('assets/playlist.png', height: 24, width: 24, color: Colors.grey),
            ),
            label: 'Library',
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Widget for building the search bar
  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: 'Search for songs...',
          hintStyle: TextStyle(color: Colors.grey),
          suffixIcon: Icon(Icons.search, color: Colors.white),
          border: InputBorder.none,
        ),
      ),
    );
  }

  // Widget for building suggested items
  Widget _buildSuggestedItem(String name, String imagePath) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          height: 80,
          width: 80,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
