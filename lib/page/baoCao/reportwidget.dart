import 'package:flutter/material.dart';
<<<<<<< HEAD
=======
import '../../widgets/custom_app_bar.dart';
>>>>>>> c65fb6a (update feature)

class ReportWidget extends StatelessWidget {
  const ReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return const Center(
      child: Text(
        "Báo cáo",
      ),
    );
  }
}
=======
    return Scaffold(
      appBar: CustomAppBar(
        title: "Báo Cáo",
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
        showSearchIcon: true, // ✅ Hiển thị icon tìm kiếm
        // onSearchPressed: () {
        //   print("Đã nhấn tìm kiếm");
        // },
      ),
      body: const Center(
        child: Text(
          'Báo cáo',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
>>>>>>> c65fb6a (update feature)
