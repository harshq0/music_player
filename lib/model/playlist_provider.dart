import 'package:flutter/material.dart';
import 'package:music_player/model/song.dart';

class PlayListProvider extends ChangeNotifier {
  //playList song
  final List<Song> _playList = const [
    //song 1
    Song(
      songName: 'Pirai themdum ',
      artistName: 'GV Prakesh',
      albumImagePath: 'assets/images/gv.jpg',
      audioPath: 'assets/music/pirai.Themdum.mp3',
    ),

    //song 2
    Song(
      songName: 'OruMaalai ',
      artistName: 'Karthik',
      albumImagePath: 'assets/images/karthik.jpg',
      audioPath: 'assets/music/pirai.Themdum.mp3',
    ),

    //song 3
    Song(
      songName: 'Vaathi coming',
      artistName: 'Anirudh',
      albumImagePath: 'assets/images/ani.jpg',
      audioPath: 'assets/music/pirai.Themdum.mp3',
    ),
  ];

  //current index of song
  int? _currentSongIndex;

  //getter
  List<Song> get playList => _playList;
  int? get currentSongIndex => _currentSongIndex;

  //setter

  set currentSongIndex(int? newIndex) {
    _currentSongIndex = newIndex;
    notifyListeners();
  }
}
