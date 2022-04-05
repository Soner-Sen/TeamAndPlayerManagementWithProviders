import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:statemanagement/models/team_model.dart';

import '../models/player_model.dart';

class PlayerProvider extends ChangeNotifier {
  final List<PlayerModel> _players = [];

  UnmodifiableListView<PlayerModel> get players =>
      UnmodifiableListView(_players);

  void addPlayer(PlayerModel playerModel) {
    _players.add(playerModel);
    notifyListeners();
  }

  void removePlayer(PlayerModel playerModel) {
    _players.remove(playerModel);
    notifyListeners();
  }

  int getPlayersCountOfTeam(TeamModel countTeamSize) {
    return _players.where((player) => player.teamModel == countTeamSize).length;
  }
}
