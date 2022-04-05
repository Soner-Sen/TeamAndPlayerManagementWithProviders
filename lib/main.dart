import 'package:flutter/material.dart';
import 'package:statemanagement/providers/player_provider.dart';
import 'package:statemanagement/providers/team_provider.dart';
import 'my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => TeamProvider()),
      ChangeNotifierProvider(create: (context) => PlayerProvider()),
    ],
    child: const MyApp(),
  ));
}
