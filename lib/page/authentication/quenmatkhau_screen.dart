import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import '../../widgets/email_input.dart';
import 'xacthuc_quenmk_screen.dart';

class QuenMatKhau extends StatefulWidget {
  const QuenMatKhau({Key? key}) : super(key: key);

  @override
  State<QuenMatKhau> createState() => _QuenMatKhauState();
}

class _QuenMatKhauState extends State<QuenMatKhau> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.text = "kimngan@gmail.com"; // Pre-filled email for demo
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECDFCC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    // const EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back,
                          size: 26, color: Colors.black),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      // width: 70,
                      // height: 70,
                      width: 60,
                      height: 60,
                    ),
                    const Text(
                      'MoneyMate',
                      style: TextStyle(
                        // fontSize: 25,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.52,
                        color: Color(0xFF1E201E),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                // margin: const EdgeInsets.only(top: 30.0),
                margin: const EdgeInsets.only(top: 20.0),
                // padding: const EdgeInsets.fromLTRB(16, 16, 16, 180),
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 160),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/locked.png',
                      width: 82,
                      height: 82,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Nhập email',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Vui lòng nhập chính xác email mà bạn đã đăng ký để được xác thực.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Montserrat',
                      ),
                    ),
                    const SizedBox(height: 30),
                    const EmailInput(),
                    const SizedBox(height: 27),
                    // button Gửi
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, '/xacthucquenmk');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const XacThucQuenMatKhau(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(30, 32, 30, 1),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(150, 0),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 60, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Gửi',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const SizedBox(height: 14),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                        children: [
                          const TextSpan(text: 'Không nhớ chính xác email? '),
                          TextSpan(
                            text: 'Thử cách khác',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // TODO: Chuyển hướng sang màn hình khác nếu cần
                              },
                          ),
                        ],
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
