import 'dart:collection';

import 'package:flutter/cupertino.dart';

import '../models/team_model.dart';

class TeamProvider extends ChangeNotifier {
  //Privat setzen
  final List<TeamModel> _teams = [];

  UnmodifiableListView<TeamModel> get teams => UnmodifiableListView(_teams);

  void addTeam(TeamModel teamModel) {
    _teams.add(teamModel);
    notifyListeners();
  }

  void removeTeam(TeamModel teamModel) {
    _teams.remove(teamModel);
    notifyListeners();
  }
}
