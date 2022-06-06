import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../kakao/kakao_login.dart';
import '../kakao/kakao_main_view_model.dart';
import '../kakao/kako_login_page.dart';
import '../my_button/my_button.dart';
import './google_login.dart';
import './home.dart';

class LogInRefac extends StatefulWidget {
  @override
  State<LogInRefac> createState() => _LogInRefacState();
}

class _LogInRefacState extends State<LogInRefac> {
  final viewModel = KakaoMainViewModel(KakaoLogin());

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    signOut();
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.orangeAccent,
        appBar: AppBar(
          // title: Text(
          //   "T4 캘린더",
          //   style: TextStyle(
          //     fontFamily: 'Gamja_Flower',
          //     fontSize: 25.0,
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.orangeAccent,
        ),
        body: _buildButton(),
      ),
    );
  }

  // Prvate build options
  Widget _buildButton() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "GOOSE",
                  style: TextStyle(
                    fontFamily: 'Gamja_Flower',
                    fontSize: 70.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ]
            ),
            SizedBox(
              height: 30,
            ),

            InkWell(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 150,
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(5), // Border radius
                      child: (ClipOval(child: Image.asset('image/login.png')))),
                    ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
