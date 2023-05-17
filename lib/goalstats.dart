import 'package:flutter/material.dart';

Widget goalStats(int expandedTime, int homeGoal, int awayGoal, String long) {
  return Expanded(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$expandedTime'",
          style: const TextStyle(
            fontSize: 30.0,
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
            child: Center(
          child: Column(
            children: [
              Text(
                long,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "$homeGoal - $awayGoal",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 36.0,
                ),
              ),
            ],
          ),
        )),
      ],
    ),
  );
}
