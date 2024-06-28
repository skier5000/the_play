import 'package:flutter/material.dart';

import 'community_menu1_screen.dart';
import 'community_menu2_screen.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  Future<void> _refresh() async {
    // 새로고침 로직 추가
    await Future.delayed(const Duration(seconds: 2)); // 예제용 지연 시간
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: const Text('Community Menu 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CommunityMenu1Screen()),
                );
              },
            ),
            ListTile(
              title: const Text('Community Menu 2'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CommunityMenu2Screen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
