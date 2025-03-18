import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../../widgets/custom_app_bar.dart';


class CalendarWidget extends StatefulWidget {
  const CalendarWidget({Key? key}) : super(key: key);

  @override
  _CalendarWidgetState createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  // Dữ liệu thu nhập/chi tiêu
  Map<DateTime, List<String>> expenses = {
    DateTime(2025, 3, 1): ["-240,000"],
    DateTime(2025, 3, 3): ["+1,000,000"],
    DateTime(2025, 3, 8): ["-500,000"],
    DateTime(2025, 3, 12): ["+7,000,000", "-50,000"],
  };
  final List<Map<String, dynamic>> transactions = [
    {
      "date": DateTime(2025, 3, 1),
      "day": "Thứ 7",
      "icon": Icons.restaurant,
      "name": "Ăn uống",
      "amount": -240000,
    },
    {
      "date": DateTime(2025, 3, 3),
      "day": "Thứ 2",
      "icon": Icons.account_balance_wallet,
      "name": "Tiền lương",
      "amount": 1000000,
    },
    {
      "date": DateTime(2025, 3, 8),
      "day": "Thứ 7",
      "icon": Icons.brush,
      "name": "Mỹ phẩm",
      "amount": -500000,
    },
  ];
  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  void _changeMonth(int step) {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + step, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
        title: "Lịch",
        showToggleButtons: false,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
      ),
      backgroundColor: const Color(0xFFF5F5F5), // Đặt màu nền tối như ảnh
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Thanh chọn tháng
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: Icon(Icons.chevron_left, size: 30),
                      onPressed: () => _changeMonth(-1),
                    ),
                    Container(
                      width: 250,
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      child: Center(
                        // Căn giữa nội dung
                        child: Text(
                          DateFormat("MM/yyyy", 'vi_VN').format(_focusedDay),
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.chevron_right, size: 30),
                      onPressed: () => _changeMonth(1),
                    ),
                  ],
                ),
              ),

              // Lịch
              TableCalendar(
                locale: 'vi_VN',
                focusedDay: _focusedDay,
                firstDay: DateTime(2000),
                lastDay: DateTime(2050),
                headerVisible: false,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  // Cập nhật thanh tháng khi kéo lịch
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                daysOfWeekHeight: 30, // Chiều cao hàng tiêu đề ngày
                rowHeight: 60, // Tăng chiều cao ô ngày
                // Loại bỏ vòng tròn xanh ở ngày hiện tại
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(), // Xóa vòng tròn xanh
                  todayTextStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold, // In đậm ngày hiện tại
                    color: Colors.black, // Màu chữ đen bình thường
                  ),
                ),

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, date, focusedDay) {
                    DateTime normalizedDate =
                        DateTime(date.year, date.month, date.day);
                    List<String>? transactions = expenses[normalizedDate];

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Hiển thị số ngày
                        Text(
                          '${date.day}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: isSameDay(date, DateTime.now())
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                        // Nếu ngày có giao dịch, hiển thị chấm tròn
                        if (transactions != null && transactions.isNotEmpty)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (transactions
                                  .any((t) => t.startsWith('+'))) // Có thu nhập
                                Container(
                                  margin: EdgeInsets.only(top: 3, right: 2),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.green, // Xanh cho thu nhập
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              if (transactions
                                  .any((t) => t.startsWith('-'))) // Có chi tiêu
                                Container(
                                  margin: EdgeInsets.only(top: 3, left: 2),
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: Colors.red, // Đỏ cho chi tiêu
                                    shape: BoxShape.circle,
                                  ),
                                ),
                            ],
                          ),
                      ],
                    );
                  },
                ),
              ),

              // Thanh tổng thu nhập, chi tiêu
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildSummaryColumn(
                        "Thu nhập", "1,000,000 đ", Colors.green),
                    _buildSummaryColumn("Chi Tiêu", "740,000 đ", Colors.red),
                    _buildSummaryColumn("Tổng", "+360,000 đ", Colors.black),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 14.0, bottom: 28.0),
                child: Column(
                  children: [
                    // First transaction date
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF697565),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: const Text(
                        '01/03/2025 (Thứ 7)',
                        style: TextStyle(
                          //fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // First transaction
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/cate5.png',
                                width: 30,
                                height: 30,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                'Ăn uống',
                                style: TextStyle(
                                  //fontFamily: 'Montserrat',
                                  //fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '-240,000 đ',
                            style: TextStyle(
                              //fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFFFE0000),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Second transaction date
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF697565),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: const Text(
                        '03/03/2025 (Thứ 2)',
                        style: TextStyle(
                          //fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Second transaction
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 13),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/cate29.png',
                                width: 35,
                                height: 35,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 4),
                              const Text(
                                'Tiền lương',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  //fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '+1,000,000 đ',
                            style: TextStyle(
                              //fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Color(0xFF4ABD57),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Third transaction date
                    Container(
                      width: double.infinity,
                      color: const Color(0xFF697565),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: const Text(
                        '08/03/2025 (Thứ 7)',
                        style: TextStyle(
                          //fontFamily: 'Inter',
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),

                    // Third transaction
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                'assets/images/cate17.png',
                                width: 40,
                                height: 40,
                                fit: BoxFit.contain,
                              ),
                              const SizedBox(width: 5),
                              const Text(
                                'Mỹ phẩm',
                                style: TextStyle(
                                  //fontWeight: FontWeight.bold,
                                  //fontFamily: 'Montserrat',
                                  fontSize: 15,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            '-500,000 đ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              //fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Color(0xFFFE0000),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummaryColumn(String label, String amount, Color color) {
    return Column(
      children: [
        Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
        Text(amount,
            style: TextStyle(
                color: color, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
