import 'package:flutter/material.dart';
import 'package:music_player/components/neu_box.dart';
import 'package:music_player/model/playlist_provider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatelessWidget {
  const SongPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PlayListProvider>(
      builder: (context, value, child) {
        //playlist
        final playlist = value.playList;

        //playlist index
        final currentSong = playlist[value.currentSongIndex ?? 0];

        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Column(
              children: [
                //app bar

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // back button
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.arrow_back,
                      ),
                    ),

                    //title
                    const Text('P L A Y L I S T'),

                    //menu
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.menu),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                //ablum
                NeuBox(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.asset(currentSong.albumImagePath),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                currentSong.songName,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(currentSong.artistName),
                            ],
                          ),
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //song duration progress
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //start
                      Text('0:00'),

                      //shuffle
                      Icon(Icons.shuffle),

                      //repeat
                      Icon(Icons.repeat),

                      //end
                      Text('0:00'),
                    ],
                  ),
                ),
                Slider(
                  min: 0,
                  max: 100,
                  value: 50,
                  activeColor: Colors.green,
                  onChanged: (value) {},
                ),

                const SizedBox(
                  height: 20,
                ),

                // playback controller
                Row(
                  children: [
                    //skip preview
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.skip_previous),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    //pause
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.play_arrow),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 20,
                    ),
                    //skip forward
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: const NeuBox(
                          child: Icon(Icons.skip_next),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
