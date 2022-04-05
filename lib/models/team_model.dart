class TeamModel {
  late final String teamName;

  TeamModel({required this.teamName});

  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
    };
  }

  TeamModel copyWith({required String teamName}) {
    return TeamModel(
      teamName: teamName,
    );
  }

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      teamName: map['teamName'],
    );
  }
}
