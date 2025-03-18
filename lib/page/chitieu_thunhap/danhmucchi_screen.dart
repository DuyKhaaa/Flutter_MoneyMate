import 'package:flutter/material.dart';
import '../../widgets/category2_item.dart';
import 'themdanhmucthuchi_screen.dart';

class DanhMucChi extends StatefulWidget {
  const DanhMucChi({Key? key}) : super(key: key);

  @override
  State<DanhMucChi> createState() => _DanhMucChiState();
}

class _DanhMucChiState extends State<DanhMucChi> {
  // Biến để theo dõi trạng thái checkbox cho từng danh mục
  bool isAnUongChecked = false;
  bool isQuanAoChecked = false;
  bool isMyPhamChecked = false;
  bool isYTeChecked = true; // Mặc định là checked
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
          'Danh mục chi tiêu',
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
                      // Chuyển sang màn hình ThemDanhMucChi
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
                                  bool newValue = !(isAnUongChecked &&
                                      isQuanAoChecked &&
                                      isMyPhamChecked &&
                                      isYTeChecked &&
                                      isDiLaiChecked &&
                                      isTienNhaChecked &&
                                      isXaStressChecked &&
                                      isCapWifiChecked);
                                  isAnUongChecked = newValue;
                                  isQuanAoChecked = newValue;
                                  isMyPhamChecked = newValue;
                                  isYTeChecked = newValue;
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
                                child: (isAnUongChecked &&
                                        isQuanAoChecked &&
                                        isMyPhamChecked &&
                                        isYTeChecked &&
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
                        // Ăn uống
                        CategoryItem(
                          categoryKey: 'anUong',
                          title: 'Ăn uống',
                          iconUrl: 'assets/images/food.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isAnUongChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isAnUongChecked = value;
                            });
                          },
                        ),

                        // Quần áo
                        CategoryItem(
                          categoryKey: 'quanAo',
                          title: 'Quần áo',
                          iconUrl: 'assets/images/quanao.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isQuanAoChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isQuanAoChecked = value;
                            });
                          },
                        ),

                        // Mỹ phẩm
                        CategoryItem(
                          categoryKey: 'myPham',
                          title: 'Mỹ phẩm',
                          iconUrl: 'assets/images/mypham.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isMyPhamChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isMyPhamChecked = value;
                            });
                          },
                        ),

                        // Y tế
                        CategoryItem(
                          categoryKey: 'yTe',
                          title: 'Y tế',
                          iconUrl: 'assets/images/yte.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isYTeChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isYTeChecked = value;
                            });
                          },
                          hasCheckmark: true,
                        ),

                        // Đi lại
                        CategoryItem(
                          categoryKey: 'diLai',
                          title: 'Đi lại',
                          iconUrl: 'assets/images/xemay.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isDiLaiChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isDiLaiChecked = value;
                            });
                          },
                        ),

                        // Tiền nhà
                        CategoryItem(
                          categoryKey: 'tienNha',
                          title: 'Tiền nhà',
                          iconUrl: 'assets/images/nha.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isTienNhaChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isTienNhaChecked = value;
                            });
                          },
                        ),

                        // Xã stress
                        CategoryItem(
                          categoryKey: 'xaStress',
                          title: 'Xã stress',
                          iconUrl: 'assets/images/bia.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: false,
                          isChecked: isXaStressChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isXaStressChecked = value;
                            });
                          },
                        ),

                        // Cáp & wifi
                        CategoryItem(
                          categoryKey: 'capWifi',
                          title: 'Cáp & wifi',
                          iconUrl: 'assets/images/wifi.png',
                          arrowUrl: 'assets/images/arrow2_icon.png',
                          isLastItem: true,
                          isChecked: isCapWifiChecked,
                          onCheckboxChanged: (value) {
                            setState(() {
                              isCapWifiChecked = value;
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