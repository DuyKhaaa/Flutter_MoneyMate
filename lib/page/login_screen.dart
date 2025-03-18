import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECDFCC),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height *
                  0.75, // 65% chiều cao màn hình
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 110),
                  Image.asset('assets/images/logo.png', width: 70, height: 70),
                  const SizedBox(height: 10),
                  const Text(
                    "MoneyMate",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 2.5,
                      color: Color(0xFF3C3D37),
                    ),
                  ),
                  const SizedBox(height: 50),
                  _buildInputField(
                    icon: Icons.person,
                    label: "Tên đăng nhập",
                    hintText: "kngan306",
                  ),
                  _buildInputField(
                    icon: Icons.lock,
                    label: "Mật khẩu",
                    hintText: "*************",
                    isPassword: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 32, top: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Quên mật khẩu?",
                          style: TextStyle(color: Colors.black54),
                        ),
                      ),
                    ),
                  ),
                  _buildButton("Đăng nhập", Colors.black, Colors.white),
                  const SizedBox(height: 20),
                  const Text("Chưa có tài khoản? ",
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Đăng ký",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  _buildDivider(),
                  _buildSocialButton(
                    icon: Icons.g_mobiledata,
                    text: "Tiếp tục với Google",
                  ),
                  const SizedBox(height: 10),
                  _buildSocialButton(
                    icon: Icons.facebook,
                    text: "Tiếp tục với Facebook",
                    color: Colors.blue,
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInputField({
    required IconData icon,
    required String label,
    required String hintText,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 27),
              const SizedBox(width: 10),
              Text(label,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 5),
          TextField(
            obscureText: isPassword,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, Color bgColor, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 10),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          foregroundColor: textColor,
          minimumSize: const Size(200, 45),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        child: Text(text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
      child: Row(
        children: [
          const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text("hoặc",
                style: TextStyle(fontSize: 12, color: Colors.black38)),
          ),
          const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
        ],
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String text,
    Color color = Colors.white,
    Color textColor = Colors.black,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          foregroundColor: textColor,
          minimumSize: const Size(300, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Colors.black),
          ),
        ),
        icon: Icon(icon, size: 30),
        label: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
