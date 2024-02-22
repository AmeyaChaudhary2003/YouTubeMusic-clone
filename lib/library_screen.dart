//library_screen.dart
import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';
import 'song_details_screen.dart';
import 'package:provider/provider.dart';
import 'liked_songs.dart';

class LibraryScreen extends StatelessWidget {
  // Map to associate each song title with its image path
  final Map<String, String> songImageMap = {
    'Song 1': 'assets/song1.png',
    'Song 2': 'assets/song2.png',
    'Song 3': 'assets/song3.png',
    // Add more entries as needed
  };

  @override
  Widget build(BuildContext context) {
    List<String> likedSongs = Provider.of<LikedSongs>(context).likedSongs;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Library',
          style: TextStyle(color: Colors.red, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Liked Songs',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.red),
            ),
            // Display liked songs here
            Expanded(
              child: ListView.builder(
                itemCount: likedSongs.length,
                itemBuilder: (context, index) {
                  // Extract the song details from the likedSongs list
                  String songTitle = likedSongs[index];
                  String songImagePath = getSongImagePath(songTitle); // Get the image path based on the song title

                  return ListTile(
                    leading: Image.asset(
                      songImagePath,
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      songTitle,
                      style: TextStyle(color: Colors.white), // Set text color to white
                    ),
                    // Add more details if needed
                  );
                },
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
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
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Image.asset('assets/search.png', height: 24, width: 24, color: Colors.grey),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/playlist.png', height: 24, width: 24, color: Colors.grey),
            label: 'Library',
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  // Helper method to get the image path based on the song title
  String getSongImagePath(String songTitle) {
    // Use the map to get the image path based on the song title
    return songImageMap[songTitle] ?? 'assets/song1.png';
  }
}
