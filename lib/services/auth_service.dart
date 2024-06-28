import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class AuthService with ChangeNotifier {
  final String _baseUrl = 'http://<your-ec2-instance-ip>:8080/api';
  User? _user;

  User? get user => _user;
  bool get isAuthenticated => _user != null;

  Future<void> signIn(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      if (responseJson['success']) {
        _user = User(email: email);
        notifyListeners();
      } else {
        throw Exception(responseJson['message']);
      }
    } else {
      throw Exception('Failed to sign in');
    }
  }

  /// 로그아웃
  Future<void> signOut() async {
    _user = null;
    notifyListeners();
  }

  /// Google 로그인
  Future<void> signInWithGoogle() async {
    // final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    // if (googleUser != null) {
    //   _user = User(email: googleUser.email);
    //   notifyListeners();
    // }
  }

  /// Facebook 로그인
  Future<void> signInWithFacebook() async {
    // final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;
    // if (result.token != null) {
    //   _user = User(email: result.userId);
    //   notifyListeners();
    // }
  }

  /// Apple 로그인
  Future<void> signInWithApple() async {
    // final AuthorizationCredentialAppleID credential = await SignInWithApple.getAppleIDCredential(
    //   scopes: [
    //     AppleIDAuthorizationScopes.email,
    //     AppleIDAuthorizationScopes.fullName,
    //   ],
    // );
    // _user = User(email: credential.email!);
    // notifyListeners();
  }

  /// Kakao 로그인
  Future<void> signInWithKakao() async {
    final User user = (await UserApi.instance.me()) as User;
    _user = User(email: user.kakaoAccount?.email);
    notifyListeners();
  }

  /// Naver 로그인
  Future<void> signInWithNaver() async {
    // final NaverLoginResult result = await NaverLogin().logIn();
    // if (result.status == NaverLoginStatus.loggedIn) {
    //   _user = User(email: result.account.email);
    //   notifyListeners();
    // }
  }

  /// 회원가입 메서드
  Future<void> signUp(String email, String password) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      if (responseJson['success']) {
        _user = User(email: email);
        notifyListeners();
      } else {
        throw Exception(responseJson['message']);
      }
    } else {
      throw Exception('Failed to sign up');
    }
  }

  /// 비밀번호 찾기 메서드
  Future<void> forgotPassword(String email) async {
    final response = await http.post(
      Uri.parse('$_baseUrl/forgot-password'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': email,
      }),
    );

    if (response.statusCode == 200) {
      final responseJson = jsonDecode(response.body);
      if (!responseJson['success']) {
        throw Exception(responseJson['message']);
      }
    } else {
      throw Exception('Failed to send password reset email');
    }
  }
}

class User {
  final String? email;

  User({this.email});

  get kakaoAccount => null;
}