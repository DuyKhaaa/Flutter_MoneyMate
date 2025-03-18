import 'package:flutter/material.dart';

class ThuchiTab extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const ThuchiTab({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 7),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.5),
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 17,
            fontWeight: FontWeight.w500,
            fontFamily: 'Montserrat',
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}