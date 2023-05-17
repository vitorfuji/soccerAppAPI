// first add http package on pubspec.yaml
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:soccerapp/soccermodel.dart';

import 'gameStatsmodel.dart';

class SoccerApi {
  // set variables
  //first: add endpoint URL
  // get all data from api.sport.io

  final String apiUrl = "https://v3.football.api-sports.io/fixtures?live=all";
  final String apiUrlStats =
      "https://v3.football.api-sports.io/fixtures/statistics";
  // live matches
  // TODO: read api documentation https://www.api-football.com/documentation-v3#tag/Fixtures/operation/get-fixtures
  //add headers

  static const headers = {
    'x-rapidapi-host': "v3.football.api-sports.io",
    'x-rapidapi-key': "32c3bc749462cc6df73ce69b416f5740",
  };

  // create method
  // but first create our model soccermodel.dart

  // now finish with Model
  Future<List<SoccerMatch>?> getAllMatches() async {
    // List<SoccerMatch> allMatches = [];
    Response res = await get(Uri.parse(apiUrl), headers: headers);
    var body;

    if (res.statusCode == 200) {
      //we are connected to the database
      body = jsonDecode(res.body);
      List<dynamic> matchesList = body['response'];
      try {
        List<SoccerMatch> matches = matchesList
            .map((dynamic item) => SoccerMatch.fromJson(item))
            .toList();

        return matches;
      } catch (e) {
        print(e);
      }
    }
  }

  Future<List<GameStats>?> getGameStats(int id) async {
    String url = '$apiUrlStats?fixture=$id';
    Response res = await get(Uri.parse(url), headers: headers);
    var body;

    if (res.statusCode == 200) {
      //we are connected to the database
      body = jsonDecode(res.body);
      List<dynamic> gamesList = body['response'];
      try {
        List<GameStats> games =
            gamesList.map((dynamic item) => GameStats.fromJson(item)).toList();

        return games;
      } catch (e) {
        print(e);
      }
    }
  }
}
