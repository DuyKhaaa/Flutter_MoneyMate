import 'package:flutter/material.dart';
import '../../widgets/category_item.dart';
import 'danhmucthu_screen.dart';
import 'themkhoanchi_screen.dart';

class ThemKhoanThu extends StatefulWidget {
  const ThemKhoanThu({Key? key}) : super(key: key);

  @override
  State<ThemKhoanThu> createState() => _ThemKhoanThuState();
}

class _ThemKhoanThuState extends State<ThemKhoanThu> {
  int selectedCategoryIndex = 0; // Chỉ số của mục được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: [
            // fields
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Date selection field
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0x1A000000),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/calendar_icon.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Ngày',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(
                              width: 40), // Khoảng cách giữa Text và đường gạch
                          Container(
                            width: 1, // Độ rộng của đường gạch
                            height: 40, // Chiều cao của đường gạch
                            color: const Color(0x331E201E),
                          ),
                          const SizedBox(
                              width:
                                  18), // Khoảng cách giữa đường gạch và TextField
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                    'Montserrat', // Font cho văn bản nhập vào
                                color: Colors.black, // Màu chữ khi nhập
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Chọn ngày tháng năm',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat', // Font cho hintText
                                  color: Color(0x331E201E),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/arrow2_icon.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),

                    // Amount input field
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0x1A000000),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/money_icon.png',
                            width: 30,
                            height: 30,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 7),
                          const Text(
                            'Số tiền',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(
                              width: 25), // Khoảng cách giữa Text và đường gạch
                          Container(
                            width: 1, // Độ rộng của đường gạch
                            height: 40, // Chiều cao của đường gạch
                            color: const Color(0x331E201E),
                          ),
                          const SizedBox(
                              width:
                                  18), // Khoảng cách giữa đường gạch và TextField
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                    'Montserrat', // Font cho văn bản nhập vào
                                color: Colors.black, // Màu chữ khi nhập
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nhập vào số tiền',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat', // Font cho hintText
                                  color: Color(0x331E201E),
                                ),
                              ),
                            ),
                          ),
                          const Text(
                            'đ',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Note input field
                    Container(
                      padding: const EdgeInsets.fromLTRB(16, 15, 72, 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0x1A000000),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/images/note_icon.png',
                            width: 30,
                            height: 40,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(width: 7),
                          const Text(
                            'Ghi chú',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(
                              width: 17), // Khoảng cách giữa Text và đường gạch
                          Container(
                            width: 1, // Độ rộng của đường gạch
                            height: 40, // Chiều cao của đường gạch
                            color: const Color(0x331E201E),
                          ),
                          const SizedBox(
                              width:
                                  18), // Khoảng cách giữa đường gạch và TextField
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                    'Montserrat', // Font cho văn bản nhập vào
                                color: Colors.black, // Màu chữ khi nhập
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nhập vào ghi chú',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat', // Font cho hintText
                                  color: Color(0x331E201E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Frequently used categories section
                    Container(
                      padding:
                          const EdgeInsets.all(16), // Padding cho container
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Mục hay dùng',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              const SizedBox(width: 7),
                              Image.asset(
                                'assets/images/dropdown_icon.png',
                                width: 20,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                            ],
                          ),
                          // Container chứa danh sách các mục với Transform
                          Transform.translate(
                            offset:
                                const Offset(0, 0), // Dịch chuyển lên 10 pixel
                            child: Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              height:
                                  300, // Chiều cao cố định để giới hạn số dòng hiển thị
                              child: ListView(
                                children: [
                                  // First row of categories
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CategoryItem(
                                          imageUrl: 'assets/images/cate29.png',
                                          label: 'Tiền lương',
                                          isSelected:
                                              selectedCategoryIndex == 0,
                                          onTap: () {
                                            setState(() {
                                              selectedCategoryIndex =
                                                  0; // Cập nhật chỉ số khi nhấn
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: CategoryItem(
                                          imageUrl: 'assets/images/cate33.png',
                                          label: 'Phụ cấp',
                                          isSelected:
                                              selectedCategoryIndex == 1,
                                          onTap: () {
                                            setState(() {
                                              selectedCategoryIndex =
                                                  1; // Cập nhật chỉ số khi nhấn
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: CategoryItem(
                                          imageUrl: 'assets/images/cate31.png',
                                          label: 'Thu nhập thụ',
                                          isSelected:
                                              selectedCategoryIndex == 2,
                                          onTap: () {
                                            setState(() {
                                              selectedCategoryIndex =
                                                  2; // Cập nhật chỉ số khi nhấn
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),

                                  // Second row of categories
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl:
                                                'assets/images/cate32.png',
                                            label: 'Tiền thưởng',
                                            isSelected:
                                                selectedCategoryIndex == 3,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex =
                                                    3; // Cập nhật chỉ số khi nhấn
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl:
                                                'assets/images/cate30.png',
                                            label: 'Đầu tư',
                                            isSelected:
                                                selectedCategoryIndex == 4,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex =
                                                    4; // Cập nhật chỉ số khi nhấn
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () {
                                              // Chuyển đến trang DanhMucChi
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const DanhMucThu()),
                                              );
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      6, 30, 1, 30),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center, // Căn giữa nội dung
                                                children: [
                                                  const Text(
                                                    'Chỉnh sửa',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontFamily: 'Montserrat',
                                                    ),
                                                  ),
                                                  const SizedBox(width: 3),
                                                  Image.asset(
                                                    'assets/images/arrow2_icon.png',
                                                    width: 20,
                                                    height: 20,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ],
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
                        ],
                      ),
                    ),

                    // Wallet selection field
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 13, vertical: 15),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        border: Border(
                          bottom: BorderSide(
                            color: Color(0x1A000000),
                            width: 1,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/wallet_icon.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Ví tiền',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Montserrat',
                                ),
                              ),
                              const SizedBox(
                                  width:
                                      30), // Khoảng cách giữa Text và đường gạch
                              Container(
                                width: 1, // Độ rộng của đường gạch
                                height: 40, // Chiều cao của đường gạch
                                color: const Color(0x331E201E),
                              ),
                              const SizedBox(
                                  width:
                                      18), // Khoảng cách giữa đường gạch và TextField
                            ],
                          ),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily:
                                    'Montserrat', // Font cho văn bản nhập vào
                                color: Colors.black, // Màu chữ khi nhập
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Chọn ví tiền của bạn',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat', // Font cho hintText
                                  color: Color(0x331E201E),
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/arrow2_icon.png',
                            width: 20,
                            height: 20,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                    ),

                    // Save button
                    Container(
                      margin: const EdgeInsets.only(top: 20, bottom: 30),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E201E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 49, vertical: 12),
                          minimumSize: const Size(220, 0),
                        ),
                        child: const Text(
                          'Lưu khoản thu',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
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
}
