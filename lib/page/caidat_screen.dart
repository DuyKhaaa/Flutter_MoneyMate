import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/widgets/settings_item.dart';
import '../../widgets/custom_app_bar.dart';


class CaiDat extends StatelessWidget {
  const CaiDat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Cài đặt",
        showToggleButtons: false,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                // Content
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Display Section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'Hiển thị',
                                  style: const TextStyle(
                                    fontFamily:
                                        'Montserrat', // Sử dụng font Montserrat đã thêm
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [
                                    SettingsItem(
                                      title: 'Thay đổi ngôn ngữ',
                                      value: 'Tiếng Việt',
                                      icon:
                                          'assets/images/arrow2_icon.png', // Đường dẫn đến biểu tượng
                                      hasBorder: true,
                                    ),
                                    SettingsItem(
                                      title: 'Thay đổi tiền tệ',
                                      value: 'VND',
                                      icon:
                                          'assets/images/arrow2_icon.png', // Đường dẫn đến biểu tượng
                                      hasBorder: true,
                                    ),
                                    SettingsItem(
                                      title: 'Thay đổi chủ đề',
                                      value: 'Sáng',
                                      icon:
                                          'assets/images/arrow2_icon.png', // Đường dẫn đến biểu tượng
                                      hasBorder: false,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Data Section
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(bottom: 12),
                                child: Text(
                                  'Dữ liệu',
                                  style: const TextStyle(
                                    fontFamily:
                                        'Montserrat', // Sử dụng font Montserrat đã thêm
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 13),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Xoá tất cả dữ liệu',
                                      style: const TextStyle(
                                        fontFamily:
                                            'Montserrat', // Sử dụng font Montserrat đã thêm
                                        fontSize: 15,
                                        color: Color(0xFFFE0000),
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/delete_icon.png', // Đường dẫn đến biểu tượng xóa
                                      width: 25,
                                      height: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
