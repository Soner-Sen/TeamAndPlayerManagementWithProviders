import 'package:flutter/material.dart';
import 'package:statemanagement/models/team_model.dart';
import 'package:provider/provider.dart';
import 'package:statemanagement/providers/team_provider.dart';

class TeamsCreateScreen extends StatefulWidget {
  const TeamsCreateScreen({Key? key}) : super(key: key);

  @override
  State<TeamsCreateScreen> createState() => _TeamsCreateScreenState();
}

class _TeamsCreateScreenState extends State<TeamsCreateScreen> {
  final TextEditingController _teamNameController =
      TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamProvider>(context);

    return Scaffold(
        // A Scaffold is a layout for the major Material Components.
        appBar: AppBar(
          title: const Text('Create Team'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                textInputAction: TextInputAction.go,
                controller: _teamNameController,
                autofocus: true,
                decoration: InputDecoration(
                  labelText: 'Team Name',
                  helperText: 'Enter the name of your team.',
                  prefixIcon: const Icon(Icons.group_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  final newTeam = TeamModel(teamName: _teamNameController.text);
                  teamProvider.addTeam(newTeam);
                  Navigator.pop(context);
                },
                child: const Text('create team'),
              ),
            ],
          ),
        ));
  }
}
