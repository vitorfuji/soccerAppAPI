import 'package:flutter/material.dart';
import 'package:soccerapp/api_manager.dart';
import 'soccermodel.dart';

Widget gamesStats(
    {required String homeNumberStats,
    required String nameStats,
    required String awayNumberStats}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0).copyWith(bottom: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          nameStats == "Posse de bola"
              ? homeNumberStats = "$homeNumberStats%"
              : homeNumberStats,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          nameStats,
          style: const TextStyle(color: Colors.white),
        ),
        Text(
          nameStats == "Posse de bola"
              ? awayNumberStats = "$awayNumberStats%"
              : awayNumberStats,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
  );
}

Widget gamesDialog(SoccerMatch match) {
  return AlertDialog(
    backgroundColor: Colors.black87,
    contentPadding: const EdgeInsets.symmetric(vertical: 15),
    title: Text(
      match.league.leagueName,
      style: const TextStyle(color: Colors.white),
    ),
    content: FutureBuilder(
      future: SoccerApi().getGameStats(match.fixture.id),
      builder: (context, snapshot) {
        if (!snapshot.hasData || (snapshot.data?.isEmpty ?? true))
          return Container();
        final homeTeam = snapshot.data!.first;
        final awayTeam = snapshot.data!.last;
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          match.home.logoUrl,
                          width: 36.0,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          match.home.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "${match.goal.home} - ${match.goal.away}",
                      textAlign: TextAlign.center,
                      style:
                          const TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Image.network(
                          match.away.logoUrl,
                          width: 36.0,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          match.away.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ...List.generate(
              homeTeam.statistics.length,
              (index) => gamesStats(
                  homeNumberStats: homeTeam.statistics[index].value,
                  nameStats: homeTeam.statistics[index].type,
                  awayNumberStats: awayTeam.statistics[index].value),
            ),
          ],
        );
      },
    ),
  );
}

Widget matchTile(SoccerMatch match, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 12.0),
    child: InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return gamesDialog(match);
          },
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              match.home.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
          Image.network(
            match.home.logoUrl,
            width: 36.0,
          ),
          Expanded(
            child: Text(
              "${match.goal.home} - ${match.goal.away}",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 16.0),
            ),
          ),
          Image.network(
            match.away.logoUrl,
            width: 36.0,
          ),
          Expanded(
            child: Text(
              match.away.name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
