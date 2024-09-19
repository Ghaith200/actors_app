import 'package:flutter/material.dart';
import 'package:gallery_app/presentation_layer/screens/settings.dart';
import 'package:gallery_app/presentation_layer/widgets/my_drawer_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // ignore: deprecated_member_use
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.photo_library_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          //home list tiles
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          //settings list tiles
          MyDrawerTile(
            text: "S E T T I N G S",
            icon: Icons.settings,
            onTap: () => {
              Navigator.pop(context),
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ))
            },
          ),
          MyDrawerTile(
            text: "F a v o r i t e s",
            icon: Icons.favorite,
            onTap: () => {
              
              // ToDo: add favorites Here !!
            },
          ),
          const Spacer(),
          // logout list tile
          MyDrawerTile(
            text: "L O G  O U T",
            icon: Icons.logout,
            onTap: () {},
          ),
          const SizedBox(
            height: 25,
          )
        ],
      ),
    );
  }
}
