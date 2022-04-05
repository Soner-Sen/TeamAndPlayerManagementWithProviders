import 'package:flutter/material.dart';
import 'package:statemanagement/models/player_model.dart';
import 'package:statemanagement/models/team_model.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/player_provider.dart';
import 'package:statemanagement/providers/team_provider.dart';

class PlayersCreateScreen extends StatefulWidget {
  const PlayersCreateScreen({Key? key}) : super(key: key);

  @override
  State<PlayersCreateScreen> createState() => _PlayersCreateScreenState();
}

class _PlayersCreateScreenState extends State<PlayersCreateScreen> {
  final TextEditingController _playerfirstNameController =
      TextEditingController(text: '');
  final TextEditingController _playerlastNameController =
      TextEditingController(text: '');
  final TextEditingController _playergamerNameController =
      TextEditingController(text: '');

  TeamModel? _selectedTeam;

  @override
  Widget build(BuildContext context) {
    final classProvider = Provider.of<TeamProvider>(context, listen: false);

    return Scaffold(
        // A Scaffold is a layout for the major Material Components.
        appBar: AppBar(
          title: const Text('Create Player'),
        ),
        body: classProvider.teams.isEmpty
            ? const Center(
                child: Text('Please create a team before creating a Player!'),
              )
            : Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TextField(
                      controller: _playerfirstNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        helperText: 'Enter the first name of your player.',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _playerlastNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        helperText: 'Enter the last name of your player.',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _playergamerNameController,
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'GamerTag',
                        helperText: 'Enter your GamerTag.',
                        prefixIcon: const Icon(Icons.person_outline),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    DropdownButton(
                      value: _selectedTeam,
                      hint: const Text('Select a team'),
                      items: classProvider.teams
                          .map<DropdownMenuItem<TeamModel>>((teamModel) {
                        return DropdownMenuItem<TeamModel>(
                          value: teamModel,
                          child: Text(teamModel.teamName),
                        );
                      }).toList(),
                      onChanged: (TeamModel? newvalue) {
                        setState(() {
                          _selectedTeam = newvalue;
                        });
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        final newPlayer = PlayerModel(
                            firstName: _playerfirstNameController.text,
                            lastName: _playerlastNameController.text,
                            gamerTag: _playergamerNameController.text,
                            teamModel: _selectedTeam);
                        Provider.of<PlayerProvider>(context, listen: false)
                            .addPlayer(newPlayer);
                        Navigator.pop(context);
                      },
                      child: const Text('create player'),
                    ),
                  ],
                ),
              ));
  }
}
