class GameStats {
  List<Statistics> statistics;
  Team teams;
  GameStats(this.statistics, this.teams);

  factory GameStats.fromJson(Map<String, dynamic> json) {
    return GameStats(
      (json['statistics'])
          .map<Statistics>((dynamic item) => Statistics.fromJson(item))
          .toList(),
      Team.fromJson(json['team']),
    );
  }
}

class Statistics {
  String type;
  String value;

  Statistics(this.type, this.value);

  factory Statistics.fromJson(Map<String, dynamic> json) {
    return Statistics(
      json['type'] ?? "",
      (json['value'] ?? "0").toString(),
    );
  }
}

class Team {
  int id;
  String name;
  String logoUrl;
  Team(this.id, this.name, this.logoUrl);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'] ?? 0, json['name'] ?? "", json['logo'] ?? "");
  }
}
