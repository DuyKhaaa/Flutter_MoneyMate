import 'package:flutter/material.dart';
import '../../widgets/password_new_input.dart';
import 'dangnhap_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _passwordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void dispose() {
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
          child: Container(
            child: Column(
              children: [
                // Header section
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
                  // margin: const EdgeInsets.only(top: 30.0),
                  margin: const EdgeInsets.only(top: 20.0),
                  // padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 90.0),
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 78.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/unlocked.png', // Replace with your actual asset
                        width: 82,
                        height: 82,
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Xác thực thành công',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        'Đã xác thực thành công, vui lòng nhập lại mật khẩu mới của bạn.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),

                      // Password field
                      const SizedBox(height: 25),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/password_icon.png', // Replace with your actual asset
                            width: 27,
                            height: 27,
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
                      PasswordInputField(
                        controller: _passwordController,
                        isPasswordVisible: _passwordVisible,
                        onToggleVisibility: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),

                      // Confirm password field
                      const SizedBox(height: 21),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/password_icon.png', // Replace with your actual asset
                            width: 27,
                            height: 27,
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
                      PasswordInputField(
                        controller: _confirmPasswordController,
                        isPasswordVisible: _confirmPasswordVisible,
                        onToggleVisibility: () {
                          setState(() {
                            _confirmPasswordVisible = !_confirmPasswordVisible;
                          });
                        },
                      ),

                      // Save button
                      const SizedBox(height: 25),
                      ElevatedButton(
                        onPressed: () {
                          // Implement save functionality
                          if (_passwordController.text ==
                              _confirmPasswordController.text) {
                            // Passwords match, proceed with save
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Mật khẩu đã được cập nhật')),
                            );
                            // Chuyển hướng sang màn hình đăng nhập bằng route name
                            Future.delayed(const Duration(seconds: 1), () {
                              // Navigator.pushReplacementNamed(
                              //     context, '/dangnhap');
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DangNhap(),
                                ),
                              );
                            });
                          } else {
                            // Passwords don't match
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Mật khẩu không khớp')),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E201E),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          minimumSize: const Size(150, 48),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 59, vertical: 12),
                        ),
                        child: const Text(
                          'Lưu',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
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
      ),
    );
  }
}
