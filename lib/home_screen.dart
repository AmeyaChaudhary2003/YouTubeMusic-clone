import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'song_details_screen.dart';
import 'library_screen.dart'; // Import the LibraryScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YouTube Music',
          style: TextStyle(color: Colors.red, fontSize: 34),
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
              Center(
                child: Text(
                  'Welcome to YouTube Music!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.pink),
                ),
              ),
              SizedBox(height: 10),
              Image.asset(
                'assets/welcome_image.png',
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                'Suggested Songs:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSuggestedItem(context, 'Alone', 'assets/song1.png', 'gs://utubemusic-85e2c.appspot.com/Marshmello - Alone (Official Music Video) (256 kbps).mp3'),
                  _buildSuggestedItem(context, 'Kesariya', 'assets/song2.png', 'YOUR_AUDIO_URL_2'),
                  _buildSuggestedItem(context, 'We own it', 'assets/song3.png', 'YOUR_AUDIO_URL_3'),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Suggested Artists:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildSuggestedItem(context, 'Eminem', 'assets/eminem.png', 'YOUR_AUDIO_URL_4'),
                  _buildSuggestedItem(context, 'Arjit Singh', 'assets/arjit.png', 'YOUR_AUDIO_URL_5'),
                  _buildSuggestedItem(context, 'Selena Gomez', 'assets/selena.png', 'YOUR_AUDIO_URL_6'),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to LibraryScreen when the Library button is tapped
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LibraryScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Go to Library'),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                // Navigate to HomeScreen (Optional)
              },
              child: Image.asset('assets/home.png', height: 17, width: 17, color: Colors.red),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SearchScreen()));
              },
              child: Image.asset('assets/search.png', height: 17, width: 17, color: Colors.grey),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/playlist.png', height: 17, width: 17, color: Colors.grey),
            label: 'Library',
          ),
        ],
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildSuggestedItem(BuildContext context, String name, String imagePath, String audioUrl) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SongDetailsScreen(songTitle: name, songImagePath: imagePath, audioUrl: audioUrl),
          ),
        );
      },
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 5),
          Text(
            name,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
