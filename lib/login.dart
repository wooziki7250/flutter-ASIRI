import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/auth.dart';
import 'package:kakao_flutter_sdk/link.dart';

void main() async {
  KakaoContext.clientId = '62c3403831adbeba89528e0f5daf8eab';
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future<void> _loginButton() async {
    String authCode = await AuthCodeClient.instance.request();
  }

  TextEditingController idController = TextEditingController();
  TextEditingController pwController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('로그인'),
        ),
        body: Column(
          children: [
            TextField(
              controller: idController,
              decoration: const InputDecoration(labelText: '아이디를 입력하세요'),
            ),
            TextField(
              controller: pwController,
              decoration: const InputDecoration(labelText: '비밀번호를 입력하세요'),
            ),
            GestureDetector(
              onTap: _loginButton,
              child: const CircleAvatar(
                backgroundImage: AssetImage('imgaes/kakaka.jpg'),
                radius: 30,
              ),
            ),
          ],
        ));
  }
}
