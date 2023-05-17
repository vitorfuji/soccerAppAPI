import 'package:flutter/material.dart';

Widget teamStats(String team, String logoUrl, String teamName) {
  return Expanded(
      child: Column(
    children: [
      Text(
        team,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
      const SizedBox(height: 8.0),
      Expanded(
        child: Image.network(logoUrl, width: 54.0),
      ),
      Text(
        teamName,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    ],
  ));
}
