import 'package:flutter/material.dart';
import 'package:music_player/components/drawer.dart';
import 'package:music_player/model/playlist_provider.dart';
import 'package:music_player/model/song.dart';
import 'package:music_player/pages/song_page.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final dynamic playListProvider;

  @override
  void initState() {
    super.initState();
    playListProvider = Provider.of<PlayListProvider>(context, listen: false);
  }

  void goToSong(int songIndex) {
    playListProvider.currentSongIndex = songIndex;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SongPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text(
          'P L A Y L I S T',
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<PlayListProvider>(
        builder: (context, value, child) {
          List<Song> playList = value.playList;

          return ListView.builder(
            itemCount: playList.length,
            itemBuilder: (context, index) {
              final Song song = playList[index];
              return ListTile(
                title: Text(song.songName),
                subtitle: Text(song.artistName),
                leading: Image.asset(song.albumImagePath),
                onTap: () => goToSong(index),
              );
            },
          );
        },
      ),
    );
  }
}
