import 'package:flutter/material.dart';
import '../../widgets/custom_app_bar.dart';


class UserWidget extends StatelessWidget {
  const UserWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
        title: "Tài khoản",
        showToggleButtons: false,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
          child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Main content container
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Logo
                        Center(
                          child: Stack(
                            children: [
                              // Avatar hình tròn
                              CircleAvatar(
                                radius: 76.5, // 153 / 2
                                backgroundImage:
                                    AssetImage('assets/images/avt.jpg'),
                              ),

                              // Icon camera nằm ở góc dưới phải
                              Positioned(
                                bottom: 5, // Khoảng cách từ dưới lên
                                right: 5, // Khoảng cách từ phải sang
                                child: Container(
                                  width: 35, // Kích thước icon camera
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .white, // Nền trắng cho icon camera
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        blurRadius: 4,
                                        spreadRadius: 1,
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.black54,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Phone number section
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/user_icon.png',
                              width: 27,
                              height: 27,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 3),
                            const Text(
                              'Tên đăng nhập',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFF1E201E),
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical:
                                2, // Giảm padding để cân đối với TextField
                          ),
                          child: Row(
                            children: [
                              // Edit text field
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                      text: 'Duy Uyen'), // Giá trị ban đầu
                                  style: const TextStyle(fontSize: 17),
                                  decoration: const InputDecoration(
                                    border:
                                        InputBorder.none, // Ẩn border mặc định
                                    hintText:
                                        'Nhập tên...', // Gợi ý khi chưa nhập gì
                                  ),
                                ),
                              ),
                              // Edit icon
                              // GestureDetector(
                              //   onTap: () {
                              //     // TODO: Xử lý logic khi bấm vào icon chỉnh sửa
                              //   },
                              //   child: Image.asset(
                              //     'assets/images/edit.png',
                              //     width: 25,
                              //     height: 25,
                              //     fit: BoxFit.contain,
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                        // Email section
                        const SizedBox(height: 21),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/image.png',
                              width: 27,
                              height: 27,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'Email',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFF1E201E),
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical:
                                2, // Giảm padding để cân đối với TextField
                          ),
                          child: Row(
                            children: [
                              // Edit text field
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                      text: 'duyuyen041104@gmail.com'), // Giá trị ban đầu
                                  style: const TextStyle(fontSize: 17),
                                  decoration: const InputDecoration(
                                    border:
                                        InputBorder.none, // Ẩn border mặc định
                                    hintText:
                                        'Nhập email...', // Gợi ý khi chưa nhập gì
                                  ),
                                ),
                              ),
                              // Edit icon
                              // GestureDetector(
                              //   onTap: () {
                              //     // TODO: Xử lý logic khi bấm vào icon chỉnh sửa
                              //   },
                              //   child: Image.asset(
                              //     'assets/images/edit.png',
                              //     width: 25,
                              //     height: 25,
                              //     fit: BoxFit.contain,
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                        // Username section
                        const SizedBox(height: 21),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/phone_icon.png',
                              width: 27,
                              height: 27,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'Số điện thoại',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                       const SizedBox(height: 7),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFF1E201E),
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical:
                                2, // Giảm padding để cân đối với TextField
                          ),
                          child: Row(
                            children: [
                              // Edit text field
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                      text: '0919041104'), // Giá trị ban đầu
                                  style: const TextStyle(fontSize: 17),
                                  decoration: const InputDecoration(
                                    border:
                                        InputBorder.none, // Ẩn border mặc định
                                    hintText:
                                        'Nhập số điện thoại...', // Gợi ý khi chưa nhập gì
                                  ),
                                ),
                              ),
                              // Edit icon
                              // GestureDetector(
                              //   onTap: () {
                              //     // TODO: Xử lý logic khi bấm vào icon chỉnh sửa
                              //   },
                              //   child: Image.asset(
                              //     'assets/images/edit.png',
                              //     width: 25,
                              //     height: 25,
                              //     fit: BoxFit.contain,
                              //   ),
                              // ),
                            ],
                          ),
                        ),

                        // Password section
                        const SizedBox(height: 21),
                        Row(
                          children: [
                            Image.asset(
                              'assets/images/password_icon.png',
                              width: 27,
                              height: 27,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(width: 2),
                            const Text(
                              'Mật khẩu',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                //fontFamily: 'Montserrat',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Container(
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: const Color(0xFF1E201E),
                              width: 2,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical:
                                2, // Giảm padding để cân đối với TextField
                          ),
                          child: Row(
                            children: [
                              // Edit text field
                              Expanded(
                                child: TextField(
                                  controller: TextEditingController(
                                      text: '********'), // Giá trị ban đầu
                                  style: const TextStyle(fontSize: 17),
                                  readOnly: true,
                                  decoration: const InputDecoration(
                                    border:
                                        InputBorder.none, // Ẩn border mặc định
                                  ),
                                ),
                              ),
                              Image.asset(
                                  'assets/images/eye.png',
                                  width: 25,
                                  height: 25,
                                  fit: BoxFit.contain,
                                ),
                            ],
                          ),
                        ),

                        // Change password link
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Text(
                              'Đổi mật khẩu ',
                              style: TextStyle(
                                fontSize: 15,
                                //fontFamily: 'Montserrat',
                              ),
                            ),
                            Image.asset(
                              'assets/images/arrow2_icon.png',
                              width: 15,
                              height: 15,
                              fit: BoxFit.contain,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Buttons section
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      children: [
                        // Save button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Xử lý lưu thay đổi
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Color(0xFF4ABD57), // Viền xanh lá
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Lưu thay đổi',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF4ABD57), // Chữ xanh lá
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Cancel button
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              // TODO: Xử lý hủy thay đổi
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: const BorderSide(
                                  color: Color(0xFFFE0000), // Viền đỏ
                                  width: 1,
                                ),
                              ),
                            ),
                            child: const Text(
                              'Hủy',
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFFE0000), // Chữ đỏ
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      )),
    );
  }
}
