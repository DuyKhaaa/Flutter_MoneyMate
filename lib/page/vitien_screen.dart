import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/widgets/wallet_item.dart';
import '../../widgets/custom_app_bar.dart';

class ViTien extends StatelessWidget {
  const ViTien({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Ví của tôi",
        showToggleButtons: false,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            // Main Content
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Greeting
                      Padding(
                        padding: const EdgeInsets.only(bottom: 22.0),
                        child: Text(
                          'Xin chào Duy Uyen!',
                          style: const TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),

                      // Total Card
                      WalletItem(
                        iconPath: 'assets/images/calculator.png',
                        title: 'Tổng cộng',
                        amount: '+10,000,000 đ',
                        showAction: false,
                      ),

                      const SizedBox(height: 11),

                      // Cash Card
                      WalletItem(
                        iconPath: 'assets/images/cate30.png',
                        title: 'Tiền mặt',
                        amount: '+10,000,000 đ',
                        showAction: true,
                        actionText: 'Chỉnh sửa',
                      ),

                      const SizedBox(height: 11),

                      // E-wallet Card
                      WalletItem(
                        iconPath: 'assets/images/cate29.png',
                        title: 'Ví điện tử',
                        amount: '0 đ',
                        showAction: true,
                        actionText: 'Thêm ví',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
