// main.dart

// Import necessary packages and files
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_project/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_screen.dart';
import 'song_details_screen.dart';
import 'library_screen.dart';
import 'login_screen.dart';
import 'splash_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:just_audio/just_audio.dart'; // Import the just_audio package
import 'liked_songs.dart';

// Create a ChangeNotifier class to provide an instance of AudioPlayer
class AudioPlayerProvider extends ChangeNotifier {
  final AudioPlayer _audioPlayer = AudioPlayer(); // Create an instance of AudioPlayer

  AudioPlayer get audioPlayer => _audioPlayer;
}

// Main function to run the application
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    // Initialize Firebase with the specified options
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

    // Run the application with MultiProvider for state management
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AudioPlayerProvider>(
            create: (_) => AudioPlayerProvider(),
          ),
          ChangeNotifierProvider(create: (_) => LikedSongs()),
        ],
        child: MyApp(),
      ),
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

// Main application widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'youtube_music',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.red,
        ),
      ),
      // Determine whether to show SplashScreen or LoginScreen based on user authentication
      home: (FirebaseAuth.instance.currentUser != null) ? SplashScreen() : LoginScreen(),
    );
  }
}
