import 'package:flutter/material.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/themkhoanchi_screen.dart';
import 'package:flutter_moneymate_01/page/chitieu_thunhap/themkhoanthu_screen.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final bool showMenuButton;
  final bool showToggleButtons;
  final bool showSearchIcon;
  final int? selectedIndex;
  final VoidCallback? onMenuPressed;
  final ValueChanged<int>? onToggle;
  final VoidCallback? onSearchPressed;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.showBackButton = false,
    this.showMenuButton = false,
    this.showToggleButtons = false,
    this.showSearchIcon = false,
    this.selectedIndex,
    this.onMenuPressed,
    this.onToggle,
    this.onSearchPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF1E201E),
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            )
          : showMenuButton
              ? IconButton(
                  icon: const Icon(Icons.menu, color: Colors.white),
                  onPressed: onMenuPressed,
                )
              : null,
      title: showToggleButtons
          ? _buildToggleButtons(context)
          : Text(title, style: const TextStyle(color: Colors.white)),
      centerTitle: true,
      actions: [
        if (showSearchIcon)
          IconButton(
            icon: const Icon(Icons.search, color: Colors.white),
            onPressed: onSearchPressed,
          ),
      ],
    );
  }

  Widget _buildToggleButtons(BuildContext context) {
    return ToggleButtons(
      borderRadius: BorderRadius.circular(20),
      borderColor: Colors.white,
      selectedBorderColor: Colors.white,
      fillColor: Colors.white,
      color: Colors.white70,
      selectedColor: const Color(0xFF1E201E),
      constraints: const BoxConstraints(maxHeight: 40),
      isSelected: [selectedIndex == 0, selectedIndex == 1],
      onPressed: (index) {
        if (onToggle != null) {
          onToggle!(index); // Chuyển tab trong cùng màn hình
        }
      },
      children: [
        _buildToggleButton("Chi tiêu"),
        _buildToggleButton("Thu nhập"),
      ],
    );
  }

  Widget _buildToggleButton(String text) {
    return SizedBox(
      width: 95,
      child: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
