class SoccerMatch {
  Fixture fixture;
  Team home;
  Team away;
  Goal goal;
  League league;
  SoccerMatch(this.fixture, this.home, this.away, this.goal, this.league);

  factory SoccerMatch.fromJson(Map<String, dynamic> json) {
    return SoccerMatch(
      Fixture.fromJson(json['fixture']),
      Team.fromJson(json['teams']['home']),
      Team.fromJson(json['teams']['away']),
      Goal.fromJson(json['goals']),
      League.fromJson(json['league']),
    );
  }
}

//store the fixture
class Fixture {
  int id;
  String date;
  Status status;
  Fixture(this.id, this.date, this.status);

  factory Fixture.fromJson(Map<String, dynamic> json) {
    return Fixture(
        json['id'] ?? 0, json['date'] ?? "", Status.fromJson(json['status']));
  }
}

// store the Status
class Status {
  int elapsedTime;
  String long;
  Status(this.elapsedTime, this.long);

  factory Status.fromJson(Map<String, dynamic> json) {
    return Status(json['elapsed'] ?? 0, json['long'] ?? "");
  }
}

// store Team data
class Team {
  int id;
  String name;
  String logoUrl;
  bool winner;
  Team(this.id, this.name, this.logoUrl, this.winner);

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(json['id'] ?? 0, json['name'] ?? "", json['logo'] ?? "",
        json['winner'] ?? false);
  }
}

class League {
  String leagueName;
  League(this.leagueName);

  factory League.fromJson(Map<String, dynamic> json) {
    return League(json['name'] ?? "");
  }
}

//store Goal data
class Goal {
  int home;
  int away;

  Goal(this.home, this.away);

  //factory method to copy data from the json file
  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(json['home'] ?? 0, json['away'] ?? 0);
  }
}
