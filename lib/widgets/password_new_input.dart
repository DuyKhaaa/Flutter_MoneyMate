import 'package:flutter/material.dart';

class PasswordInputField extends StatelessWidget {
  final TextEditingController controller;
  final bool isPasswordVisible;
  final VoidCallback onToggleVisibility;

  const PasswordInputField({
    Key? key,
    required this.controller,
    required this.isPasswordVisible,
    required this.onToggleVisibility,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: const Color(0xFF1E201E),
          width: 1,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              obscureText: !isPasswordVisible,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontFamily: 'Montserrat',
                ),
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Colors.black,
                fontFamily: 'Montserrat',
              ),
            ),
          ),
          GestureDetector(
            onTap: onToggleVisibility,
            child: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              size: 22,
              color: Colors.black, // Thay đổi màu nếu cần
            ),
          ),
        ],
      ),
    );
  }
}
