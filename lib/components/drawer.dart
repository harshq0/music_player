import 'package:flutter/material.dart';
import 'package:music_player/pages/setting_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //logo
          DrawerHeader(
            child: Icon(
              Icons.music_note,
              size: 40,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          //home
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ListTile(
              title: const Text('H O M E'),
              leading: const Icon(Icons.home),
              onTap: () => Navigator.of(context).pop(),
            ),
          ),

          // settings
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 20),
            child: ListTile(
              title: const Text('S E T T I N G'),
              leading: const Icon(Icons.settings),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contexr) => const SettingPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
