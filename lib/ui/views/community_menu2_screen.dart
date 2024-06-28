import 'package:flutter/material.dart';

class CommunityMenu2Screen extends StatelessWidget {
  const CommunityMenu2Screen({super.key});

  Future<void> _refresh() async {
    // 새로고침 로직 추가
    await Future.delayed(const Duration(seconds: 2)); // 예제용 지연 시간
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community Menu 2'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          children: const [
            Center(
              child: Text('Community Menu 2 Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
