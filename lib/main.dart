import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/all.dart';

void main() {
  KakaoContext.clientId = "";
  KakaoContext.javascriptClientId = "";
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> _loginButton() async {
    String authCode = await AuthCodeClient.instance.request();
    print(authCode);
  }

  // login with KakaoTalk (0.6.4 ~ )
  // void loginButtonClicked() async {
  //   try {
  //     await UserApi.instance.loginWithKakaoTalk();
  //     // perform actions after login
  //   } catch (e) {
  //     print('error on login: $e');
  //   }
  // }

// login with KakaoAccount (0.6.4 ~ )
  void loginButtonClicked() async {
    try {
      await UserApi.instance.loginWithKakaoAccount();
      // perform actions after login
    } catch (e) {
      print('error on login: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.yellow),
              onPressed: () {
                _loginButton();
                loginButtonClicked();
              },
              child: Text(
                'KaKao Login',
              ),
            )
          ],
        ),
      ),
    );
  }
}
