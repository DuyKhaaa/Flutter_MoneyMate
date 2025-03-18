import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../widgets/custom_app_bar.dart';
import 'package:flutter_moneymate_01/page/dashboard/lichsughichep_screen.dart';
import 'package:flutter_moneymate_01/page/dashboard/lichsutheodanhmuc_screen.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({super.key});

  @override
  _DashboardWidgetState createState() => _DashboardWidgetState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DashboardWidgetState extends State<DashboardWidget> {
  bool _isBalanceVisible = true;

  final List<String> items = [
    'Tháng 1',
    'Tháng 2',
    'Tháng 3',
    'Tháng 4',
    'Tháng 5',
    'Tháng 6',
    'Tháng 7',
    'Tháng 8',
    'Tháng 9',
    'Tháng 10',
    'Tháng 11',
    'Tháng 12'
  ];
  String? selectedValue;

  @override
  void initState() {
    super.initState();
    int currentMonth = DateTime.now().month; // Lấy tháng hiện tại
    selectedValue = items[currentMonth - 1]; // Gán giá trị mặc định
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Trang chủ",
        showToggleButtons: false,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
      ),
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(bottom: 10.h),
                decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(color: Color(0xFF697565), width: 1)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tổng số dư",
                        style: TextStyle(
                            fontSize: 17,
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            _isBalanceVisible ? "7,500,000 đ" : "******",
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF697565)),
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                              _isBalanceVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 22),
                          onPressed: () {
                            setState(() {
                              _isBalanceVisible = !_isBalanceVisible;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tình hình thu chi",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2<String>(
                      isExpanded: true,
                      hint: Text(
                        'Chọn tháng',
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      items: items
                          .map(
                            (String item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: selectedValue == item
                                      ? Colors.blueAccent
                                      : Colors
                                          .black, // Đổi màu chữ khi được chọn
                                  fontWeight: selectedValue == item
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      value: selectedValue,
                      onChanged: (String? value) {
                        setState(() {
                          selectedValue = value;
                        });
                      },
                      buttonStyleData: ButtonStyleData(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        height: 40.h,
                        width: 130.w,
                      ),
                      menuItemStyleData: MenuItemStyleData(
                        height: 40.h,
                      ),
                      dropdownStyleData: DropdownStyleData(
                        maxHeight: 200.h, // Giới hạn chiều cao dropdown
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(10.r), // Bo tròn dropdown
                          // border: Border.all(
                          //   color: Colors.black, // Màu viền
                          //   width: 1.5, // Độ dày viền
                          // ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 5.r,
                              spreadRadius: 1.r,
                              offset: Offset(0, 3.h),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150.w,
                      height: 150.h,
                      child: PieChart(
                        PieChartData(
                          sections: [
                            PieChartSectionData(
                              value: 10,
                              title: "",
                              color: Colors.green,
                              radius: 50.r,
                            ),
                            PieChartSectionData(
                              value: 2.5,
                              title: "",
                              color: Colors.red,
                              radius: 50.r,
                            ),
                          ],
                          sectionsSpace: 2.w,
                          centerSpaceRadius: 30.r,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text("Thu nhập",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                            SizedBox(height: 5.h),
                            Text("10,000,000 đ",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Chi Tiêu",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                            SizedBox(height: 5.h),
                            Text("2,500,000 đ",
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                          ],
                        ),
                        Column(
                          children: [
                            Text("Tổng",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                            SizedBox(height: 5.h),
                            Text("+7,500,000 đ",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Montserrat',
                                )),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    // Clickable text to navigate to LichSuGhiChep
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LichSuGhiChep()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Lịch sử ghi chép",
                            style: TextStyle(
                              fontSize: 13,
                              fontFamily: 'Montserrat',
                            ),
                          ),
                          const SizedBox(
                              width: 5), // Giảm khoảng cách giữa chữ và icon
                          const Icon(Icons.chevron_right, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              // Danh mục thu chi
              Text("Danh mục thu chi",
                  style: TextStyle(
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold)),
              SizedBox(height: 10.h),

              ListView(
                shrinkWrap: true, // Đảm bảo list không chiếm toàn bộ chiều cao
                physics:
                    const NeverScrollableScrollPhysics(), // Tắt cuộn riêng lẻ
                children: [
                  ExpenseItem(
                    iconPath: "assets/images/food.png",
                    title: "Ăn uống",
                    amount: "-1,000,000 đ",
                    onTap: () {}, // Không có hành động nào cho mục này
                  ),
                  ExpenseItem(
                    iconPath: "assets/images/quanao.png",
                    title: "Quần áo",
                    amount: "-500,000 đ",
                    onTap: () {}, // Không có hành động nào cho mục này
                  ),
                  ExpenseItem(
                    iconPath: "assets/images/mypham.png",
                    title: "Mỹ phẩm",
                    amount: "-400,000 đ",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LichSuTheoDanhMuc()),
                      );
                    },
                  ),
                  ExpenseItem(
                    iconPath: "assets/images/yte.png",
                    title: "Y tế",
                    amount: "-100,000 đ",
                    onTap: () {}, // Không có hành động nào cho mục này
                  ),
                  ExpenseItem(
                    iconPath: "assets/images/xemay.png",
                    title: "Đi lại",
                    amount: "-500,000 đ",
                    onTap: () {}, // Không có hành động nào cho mục này
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpenseItem extends StatelessWidget {
  final IconData? icon; // Icon từ Flutter
  final String title;
  final String amount;
  final String? iconPath; // Đường dẫn ảnh từ assets
  final VoidCallback onTap; // Thêm một callback cho sự kiện click

  const ExpenseItem({
    Key? key,
    this.icon,
    required this.title,
    required this.amount,
    this.iconPath,
    required this.onTap, // Nhận callback
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Gọi callback khi nhấn
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: 5.h), // Điều chỉnh khoảng cách theo tỷ lệ
        padding: EdgeInsets.all(16.r), // Điều chỉnh padding theo tỷ lệ
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r), // Bo góc theo tỷ lệ
        ),
        child: Row(
          children: [
            // Nếu có iconPath -> dùng ảnh từ assets, nếu không -> dùng icon mặc định
            if (iconPath != null)
              Image.asset(iconPath!,
                  width: 30.w, height: 30.h) // Kích thước ảnh theo tỷ lệ
            else if (icon != null)
              Icon(icon,
                  size: 30.sp,
                  color: Colors.redAccent), // Kích thước icon theo tỷ lệ

            SizedBox(width: 10.w), // Điều chỉnh khoảng cách giữa các phần tử

            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                ), // Kích thước chữ theo tỷ lệ
              ),
            ),

            Text(
              amount,
              style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'Montserrat',
                  color: Colors.red), // Điều chỉnh fontSize
            ),
          ],
        ),
      ),
    );
  }
}
