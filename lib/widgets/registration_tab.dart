import 'package:flutter/material.dart';

class RegistrationTab extends StatelessWidget {
  final String icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const RegistrationTab({
    Key? key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.07),
              blurRadius: 4,
              offset: Offset(0, 4),
            ),
          ],
          border: Border.all(
            color: isSelected
                ? const Color(0xFF1E201E)
                : const Color.fromRGBO(0, 0, 0, 0.2),
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Image.asset(
              icon,
              width: 18,
              height: 18,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w500,
                fontFamily: 'Montserrat',
              ),
            ),
          ],
        ),
      ),
    );
  }
}