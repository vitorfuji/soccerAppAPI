import 'package:flutter/material.dart';
import 'package:soccerapp/api_manager.dart';
import 'package:soccerapp/pager_body.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SoccerApp(),
    );
  }
}

class SoccerApp extends StatefulWidget {
  const SoccerApp({super.key});

  @override
  State<SoccerApp> createState() => _SoccerAppState();
}

class _SoccerAppState extends State<SoccerApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: const Text(
          "SOCCERBOARD",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      //finished the api service, lets call it

      //Api Service
      body: FutureBuilder(
        future: SoccerApi().getAllMatches(), //call our getData() method),\
        builder: (context, snapshot) {
          print(snapshot.data);
          if (snapshot.hasData) {
            return pageBody(
              snapshot.data ?? [],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }, //app layout
      ),
    );
  }
}
