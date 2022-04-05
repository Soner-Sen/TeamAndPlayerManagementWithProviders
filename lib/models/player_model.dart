import 'team_model.dart';

class PlayerModel {
  late final String firstName;
  late final String lastName;
  late final String gamerTag;
  late final TeamModel? teamModel;

  PlayerModel(
      {required this.firstName,
      required this.lastName,
      required this.gamerTag,
      required this.teamModel});

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'gamerTag': gamerTag,
      'teamModel': teamModel?.toMap(),
    };
  }

  PlayerModel copyWith(
      {required String firstName,
      required String lastName,
      required TeamModel? teamModel}) {
    return PlayerModel(
      firstName: firstName,
      lastName: lastName,
      teamModel: teamModel,
      gamerTag: gamerTag,
    );
  }

  factory PlayerModel.fromMap(Map<String, dynamic> map) {
    return PlayerModel(
      firstName: map['firstName'],
      lastName: map['lastName'],
      gamerTag: map['gamerTag'],
      teamModel:
          map['teamModel'] != null ? TeamModel.fromMap(map['teamModel']) : null,
    );
  }
}
