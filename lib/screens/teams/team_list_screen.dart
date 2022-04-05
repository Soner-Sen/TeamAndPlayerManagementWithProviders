import 'package:flutter/material.dart';

import '../../providers/player_provider.dart';
import '../../providers/team_provider.dart';
import 'team_create_screen.dart';
import 'package:provider/provider.dart';

class TeamListScreen extends StatefulWidget {
  const TeamListScreen({Key? key}) : super(key: key);

  @override
  State<TeamListScreen> createState() => _TeamListScreenState();
}

class _TeamListScreenState extends State<TeamListScreen> {
  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);
    return Scaffold(
      // A Scaffold is a layout for the major Material Components.
      appBar: AppBar(
        title: const Text('Teams'),
      ),
      body: teamProvider.teams.isEmpty
          ? const Center(
              child: Text('No teams created yet.'),
            )
          : ListView.builder(
              itemCount: teamProvider.teams.length,
              itemBuilder: (context, index) {
                //zwischenspeichern
                final team = teamProvider.teams[index];
                return ListTile(
                  onLongPress: () {
                    Provider.of<TeamProvider>(context, listen: false)
                        .removeTeam(team);
                  },
                  title: Text(team.teamName),
                  subtitle: Text('team size: ' +
                      '${Provider.of<PlayerProvider>(context).getPlayersCountOfTeam(team)}'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'createTeam_btn',
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TeamsCreateScreen()))
              //Then wenn wir aus der Route zurück kommen, wird diese Funktion ausgeführt.
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
