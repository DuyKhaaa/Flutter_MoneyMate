import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/page/mainpage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../page/splash_screen.dart';
import 'package:flutter_moneymate_01/page/baoCao/timkiembaocao_screen.dart';
<<<<<<< HEAD
=======
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
>>>>>>> c65fb6a (update feature)

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
<<<<<<< HEAD
=======
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting(
      'vi_VN', null); // 🇻🇳 Khởi tạo ngôn ngữ tiếng Việt
  Intl.defaultLocale = 'vi_VN'; // Đặt mặc định là tiếng Việt
>>>>>>> c65fb6a (update feature)
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 754), // Kích thước thiết kế gốc
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: 'Montserrat', // Áp dụng font Montserrat cho toàn bộ app
          ),
<<<<<<< HEAD
          home: const Mainpage(),
          // home: SplashScreen(),
=======
          //home: const Mainpage(),
          home: SplashScreen(),
>>>>>>> c65fb6a (update feature)
          // home: TimKiemBaoCaoThuChi(),
        );
      },
    );
  }
}
