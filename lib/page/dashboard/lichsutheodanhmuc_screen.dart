import 'package:flutter/material.dart';

class LichSuTheoDanhMuc extends StatelessWidget {
  const LichSuTheoDanhMuc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E201E),
        title: const Text(
          'Lịch sử ghi chép',
          style: TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.white,
            fontSize: 20,
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
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Category section
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'assets/images/mypham.png', // Thay thế bằng đường dẫn đến hình ảnh của bạn
                          width: 40,
                          height: 40,
                          fit: BoxFit
                              .cover, // Đảm bảo hình ảnh được bao phủ toàn bộ không gian
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Mỹ phẩm',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Transaction list
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Thứ 7, 08/03/2025',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '-500,000 đ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: const Color(0xFFFE0000),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  margin: const EdgeInsets.only(top: 1),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Chủ nhật, 09/03/2025',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '-500,000 đ',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: const Color(0xFFFE0000),
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
