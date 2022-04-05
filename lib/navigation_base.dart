import 'package:flutter/material.dart';

import 'screens/players/player_list_screen.dart';
import 'screens/teams/team_list_screen.dart';

class NavigationBase extends StatefulWidget {
  const NavigationBase({Key? key}) : super(key: key);

  @override
  State<NavigationBase> createState() => _NavigationBaseState();
}

class _NavigationBaseState extends State<NavigationBase> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Eine Ansammlung an Screens
      body: IndexedStack(
        index: _currentIndex,
        children: const <Widget>[
          TeamListScreen(),
          PlayerListScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        // Die Navigationsleiste
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Team'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Player'),
        ],
        onTap: (newIndex) {
          setState(() {
            _currentIndex = newIndex;
          });
        },
      ),
    );
  }
}
