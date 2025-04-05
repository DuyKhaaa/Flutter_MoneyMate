import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/page/menu/caidat_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/themkhoanthuchi_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/chitieu/danhmucchi_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/chitieu/themdanhmucchi_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/thunhap/danhmucthu_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/thunhap/themdanhmucthu_screen.dart';
import 'package:flutter_moneymate_01/page/baoCao/reportwidget.dart';
import 'package:flutter_moneymate_01/page/dashboard/dashboardwidget.dart';
import 'package:flutter_moneymate_01/page/dashboard/lichsughichep_screen.dart';
import 'package:flutter_moneymate_01/page/dashboard/lichsutheodanhmuc_screen.dart';
import 'package:flutter_moneymate_01/page/User/userwidget.dart';
import 'package:flutter_moneymate_01/page/Calendar/calendarwidget.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_moneymate_01/page/menu/thongbao_screen.dart';
import 'package:flutter_moneymate_01/page/menu/vitien_screen.dart';
import 'authentication/login/dangnhap_screen.dart';
import 'baoCao/timkiembaocao_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Mainpage extends StatefulWidget {
  //const Mainpage({Key? key}) : super(key: key);
  final int selectedIndex;
  const Mainpage({Key? key, this.selectedIndex = 0}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    DashboardWidget(),
    CalendarWidget(),
    ThemKhoanThuChi(),
    ReportWidget(),
    UserWidget(),
    ThongBao(), //5
    ViTien(), //6
    CaiDat(), //7
    LichSuGhiChep(), //8
    LichSuTheoDanhMuc(), //9
    DanhMucChi(), //10
    DanhMucThu(), //11
    ThemDanhMucChi(), //12
    TimKiemBaoCaoThuChi(), //13
    ThemDanhMucThu(), //14
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // Hàm lấy thông tin người dùng từ Firestore
  Future<Map<String, dynamic>?> _fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .where('email', isEqualTo: user.email)
          .get();
      if (userDoc.docs.isNotEmpty) {
        return userDoc.docs.first.data();
      }
    }
    return null;
  }

  // Hàm đăng xuất khỏi Firebase Authentication
  Future<void> _logout() async {
    try {
      await FirebaseAuth.instance.signOut(); // Đăng xuất khỏi Firebase
      print('Đã đăng xuất thành công');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DangNhap()),
      );
    } catch (e) {
      print('Lỗi khi đăng xuất: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Lỗi khi đăng xuất: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey, // Key để mở Drawer từ trang con
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // DrawerHeader với dữ liệu từ Firestore
            FutureBuilder<Map<String, dynamic>?>(
              future: _fetchUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  // Hiển thị loading khi đang tải dữ liệu
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFF1E201E)),
                    child: Center(
                        child: CircularProgressIndicator(color: Colors.white)),
                  );
                } else if (snapshot.hasError || !snapshot.hasData) {
                  // Hiển thị mặc định nếu có lỗi hoặc không có dữ liệu
                  return DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFF1E201E)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor:
                              Colors.white, // Hình tròn trắng nếu lỗi
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Không xác định',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          'Không có email',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                } else {
                  // Dữ liệu từ Firestore
                  var userData = snapshot.data!;
                  String image = userData['image'] ?? '';
                  String username = userData['username'] ?? 'Không xác định';
                  String email = userData['email'] ?? 'Không có email';

                  return DrawerHeader(
                    decoration: BoxDecoration(color: Color(0xFF1E201E)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundColor: image.isEmpty
                              ? Colors.white
                              : null, // Hình tròn trắng nếu image null
                          backgroundImage: image.isNotEmpty
                              ? (image.startsWith('assets/')
                                  ? AssetImage(image)
                                  : NetworkImage(image)) as ImageProvider
                              : null,
                        ),
                        SizedBox(height: 8),
                        Text(
                          username,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          email,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            // Các mục menu trong Drawer
            ListTile(
              leading: const Icon(Icons.notifications_on_outlined),
              title: const Text('Thông báo'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 5;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_wallet_outlined),
              title: const Text('Ví của tôi'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 6;
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings_suggest_outlined),
              title: const Text('Cài đặt'),
              onTap: () {
                Navigator.pop(context);
                setState(() {
                  _selectedIndex = 7;
                });
              },
            ),
            const Divider(color: Colors.black),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('Đăng xuất'),
              onTap: _logout, // Gọi hàm đăng xuất
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: const Color(0xFF1E201E),
        activeColor: Colors.white,
        color: Colors.white70,
        style: TabStyle.fixedCircle,
        height: 55,
        curveSize: 80,
        top: -20,
        items: [
          TabItem(icon: Icons.home, title: 'Trang chủ'),
          TabItem(icon: Icons.calendar_month_outlined, title: 'Lịch'),
          TabItem(icon: Icons.add),
          TabItem(icon: Icons.pie_chart_rounded, title: 'Báo cáo'),
          TabItem(icon: Icons.people, title: 'Tài khoản'),
        ],
        onTap: (index) {
          setState(() {
            if (index < 5) {
              _selectedIndex = index;
            }
          });
        },
      ),
    );
  }
}
