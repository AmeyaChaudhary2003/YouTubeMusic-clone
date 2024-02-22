// // liked_songs.dart
// import 'package:flutter/material.dart';
//
// class LikedSongs extends ChangeNotifier {
//   List<String> likedSongs = [];
//
//   void likeSong(String songTitle) {
//     if (!likedSongs.contains(songTitle)) {
//       likedSongs.add(songTitle);
//       notifyListeners();
//     }
//   }
//
//   void unlikeSong(String songTitle) {
//     likedSongs.remove(songTitle);
//     notifyListeners();
//   }
// }
