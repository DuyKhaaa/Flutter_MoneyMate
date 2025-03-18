import 'package:flutter/material.dart';
import '../../widgets/category2_item.dart';
import 'themdanhmucthuchi_screen.dart';

class DanhMucThu extends StatefulWidget {
  const DanhMucThu({Key? key}) : super(key: key);

  @override
  State<DanhMucThu> createState() => _DanhMucThuState();
}

class _DanhMucThuState extends State<DanhMucThu> {
  // Biến để theo dõi trạng thái checkbox cho từng danh mục
  bool isTienLuongChecked = false;
  bool isPhuCapChecked = false;
  bool isThuNhapPhuChecked = false;
  bool isTienThuongChecked = false;
  bool isDauTuChecked = true; 
  bool isDiLaiChecked = false; 
  bool isTienNhaChecked = false;
  bool isXaStressChecked = false;
  bool isCapWifiChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E201E),
        title: const Text(
          'Danh mục thu nhập',
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
      body: SafeArea(
        child: Center(
          child: Container(
            width: double.infinity,
            child: Column(
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                        width: 1,
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 22, vertical: 11),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/images/search_icon.png',
                          width: 28,
                          height: 28,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Tìm kiếm danh mục đã thêm',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Add Category Button
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                  child: GestureDetector(
                    onTap: () {
                      // Chuyển sang màn hình ThemDanhMuc
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ThemDanhMucThuChi()),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 17),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Thêm danh mục',
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
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
                  ),
                ),

                // Select All Option
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 19, vertical: 14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  // Toggle select all
                                  bool newValue = !(isTienLuongChecked &&
                                      isPhuCapChecked &&
                                      isThuNhapPhuChecked &&
                                      isTienThuongChecked &&
                                      isDauTuChecked &&
                                      isDiLaiChecked &&
                                      isTienNhaChecked &&
                                      isXaStressChecked &&
                                      isCapWifiChecked);
                                  isTienLuongChecked = newValue;
                                  isPhuCapChecked = newValue;
                                  isThuNhapPhuChecked = newValue;
                                  isTienThuongChecked = newValue;
                                  isDauTuChecked = newValue;
                                  isDiLaiChecked = newValue;
                                  isTienNhaChecked = newValue;
                                  isXaStressChecked = newValue;
                                  isCapWifiChecked = newValue;
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 1,
                                  ),
                                ),
                                child: (isTienLuongChecked &&
                                        isPhuCapChecked &&
                                        isThuNhapPhuChecked &&
                                        isTienThuongChecked &&
                                        isDauTuChecked &&
                                        isDiLaiChecked &&
                                        isTienNhaChecked &&
                                        isXaStressChecked &&
                                        isCapWifiChecked)
                                    ? const Icon(Icons.check, size: 16)
                                    : null,
                              ),
                            ),
                            const SizedBox(width: 13),
                            Text(
                              'Chọn',
                              style: const TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Image.asset(
                          'assets/images/delete_icon.png',
                          width: 27,
                          height: 27,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),

                // Category List
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color.fromRGBO(0, 0, 0, 0.1),
                        width: 1,
                      ),
                    ),
                    child: Column(
                      children: [
                        // Tiền lương
                        CategoryItem(
                          categoryKey: 'tienLuong',
                          title: 'Tiền lương',
                          iconUrl: 'assets/images/cate29.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isTienLuongChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isTienLuongChecked = value;
                            });
                          },
                        ),

                        // Phụ cấp
                        CategoryItem(
                          categoryKey: 'phuCap',
                          title: 'Phụ cấp',
                          iconUrl: 'assets/images/cate33.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isPhuCapChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isPhuCapChecked = value;
                            });
                          },
                        ),

                        // Thu nhập phụ
                        CategoryItem(
                          categoryKey: 'thuNhapPhu',
                          title: 'Thu nhập phụ',
                          iconUrl: 'assets/images/cate31.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isThuNhapPhuChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isThuNhapPhuChecked = value;
                            });
                          },
                        ),

                        // Tiền thưởng
                        CategoryItem(
                          categoryKey: 'tienThuong',
                          title: 'Tiền thưởng',
                          iconUrl: 'assets/images/cate32.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isTienThuongChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isTienThuongChecked = value;
                            });
                          },
                        ),

                        // Đầu tư
                        CategoryItem(
                          categoryKey: 'dauTu',
                          title: 'Đầu tư',
                          iconUrl: 'assets/images/cate30.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isDauTuChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isDauTuChecked = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}