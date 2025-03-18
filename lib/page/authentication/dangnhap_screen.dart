import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'quenmatkhau_screen.dart';
import 'dangky_screen.dart';
import '../dashboard/dashboardwidget.dart';
import '../mainpage.dart';

class DangNhap extends StatefulWidget {
  const DangNhap({Key? key}) : super(key: key);

  @override
  State<DangNhap> createState() => _DangNhapState();
}

class _DangNhapState extends State<DangNhap> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECDFCC),
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
                      child: const Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: const Text(
                          'Đăng nhập',
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
                // margin: const EdgeInsets.only(top: 30.0),
                margin: const EdgeInsets.only(top: 20.0),
                // padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 44.0),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 25.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Username field
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/user_icon.png', // Replace with actual asset path
                          width: 27,
                          height: 27,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          'Tên đăng nhập',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        hintText: 'Nhập tên đăng nhập',
                        hintStyle: const TextStyle(
                          fontFamily:
                              'Montserrat', // Áp dụng font cho hint text
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily:
                            'Montserrat', // Áp dụng font cho nội dung nhập vào
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),

                    // Password field
                    const SizedBox(height: 21),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/password_icon.png', // Replace with actual asset path
                          width: 27,
                          height: 27,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          'Mật khẩu',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 7),
                    TextField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 12,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                        hintText: 'Nhập mật khẩu',
                        hintStyle: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscurePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              _obscurePassword = !_obscurePassword;
                            });
                          },
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),

                    // Forgot password
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.pushNamed(context, '/quenmatkhau');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const QuenMatKhau(),
                              ),
                            );
                          },
                          child: const Text(
                            'Quên mật khẩu?',
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Login button
                    const SizedBox(height: 21),
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          // Navigator.pushNamed(context, '/dashboard');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Mainpage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 200,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E201E),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Đăng nhập',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Register link
                    const SizedBox(height: 21),
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            fontFamily: 'Montserrat',
                            color: Colors.black,
                          ),
                          children: [
                            const TextSpan(text: 'Chưa có tài khoản? '),
                            TextSpan(
                                text: 'Đăng ký',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () =>
                                      // Navigator.pushNamed(ontext, AppRoutes.register)
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => const DangKy(),
                                        ),
                                      )),
                          ],
                        ),
                      ),
                    ),

                    // Divider
                    const SizedBox(height: 21),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 133,
                          height: 1,
                          color: const Color(0x4D000000),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          child: Text(
                            'hoặc',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                              fontFamily: 'Montserrat',
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 133,
                          height: 1,
                          color: const Color(0x4D000000),
                        ),
                      ],
                    ),

                    // Google login button
                    const SizedBox(height: 21),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      padding: const EdgeInsets.fromLTRB(17, 10, 17, 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF1E201E),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/google_icon.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Tiếp tục với Google',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 26,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),

                    // Facebook login button
                    const SizedBox(height: 26),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 300),
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: const Color(0xFF1E201E),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/facebook_icon.png',
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 7),
                              Text(
                                'Tiếp tục với Facebook',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: 'Montserrat',
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward,
                            size: 26,
                            color: Colors.black,
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
