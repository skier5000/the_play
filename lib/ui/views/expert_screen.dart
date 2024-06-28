import 'package:flutter/material.dart';

class ExpertScreen extends StatelessWidget {
  const ExpertScreen({super.key});

  Future<void> _refresh() async {
    // 새로고침 로직 추가
    await Future.delayed(const Duration(seconds: 2)); // 예제용 지연 시간
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expert'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          children: const [
            Center(
              child: Text('Expert Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
