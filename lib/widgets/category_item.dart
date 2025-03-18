import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String imageUrl;
  final String label;
  final bool isSelected;
  final VoidCallback onTap; // Callback khi nhấn vào

  const CategoryItem({
    Key? key,
    required this.imageUrl,
    required this.label,
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
        // width: 90,
        // height: 90,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? Border.all(color: Colors.black, width: 1) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
          children: [
            Image.asset(
              imageUrl,
              width: 35,
              height: 35,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 5),
            // Cập nhật widget Text để giới hạn chiều dài
            Text(
              label,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
              ),
              textAlign: TextAlign.center,
              maxLines: 1, // Giới hạn số dòng
              overflow: TextOverflow.ellipsis, // Hiển thị dấu "..." nếu quá dài
            ),
          ],
        ),
      ),
    );
  }
}
