import 'package:flutter/material.dart';
<<<<<<< HEAD
import '../../widgets/category_item.dart';
import '../../widgets/thuchi_tab.dart';
import 'danhmucchi_screen.dart';
import 'danhmucthu_screen.dart';

class ThemKhoanThuChi extends StatefulWidget {
  const ThemKhoanThuChi({Key? key}) : super(key: key);

  @override
  State<ThemKhoanThuChi> createState() => _ThemKhoanThuChiState();
}

class _ThemKhoanThuChiState extends State<ThemKhoanThuChi> {
  int selectedCategoryIndex = 0; // Chỉ số của mục được chọn
  bool isChiTieuSelected = true; // Mặc định chọn Chi tiêu
=======
import 'package:flutter_moneymate_01/page/chitieu_thunhap/themkhoanchi_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/themkhoanthu_screen.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/thuchi_tab.dart';

class ThemKhoanThuChi extends StatefulWidget {
  @override
  _ThemKhoanThuChiState createState() => _ThemKhoanThuChiState();
}

class _ThemKhoanThuChiState extends State<ThemKhoanThuChi> {
  bool isChiTieuSelected = true; // Mặc định là Chi tiêu

  void _onToggle(int index) {
    setState(() {
      isChiTieuSelected = index == 0;
    });
  }
>>>>>>> c65fb6a (update feature)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: [
            // Header with expense/income toggle
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF1E201E),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                children: [
                  const SizedBox(width: 14),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Phần tử "Chi tiêu"
                        ThuchiTab(
                          label: 'Chi tiêu',
                          isSelected: isChiTieuSelected,
                          onTap: () {
                            setState(() {
                              isChiTieuSelected = true; // Chọn Chi tiêu
                            });
                          },
                        ),
                        const SizedBox(width: 6),
                        // Phần tử "Thu nhập"
                        ThuchiTab(
                          label: 'Thu nhập',
                          isSelected: !isChiTieuSelected,
                          onTap: () {
                            setState(() {
                              isChiTieuSelected = false; // Chọn Thu nhập
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
                          const SizedBox(width: 40),
                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0x331E201E),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Chọn ngày tháng năm',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
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
                          const SizedBox(width: 25),
                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0x331E201E),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nhập vào số tiền',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
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
                          const SizedBox(width: 17),
                          Container(
                            width: 1,
                            height: 40,
                            color: const Color(0x331E201E),
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nhập vào ghi chú',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  color: Color(0x331E201E),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Category selection
                    Container(
                      padding: const EdgeInsets.all(16),
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
                          // Phần tử "Chi tiêu" hoặc "Thu nhập" dựa trên biến isChiTieuSelected
                          Transform.translate(
                            offset: const Offset(0, 0),
                            child: Container(
                              padding: const EdgeInsets.only(top: 10.0),
                              height: 285,
                              child: ListView(
                                children: [
                                  if (isChiTieuSelected) ...[
                                    // Các mục cho Chi tiêu
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
                                            imageUrl:
                                                'assets/images/quanao.png',
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
                                            imageUrl:
                                                'assets/images/mypham.png',
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
                                              imageUrl:
                                                  'assets/images/xemay.png',
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
                                              imageUrl:
                                                  'assets/images/wifi.png',
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center, // Căn giữa nội dung
                                                  children: [
                                                    const Text(
                                                      'Chỉnh sửa',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            'Montserrat',
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
                                  ] else ...[
                                    // Các mục cho Thu nhập
                                    Row(
                                      children: [
                                        Expanded(
                                          child: CategoryItem(
                                            imageUrl:
                                                'assets/images/cate29.png',
                                            label: 'Tiền lương',
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
                                            imageUrl:
                                                'assets/images/cate33.png',
                                            label: 'Phụ cấp',
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
                                            imageUrl:
                                                'assets/images/cate31.png',
                                            label: 'Thu nhập thụ',
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
                                              imageUrl:
                                                  'assets/images/cate31.png',
                                              label: 'Thu nhập thụ',
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
                                              imageUrl:
                                                  'assets/images/cate30.png',
                                              label: 'Đầu tư',
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
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .center, // Căn giữa nội dung
                                                  children: [
                                                    const Text(
                                                      'Chỉnh sửa',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontFamily:
                                                            'Montserrat',
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
                              const SizedBox(width: 30),
                              Container(
                                width: 1,
                                height: 40,
                                color: const Color(0x331E201E),
                              ),
                              const SizedBox(width: 18),
                            ],
                          ),
                          Expanded(
                            child: TextField(
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Montserrat',
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Chọn ví tiền của bạn',
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
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

                    // Save button for Chi tiêu
                    if (isChiTieuSelected) ...[
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            // Logic to save expense
                          },
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
                    // Save button for Thu nhập
                    if (!isChiTieuSelected) ...[
                      Container(
                        margin: const EdgeInsets.only(top: 20, bottom: 30),
                        child: ElevatedButton(
                          onPressed: () {
                            // Logic to save income
                          },
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
=======
      appBar: CustomAppBar(
        title: "Thêm khoản thu chi",
        showToggleButtons: true,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
        selectedIndex: isChiTieuSelected ? 0 : 1,
        onToggle: _onToggle, // Chuyển tab khi nhấn trên AppBar
      ),
      body: Column(
        children: [
          // Thanh chọn tab
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     ThuchiTab(
          //       label: 'Chi tiêu',
          //       isSelected: isChiTieuSelected,
          //       onTap: () {
          //         setState(() {
          //           isChiTieuSelected = true;
          //         });
          //       },
          //     ),
          //     const SizedBox(width: 6),
          //     ThuchiTab(
          //       label: 'Thu nhập',
          //       isSelected: !isChiTieuSelected,
          //       onTap: () {
          //         setState(() {
          //           isChiTieuSelected = false;
          //         });
          //       },
          //     ),
          //   ],
          // ),
          Expanded(
            child: isChiTieuSelected ? ThemKhoanChi() : ThemKhoanThu(),
          ),
        ],
      ),
    );
  }
}
>>>>>>> c65fb6a (update feature)
