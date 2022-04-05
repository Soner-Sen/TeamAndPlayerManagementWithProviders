import 'package:flutter/material.dart';
import 'package:statemanagement/providers/player_provider.dart';
import 'package:statemanagement/screens/players/player_create_screen.dart';
import 'package:provider/provider.dart';

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({Key? key}) : super(key: key);

  @override
  State<PlayerListScreen> createState() => _PlayerListScreenState();
}

class _PlayerListScreenState extends State<PlayerListScreen> {
  @override
  Widget build(BuildContext context) {
    final playerProvider = Provider.of<PlayerProvider>(context);

    return Scaffold(
      // A Scaffold is a layout for the major Material Components.
      appBar: AppBar(
        title: const Text('Players'),
      ),
      body: playerProvider.players.isEmpty
          ? const Center(
              child: Text('No players created yet.'),
            )
          : ListView.builder(
              itemCount: playerProvider.players.length,
              itemBuilder: (context, index) {
                //zwischenspeichern
                final player = playerProvider.players[index];
                return ListTile(
                  onLongPress: () {
                    setState(() {
                      playerProvider.removePlayer(player);
                    });
                  },
                  title: Text(player.firstName +
                      ' ' +
                      player.lastName +
                      ' \n' +
                      player.gamerTag),
                  subtitle: Text('team: ' + player.teamModel!.teamName),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'createPlayer_btn',
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayersCreateScreen()))
              //Then wenn wir aus der Route zurück kommen, wird diese Funktion ausgeführt.
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
