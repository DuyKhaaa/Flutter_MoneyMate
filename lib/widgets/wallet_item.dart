import 'package:flutter/material.dart';

class WalletItem extends StatelessWidget {
  final String iconPath; // Đường dẫn đến biểu tượng
  final String title;
  final String amount;
  final bool showAction;
  final String actionText;

  const WalletItem({
    Key? key,
    required this.iconPath,
    required this.title,
    required this.amount,
    this.showAction = false,
    this.actionText = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            // Icon
            Image.asset(
              iconPath, // Sử dụng Image.asset để lấy biểu tượng từ assets
              width: 40,
              height: 40,
            ),

            const SizedBox(width: 21),

            // Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Montserrat',
                  ),
                ),

                const SizedBox(height: 2),

                // Amount
                Text(
                  amount,
                  style: const TextStyle(
                    fontSize: 15,
                    fontFamily: 'Montserrat',
                  ),
                ),

                const SizedBox(height: 4),

                // Action button (if needed)
                if (showAction)
                  Row(
                    children: [
                      // Thay thế Container bằng Image.asset
                      Image.asset(
                        'assets/images/add_icon.png', // Đường dẫn đến biểu tượng của bạn
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        actionText,
                        style: const TextStyle(
                          color: Color(0xFF4ABD57),
                          fontSize: 15,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
