import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String categoryKey;
  final String title;
  final String iconUrl;
  final String arrowUrl;
  final bool isLastItem;
  final bool isChecked; // Thay đổi ở đây
  final Function(bool) onCheckboxChanged;
  final bool hasCheckmark;

  const CategoryItem({
    Key? key,
    required this.categoryKey,
    required this.title,
    required this.iconUrl,
    required this.arrowUrl,
    required this.isLastItem,
    required this.isChecked, // Thay đổi ở đây
    required this.onCheckboxChanged,
    this.hasCheckmark = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: !isLastItem
            ? const Border(
                bottom: BorderSide(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  width: 1,
                ),
              )
            : null,
        borderRadius: isLastItem
            ? const BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              )
            : null,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Cập nhật trạng thái checkbox
                  onCheckboxChanged(!isChecked);
                },
                child: Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                  ),
                  child: isChecked
                      ? Center(
                          child: Image.asset(
                            'assets/images/check_icon.png', // Hình ảnh checkbox từ assets
                            width: 15,
                            height: 15,
                            fit: BoxFit.contain,
                          ),
                        )
                      : null,
                ),
              ),
              const SizedBox(width: 13),
              Image.asset(
                iconUrl, // Hình ảnh biểu tượng danh mục từ assets
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 13),
              Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Image.asset(
            arrowUrl, // Hình ảnh mũi tên từ assets
            width: 20,
            height: 20,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}