import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final String value;
  final String icon; // Thay đổi kiểu dữ liệu của icon
  final bool hasBorder;

  const SettingsItem({
    Key? key,
    required this.title,
    required this.value,
    required this.icon, // Giữ nguyên
    this.hasBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 13),
      decoration: BoxDecoration(
        border: hasBorder
            ? const Border(
                bottom: BorderSide(
                  color: Color(0x1A000000),
                  width: 1,
                ),
              )
            : null,
      ),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Montserrat', // Sử dụng font Montserrat đã thêm
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Montserrat', // Sử dụng font Montserrat đã thêm
              fontSize: 15,
              color: Colors.black,
            ),
          ),
          const SizedBox(width: 7),
          // Sử dụng Image.asset để lấy biểu tượng từ assets
          Image.asset(
            icon, // Sử dụng icon từ tham số
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}