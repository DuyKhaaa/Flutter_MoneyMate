import 'package:flutter/material.dart';
import '../../../widgets/cateitem/category_item.dart';
import '../../../widgets/input/money_input.dart';
import 'danhmucchi_screen.dart';
import '../thunhap/themkhoanthu_screen.dart';
import '../../mainpage.dart';
import 'package:intl/intl.dart'; // Thư viện format ngày tháng
import 'package:flutter/services.dart';

class ThemKhoanChi extends StatefulWidget {
  const ThemKhoanChi({Key? key}) : super(key: key);

  @override
  State<ThemKhoanChi> createState() => _ThemKhoanChiState();
}

class _ThemKhoanChiState extends State<ThemKhoanChi> {
  int selectedCategoryIndex = 0; // Chỉ số của mục được chọn
  String _selectedWallet = 'Chọn ví tiền của bạn'; // Giá trị mặc định

  DateTime? selectedDate; // Biến lưu ngày đã chọn
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy'); // Định dạng ngày

  Future<void> _selectDate(BuildContext context) async {
    DateTime now = DateTime.now(); // Lấy ngày hiện tại của hệ thống
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? now,
      firstDate: DateTime(now.year - 5, now.month, now.day),
      lastDate: DateTime(now.year + 10, now.month, now.day),
      locale: const Locale('vi', 'VN'), // 🇻🇳 Chỉnh DatePicker sang tiếng Việt
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  

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
                      constraints: BoxConstraints(
                        minHeight:
                            78, // Đảm bảo chiều cao tối thiểu không thay đổi
                      ),
                      child: GestureDetector(
                        onTap: () =>
                            _selectDate(context), // Khi ấn vào sẽ mở DatePicker
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
                                width:
                                    40), // Khoảng cách giữa Text và đường gạch
                            Container(
                              width: 1, // Độ rộng của đường gạch
                              height: 40, // Chiều cao của đường gạch
                              color: const Color(0x331E201E),
                            ),
                            const SizedBox(
                                width:
                                    18), // Khoảng cách giữa đường gạch và text
                            Expanded(
                              child: Text(
                                selectedDate == null
                                    ? 'Chọn ngày tháng năm' // Hiển thị hint ban đầu
                                    : dateFormat.format(
                                        selectedDate!), // Hiển thị ngày đã chọn
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Montserrat',
                                  color: selectedDate == null
                                      ? const Color(0x331E201E) // Màu hintText
                                      : Colors
                                          .black, // Màu chữ khi đã chọn ngày
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
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                MoneyInputFormatter(), // Sử dụng MoneyInputFormatter để định dạng
                              ],
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
                          // Container chứa danh sách các mục với Transform
                          Transform.translate(
                            offset: const Offset(0, 0), // Dịch chuyển lên 10 pixel
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
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      Mainpage(
                                                          selectedIndex: 10),
                                                ),
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
                                width: 1,
                                height: 40,
                                color: const Color(0x331E201E),
                              ),
                              const SizedBox(
                                  width:
                                      18), // Khoảng cách giữa đường gạch và TextField
                            ],
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () async {
                                String? selectedWallet =
                                    await showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Dialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            20), // Bo góc mềm mại hơn
                                      ),
                                      backgroundColor:
                                          Colors.white, // Màu nền của Dialog
                                      child: Container(
                                        padding: const EdgeInsets.all(20),
                                        width:
                                            320, // Điều chỉnh chiều rộng của Dialog
                                        height:
                                            200, // Điều chỉnh chiều cao của Dialog
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(
                                              20), // Tạo bo góc mềm mại cho Container
                                          boxShadow: const [
                                            BoxShadow(
                                              color: Color(
                                                  0x10000000), // Màu bóng của Dialog
                                              blurRadius: 10, // Độ mờ của bóng
                                              spreadRadius:
                                                  5, // Độ lan tỏa của bóng
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: const Text(
                                                "Chọn ví tiền",
                                                style: TextStyle(
                                                  fontSize:
                                                      20, // Cỡ chữ tiêu đề lớn hơn
                                                  fontWeight: FontWeight
                                                      .bold, // Chữ đậm
                                                  color: Color(
                                                      0xFF3E4A59), // Màu chữ tối cho tiêu đề
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 15),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/cate30.png', // Icon cho ví chính
                                                width: 30,
                                                height: 30,
                                              ),
                                              title: const Text("Tiền mặt"),
                                              trailing:
                                                  _selectedWallet == "Tiền mặt"
                                                      ? const Icon(Icons.check,
                                                          color: Colors.green)
                                                      : null,
                                              onTap: () => Navigator.pop(
                                                  context, "Tiền mặt"),
                                            ),
                                            ListTile(
                                              leading: Image.asset(
                                                'assets/images/cate29.png', // Icon cho ví chính
                                                width: 30,
                                                height: 30,
                                              ),
                                              title: const Text("Chuyển khoản"),
                                              trailing: _selectedWallet ==
                                                      "Chuyển khoản"
                                                  ? const Icon(Icons.check,
                                                      color: Colors.green)
                                                  : null,
                                              onTap: () => Navigator.pop(
                                                  context, "Chuyển khoản"),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );

                                if (selectedWallet != null) {
                                  setState(() {
                                    _selectedWallet = selectedWallet;
                                  });
                                }
                              },
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  _selectedWallet.isEmpty
                                      ? "Chọn ví tiền của bạn"
                                      : _selectedWallet,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Montserrat',
                                    color: _selectedWallet.isEmpty
                                        ? Color(0x331E201E)
                                        : Colors.black,
                                  ),
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
