import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dangnhap_screen.dart';

class DangKyFinal extends StatefulWidget {
  const DangKyFinal({Key? key}) : super(key: key);

  @override
  State<DangKyFinal> createState() => _DangKyFinalState();
}

class _DangKyFinalState extends State<DangKyFinal> {
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  final TextEditingController _phoneController =
      TextEditingController(text: '0123456789');
  final TextEditingController _emailController =
      TextEditingController(text: 'kimngan@gmail.com');
  final TextEditingController _usernameController =
      TextEditingController(text: 'kngan306');
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _phoneController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      child: const Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: const Text(
                          'Đăng ký',
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
                // padding: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(top: 20),
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

              // Form section
              Container(
                // margin: const EdgeInsets.only(top: 30.0),
                margin: const EdgeInsets.only(top: 20.0),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 25.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Phone number field
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/phone_icon.png', // Replace with actual asset path
                            width: 27,
                            height: 27,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'Số điện thoại',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        controller: _phoneController,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),

                      // Email field
                      const SizedBox(height: 21),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/email_icon.png', // Replace with actual asset path
                            width: 27,
                            height: 27,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 2),
                          const Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),

                      // Username field
                      const SizedBox(height: 21),
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
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 14),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
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
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),

                      // Confirm password field
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
                            'Xác nhận mật khẩu',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !_isConfirmPasswordVisible,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 12),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isConfirmPasswordVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              setState(() {
                                _isConfirmPasswordVisible =
                                    !_isConfirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),

                      // Register button
                      const SizedBox(height: 21),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            // Navigator.pushNamed(context, AppRoutes.login);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DangNhap(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1E201E),
                            foregroundColor: Colors.white,
                            minimumSize: const Size(200, 48),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 64, vertical: 12),
                          ),
                          child: const Text(
                            'Đăng ký',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ),
                      ),

                      // Login link
                      const SizedBox(height: 21),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to login screen
                          },
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                              ),
                              children: [
                                const TextSpan(text: 'Đã có tài khoản? '),
                                TextSpan(
                                  text: 'Đăng nhập',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      // Navigator.pushNamed(
                                      //     context, AppRoutes.login);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const DangNhap(),
                                        ),
                                      );
                                    },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
