import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  final String category;
  final String timeAgo;
  final String message;
  final bool isFirst;
  final bool isLast;

  const NotificationItem({
    Key? key,
    required this.category,
    required this.timeAgo,
    required this.message,
    required this.isFirst,
    required this.isLast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: isFirst ? const Radius.circular(10) : Radius.zero,
          topRight: isFirst ? const Radius.circular(10) : Radius.zero,
          bottomLeft: isLast ? const Radius.circular(10) : Radius.zero,
          bottomRight: isLast ? const Radius.circular(10) : Radius.zero,
        ),
        border: Border(
          bottom: BorderSide(
            color: const Color(0x1A000000),
            width: 1,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with category and time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Montserrat',
                ),
              ),
              Text(
                timeAgo,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Notification message
          Text(
            message,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w400,
              fontFamily: 'Montserrat',
            ),
          ),
        ],
      ),
    );
  }
}