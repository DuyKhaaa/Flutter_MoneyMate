import 'package:flutter/material.dart';
import 'dart:async';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
              width: 85,
              height: 85,
            ),
            const SizedBox(height: 20),
            const Text(
              "MoneyMate",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w800,
                fontSize: 30,
                letterSpacing: 0.1,
                color: Color(0xFF3C3D37),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Bạn đồng hành quản lý tiền bạc",
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: 16,
                letterSpacing: 0.1,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            Image.asset(
              'assets/images/mascot.png',
              width: 297.37,
              height: 309,
            ),
          ],
        ),
      ),
    );
  }
}