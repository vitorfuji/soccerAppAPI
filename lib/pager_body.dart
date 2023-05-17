import 'package:flutter/material.dart';
import 'package:soccerapp/gameStatsmodel.dart';
import 'package:soccerapp/goalstats.dart';
import 'package:soccerapp/matchtile.dart';
import 'package:soccerapp/soccermodel.dart';
import 'package:soccerapp/teamstats.dart';

Widget pageBody(List<SoccerMatch> allmatches) {
  return Column(
    children: [
      Expanded(
        flex: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              teamStats("Local Team", allmatches[0].home.logoUrl,
                  allmatches[0].home.name),
              goalStats(
                allmatches[0].fixture.status.elapsedTime,
                allmatches[0].goal.home,
                allmatches[0].goal.away,
                allmatches[0].fixture.status.long,
              ),
              teamStats("Visitor Team", allmatches[0].away.logoUrl,
                  allmatches[0].away.name),
            ],
          ),
        ),
      ),
      Expanded(
        flex: 5,
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "MATCHES",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24.0,
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                  itemCount: allmatches.length,
                  itemBuilder: (context, index) {
                    return matchTile(allmatches[index], context);
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
