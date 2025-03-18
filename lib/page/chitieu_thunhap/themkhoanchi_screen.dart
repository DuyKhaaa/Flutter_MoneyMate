import 'package:flutter/material.dart';
import '../../widgets/category_item.dart';
import 'danhmucchi_screen.dart';
import 'themkhoanthu_screen.dart';

class ThemKhoanChi extends StatefulWidget {
  const ThemKhoanChi({Key? key}) : super(key: key);

  @override
  State<ThemKhoanChi> createState() => _ThemKhoanChiState();
}

class _ThemKhoanChiState extends State<ThemKhoanChi> {
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
                          Transform.translate(
                            offset:
                                const Offset(0, 0), // Dịch chuyển lên 10 pixel
                            child: Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              height: 285,
                              child: ListView(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: CategoryItem(
                                          imageUrl: 'assets/images/food.png',
                                          label: 'Ăn uống',
                                          isSelected:
                                              selectedCategoryIndex == 0,
                                          onTap: () {
                                            setState(() {
                                              selectedCategoryIndex = 0;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: CategoryItem(
                                          imageUrl: 'assets/images/quanao.png',
                                          label: 'Quần áo',
                                          isSelected:
                                              selectedCategoryIndex == 1,
                                          onTap: () {
                                            setState(() {
                                              selectedCategoryIndex = 1;
                                            });
                                          },
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      Expanded(
                                        child: CategoryItem(
                                          imageUrl: 'assets/images/mypham.png',
                                          label: 'Mỹ phẩm',
                                          isSelected:
                                              selectedCategoryIndex == 2,
                                          onTap: () {
                                            setState(() {
                                              selectedCategoryIndex = 2;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl: 'assets/images/yte.png',
                                            label: 'Y tế',
                                            isSelected:
                                                selectedCategoryIndex == 3,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex = 3;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl: 'assets/images/xemay.png',
                                            label: 'Đi lại',
                                            isSelected:
                                                selectedCategoryIndex == 4,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex = 4;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl: 'assets/images/nha.png',
                                            label: 'Tiền nhà',
                                            isSelected:
                                                selectedCategoryIndex == 5,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex = 5;
                                              });
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 5),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl: 'assets/images/bia.png',
                                            label: 'Xã stress',
                                            isSelected:
                                                selectedCategoryIndex == 6,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex = 6;
                                              });
                                            },
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl: 'assets/images/wifi.png',
                                            label: 'Cáp & wifi',
                                            isSelected:
                                                selectedCategoryIndex == 7,
                                            onTap: () {
                                              setState(() {
                                                selectedCategoryIndex = 7;
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
                                                        const DanhMucChi()),
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
                          'Lưu khoản chi',
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
