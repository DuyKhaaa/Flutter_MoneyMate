import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/widgets/notification_item.dart';
import '../../widgets/custom_app_bar.dart';


class ThongBao extends StatelessWidget {
  const ThongBao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: CustomAppBar(
        title: "Thông báo",
        showToggleButtons: false,
        showMenuButton: true, // Hiển thị nút menu (Drawer)
        onMenuPressed: () {
          Scaffold.of(context).openDrawer(); // Mở drawer từ MainPage
        },
      ),
      body: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),

            // Notification Items
            Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 30.0, 16.0, 0.0),
              child: Column(
                children: [
                  // First notification with top rounded corners
                  NotificationItem(
                    category: 'Tất cả',
                    timeAgo: '4 giờ trước',
                    message:
                        '🎉 🎉Nếu bạn là người dùng mới của MoneyMate, hãy xem qua cách sử dụng ứng dụng sao cho tối ưu nhất! 👉Xem ngay ',
                    isFirst: true,
                    isLast: false,
                  ),

                  // Second notification
                  NotificationItem(
                    category: 'Tất cả',
                    timeAgo: '4 giờ trước',
                    message:
                        '📊Báo cáo tài chính tháng này đã sẵn sàng! Xem ngay để biết bạn đã chi tiêu như thế nào và tìm cách tối ưu ngân sách. 👉Xem ngay ',
                    isFirst: false,
                    isLast: false,
                  ),

                  // Third notification
                  NotificationItem(
                    category: 'Tất cả',
                    timeAgo: '4 giờ trước',
                    message:
                        '🎯Đặt mục tiêu tài chính mới! Hãy thiết lập mục tiêu tiết kiệm để hướng tới một tương lai vững chắc. 🚀Bắt đầu ngay',
                    isFirst: false,
                    isLast: false,
                  ),

                  // Fourth notification with bottom rounded corners
                  NotificationItem(
                    category: 'Tất cả',
                    timeAgo: '4 giờ trước',
                    message:
                        '📆Tổng kết tuần: Bạn đã chi tiêu bao nhiêu? Hãy xem báo cáo chi tiết và điều chỉnh ngân sách nếu cần nhé! 🔍Xem báo cáo ',
                    isFirst: false,
                    isLast: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
