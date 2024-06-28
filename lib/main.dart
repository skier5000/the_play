import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_play/services/auth_service.dart';
import 'package:the_play/ui/common/login_screen.dart';
import 'package:the_play/ui/common/main_screen.dart';
import 'package:the_play/ui/common/splash_screen.dart';

void main() async {
  runApp(const SportsMatchApp());
}

class SportsMatchApp extends StatelessWidget {
  const SportsMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthService(),
      child: MaterialApp(
        title: 'The Play',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    if (authService.isAuthenticated) {
      return const MainScreen();
    } else {
      return const LoginScreen();
    }
  }
}