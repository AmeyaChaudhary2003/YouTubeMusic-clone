import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:audioplayers/audioplayers.dart';

class LikedSongs extends ChangeNotifier {
  List<String> likedSongs = [];

  void likeSong(String songTitle) {
    if (!likedSongs.contains(songTitle)) {
      likedSongs.add(songTitle);
      notifyListeners();
    }
  }

  void unlikeSong(String songTitle) {
    likedSongs.remove(songTitle);
    notifyListeners();
  }
}

class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioPlayer get audioPlayer => _audioPlayer;
}

class SongDetailsScreen extends StatelessWidget {
  final String songTitle;
  final String songImagePath;
  final String audioUrl;

  SongDetailsScreen({
    required this.songTitle,
    required this.songImagePath,
    required this.audioUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Song Details',
          style: TextStyle(color: Colors.red, fontSize: 24),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                songImagePath,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Text(
                songTitle,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final player = AudioPlayer();
                  await player.setSource(AssetSource(audioUrl));
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
                child: Text('Play/Pause'),
              ),
              SizedBox(height: 20),
              LikeButton(songTitle: songTitle),
            ],
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatelessWidget {
  final String songTitle;

  const LikeButton({required this.songTitle});

  @override
  Widget build(BuildContext context) {
    return Consumer<LikedSongs>(
      builder: (context, likedSongs, child) {
        bool isLiked = likedSongs.likedSongs.contains(songTitle);

        return ElevatedButton(
          onPressed: () {
            if (isLiked) {
              context.read<LikedSongs>().unlikeSong(songTitle);
            } else {
              context.read<LikedSongs>().likeSong(songTitle);
            }
          },
          style: ElevatedButton.styleFrom(
            primary: isLiked ? Colors.grey : Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: Colors.white,
              ),
              SizedBox(width: 8),
              Text(isLiked ? 'Unlike' : 'Like'),
            ],
          ),
        );
      },
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: SongDetailsScreen(
        songTitle: 'Song Title',
        songImagePath: 'assets/song_image.jpg',
        audioUrl: 'assets/alonemusic.mp3',
      ),
    ),
  );
}
