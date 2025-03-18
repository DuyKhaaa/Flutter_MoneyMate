import 'package:flutter/material.dart';
import '../../widgets/category3_item.dart'; // Đảm bảo rằng bạn đã import đúng widget CategoryItem

class ThemDanhMucThuChi extends StatefulWidget {
  const ThemDanhMucThuChi({Key? key}) : super(key: key);

  @override
  State<ThemDanhMucThuChi> createState() => _ThemDanhMucThuChiState();
}

class _ThemDanhMucThuChiState extends State<ThemDanhMucThuChi> {
  final TextEditingController _categoryNameController = TextEditingController();
  int? _selectedIconIndex;

  // List of icon category from cate1.png to cate56.png
  final List<String> _iconCate =
      List.generate(56, (index) => 'assets/images/cate${index + 1}.png');

  @override
  void dispose() {
    _categoryNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E201E),
        title: const Text(
          'Danh mục thu chi',
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 25.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Name Label
                  const Text(
                    "Tên danh mục",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 17,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Category Name Input
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: const Color(0x80000000),
                        width: 1,
                      ),
                    ),
                    child: TextField(
                      controller: _categoryNameController,
                      decoration: const InputDecoration(
                        hintText: "Nhập tên danh mục",
                        hintStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 17,
                          vertical: 18,
                        ),
                        border: InputBorder.none,
                      ),
                      style: const TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  // Icon Label
                  const Padding(
                    padding: EdgeInsets.only(top: 24.0),
                    child: Text(
                      "Biểu tượng",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  // Icon Grid
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        childAspectRatio: 1.08,
                      ),
                      itemCount: _iconCate.length,
                      itemBuilder: (context, index) {
                        return CategoryItem(
                          imageUrl:
                              _iconCate[index], // Sử dụng đường dẫn hình ảnh
                          isSelected: _selectedIconIndex ==
                              index, // Kiểm tra xem biểu tượng có được chọn không
                          onTap: () {
                            setState(() {
                              _selectedIconIndex =
                                  index; // Cập nhật chỉ số biểu tượng đã chọn
                            });
                          },
                        );
                      },
                    ),
                  ),

                  // Save Button
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E201E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          minimumSize: const Size(220, 0),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 70,
                            vertical: 12,
                          ),
                        ),
                        child: const Text(
                          "Lưu",
                          style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 17,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
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
    );
  }
}
