import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:the_play/ui/common/signup_screen.dart';
import 'package:video_player/video_player.dart';
import '../../services/auth_service.dart';
import 'forgot_password_screen.dart';
import 'main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authService = Provider.of<AuthService>(context);
//
//     return Scaffold(
//       appBar: AppBar(title: const Text('Login')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 IconButton(
//                   icon: const Icon(Icons.account_circle, color: Colors.blue),
//                   onPressed: () async {
//                     try {
//                       await authService.signInWithGoogle();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Google login failed: $e')),
//                       );
//                     }
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.account_circle, color: Colors.blue),
//                   onPressed: () async {
//                     try {
//                       await authService.signInWithFacebook();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Facebook login failed: $e')),
//                       );
//                     }
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.account_circle, color: Colors.blue),
//                   onPressed: () async {
//                     try {
//                       await authService.signInWithApple();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Apple login failed: $e')),
//                       );
//                     }
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.account_circle, color: Colors.blue),
//                   onPressed: () async {
//                     try {
//                       await authService.signInWithKakao();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Kakao login failed: $e')),
//                       );
//                     }
//                   },
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.account_circle, color: Colors.blue),
//                   onPressed: () async {
//                     try {
//                       await authService.signInWithNaver();
//                       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
//                     } catch (e) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(content: Text('Naver login failed: $e')),
//                       );
//                     }
//                   },
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class _LoginScreenState extends State<LoginScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('login/login_background_video.mp4')
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
        _controller.setLooping(true);
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          _controller.value.isInitialized
              ? SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: _controller.value.size.width,
                height: _controller.value.size.height,
                child: VideoPlayer(_controller),
              ),
            ),
          )
              : Container(color: Colors.black),
          Container(
            color: Colors.black.withOpacity(0.5), // 어둡게 만들기 위해 반투명 검은색 오버레이
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'The Play',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                Column(
                  children: [
                    // ElevatedButton(
                    //   onPressed: () {
                    //     // 로그인 로직 구현
                    //     print('ㅋㅋ');
                    //   },
                    //   child: Image.asset('login/naver_btnG.png'),
                    // ),

                    loginMainIcon(),
                    const SizedBox(height: 20),
                    loginSubIcon(),

                    // IconButton(
                    //   icon: const Icon(Icons.account_circle, color: Colors.blue),
                    //   onPressed: () async {
                    //     try {
                    //       await authService.signInWithNaver();
                    //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainScreen()));
                    //     } catch (e) {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text('Naver login failed: $e')),
                    //       );
                    //     }
                    //   },
                    // ),
                  ],
                )

              ],
            ),
          ),
        ],
      ),
    );
  }

  /// 로그인 메인 Icon
  Widget loginMainIcon() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ElevatedButton(
            onPressed: () {
              print('클릭!!!!');
            },
            child: SizedBox(
                width: 100000,
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Image(
                      image: AssetImage('login/naver_btnG.png'),
                      width: 50,
                    )
                )
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              print('클릭!!!!');
            },
            child: SizedBox(
                width: 100000,
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Image(
                      image: AssetImage('login/naver_btnG.png'),
                      width: 50,
                    )
                )
            ),
          ),

          const SizedBox(height: 20),

          ElevatedButton(
            onPressed: () {
              print('클릭!!!!');
            },
            child: SizedBox(
                width: 100000,
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: const Image(
                      image: AssetImage('login/naver_btnG.png'),
                      width: 50,
                    )
                )
            ),
          ),

        ],
      ),
    );
  }

  /// 로그인 서브 Icon
  Widget loginSubIcon() {
    return Container(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
              width: 70,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Image(
                    image: AssetImage('login/naver_btnG.png'),
                    width: 50,
                  )
              )
          ),

          const SizedBox(height: 20),

          SizedBox(
              width: 70,
              child: Container(
                  alignment: Alignment.bottomLeft,
                  child: const Image(
                    image: AssetImage('login/naver_btnG.png'),
                    width: 50,
                  )
              )
          ),

        ],
      ),
    );
  }
}