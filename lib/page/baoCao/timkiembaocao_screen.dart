import 'package:flutter/material.dart';

class TimKiemBaoCaoThuChi extends StatelessWidget {
  const TimKiemBaoCaoThuChi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E201E),
        title: const Text(
          'Tìm kiếm (Toàn thời gian)',
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
            // Search input field
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: const Color(0x80000000),
                    width: 1,
                  ),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 22, vertical: 11),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/search_icon.png',
                      width: 28,
                      height: 28,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Text(
                        'tiền',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Summary section
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 16, right: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 17),
                child: Row(
                  children: [
                    // Expenses column
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Chi tiêu',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '1,168,000 đ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xFFFE0000),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Container(
                        width: 1,
                        height: 30,
                        color: const Color(0xFFD9D9D9),
                      ),
                    ),

                    // Income column
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Thu nhập',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '1,000,000 đ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xFF4ABD57),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Divider
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 13),
                      child: Container(
                        width: 1,
                        height: 26,
                        color: const Color(0xFFD9D9D9),
                        margin: const EdgeInsets.only(top: 11),
                      ),
                    ),

                    // Total column
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            'Tổng',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            '-168,000 đ',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: const Color(0xFFFE0000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

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
                      amount: '+1,000,000 đ',
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
