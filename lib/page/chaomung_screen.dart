import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/page/authentication/dangnhap_screen.dart';
import 'package:flutter_moneymate_01/page/authentication/dangky_screen.dart';

class ChaoMung extends StatelessWidget {
  const ChaoMung({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          // constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 65),
              // logo image
              Image.asset(
                'assets/images/logo.png', // Replace with actual asset path
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),

              // App name
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  'MoneyMate',
                  style: TextStyle(
                    color: Color(0xFF3C3D37),
                    // fontSize: 30,
                    fontSize: 26,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 2.52,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),

              // Tagline
              Padding(
                padding: const EdgeInsets.only(top: 14),
                child: Text(
                  'Bạn đồng hành quản lý tiền bạc',
                  style: const TextStyle(
                    // fontSize: 18,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Montserrat',
                    color: Colors.black,
                    // letterSpacing: 2.0,
                    letterSpacing: 1.5,
                  ),
                ),
              ),

              // Main image
              Padding(
                // padding: const EdgeInsets.only(top: 70),
                padding: const EdgeInsets.only(top: 60),
                child: Image.asset(
                  'assets/images/main_image.png',
                  // width: 289,
                  width: 250,
                  fit: BoxFit.contain,
                ),
              ),

              // Bottom section with buttons
              Container(
                width: double.infinity,
                // padding: const EdgeInsets.fromLTRB(50, 40, 50, 36),
                padding: const EdgeInsets.fromLTRB(50, 40, 50, 36),
                decoration: const BoxDecoration(
                  color: Color(0xFFECDFCC), // Cream
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    // Login button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, AppRoutes.login);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DangNhap(),
                            ),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color(0xFF697565), // Dark Green
                            width: 5,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 17),
                        ),
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                            color: Color(0xFF697565), // Dark Green
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Register button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Handle register action
                          // Navigator.pushNamed(context, AppRoutes.register);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DangKy(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color(0xFF697565), // Dark Green
                          foregroundColor: const Color(0xFFECDFCC), // Cream
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 17),
                        ),
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
