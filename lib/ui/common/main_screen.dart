import 'package:flutter/material.dart';

import '../views/community_screen.dart';
import '../views/diary_screen.dart';
import '../views/expert_screen.dart';
import '../views/home_screen.dart';
import '../views/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    CommunityScreen(),
    DiaryScreen(),
    ExpertScreen(),
    ProfileScreen(), // Profile screen 추가
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          title: const Text('The Play'),
        ),

        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),

        bottomNavigationBar:
        ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            child:
            Container(
              decoration: const BoxDecoration(
                border: Border(top: BorderSide(color: Colors.grey, width: 1.0)), // 라인효과
              ),
              child:
              BottomNavigationBar(
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled),
                    label: '홈',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps_rounded),
                    label: '분류',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.search),
                    label: '팀찾기',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.group),
                    label: '나의팀',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: '내정보',
                  ),
                ],
                currentIndex: _selectedIndex,
                selectedItemColor: Colors.blue[400],
                backgroundColor: Colors.white,
                onTap: _onItemTapped,
                unselectedItemColor: Colors.black26,
                type: BottomNavigationBarType.fixed,
                showSelectedLabels: true,
                showUnselectedLabels: true,
              ),
            )
        )
    );
  }
}
