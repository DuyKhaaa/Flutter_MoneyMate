import 'package:flutter/material.dart';

class LichSuGhiChep extends StatelessWidget {
  const LichSuGhiChep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E201E),
        title: const Text(
          'Lịch sử ghi chép',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Transactions list
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 30), // Thêm margin ở đây
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    // First date group
                    _buildDateHeader('03/03/2025 (Thứ 2)'),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/cate29.png',
                      title: 'Tiền lương',
                      amount: '+5,000,000 đ',
                      isIncome: true,
                    ),

                    // Second date group
                    _buildDateHeader('05/03/2025 (Thứ 7)'),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/cate25.png',
                      title: 'Tiền điện',
                      amount: '-630,000 đ',
                      isIncome: false,
                    ),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/cate26.png',
                      title: 'Tiền nước',
                      amount: '-318,000 đ',
                      isIncome: false,
                    ),

                    // Third date group
                    _buildDateHeader('08/03/2025 (Thứ 3)'),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/mypham.png',
                      title: 'Mỹ phẩm',
                      amount: '-500,000 đ',
                      isIncome: false,
                    ),

                    // Four date group
                    _buildDateHeader('09/03/2025 (Chủ nhật)'),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/mypham.png',
                      title: 'Mỹ phẩm',
                      amount: '-500,000 đ',
                      isIncome: false,
                    ),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/food.png',
                      title: 'Ăn uống',
                      amount: '-240,000 đ',
                      isIncome: false,
                    ),

                    // Five date group
                    _buildDateHeader('11/03/2025 (Thứ 3)'),
                    _buildTransactionItem(
                      iconUrl: 'assets/images/cate23.png',
                      title: 'Tiền wifi',
                      amount: '-220,000 đ',
                      isIncome: false,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDateHeader(String date) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF697565),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Text(
        date,
        style: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildTransactionItem({
    required String iconUrl,
    required String title,
    required String amount,
    required bool isIncome,
  }) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                iconUrl,
                width: 35,
                height: 35,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 4),
              Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 15,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Text(
            amount,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 15,
              color:
                  isIncome ? const Color(0xFF4ABD57) : const Color(0xFFFE0000),
            ),
          ),
        ],
      ),
    );
  }
}
