import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap; // Callback khi nhấn vào

  const CategoryItem({
    Key? key,
    required this.imageUrl,
    this.isSelected = false,
    required this.onTap, // Thêm tham số onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Sử dụng GestureDetector để xử lý nhấn
      onTap: onTap, // Gọi callback khi nhấn
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? Border.all(color: Colors.black, width: 1) : null,
        ),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, // Căn giữa theo chiều dọc
          children: [
            Image.asset(
              imageUrl,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
            ),
          ],
        ),
      ),
    );
  }
}
