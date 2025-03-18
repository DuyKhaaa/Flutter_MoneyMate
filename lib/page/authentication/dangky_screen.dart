import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dangnhap_screen.dart';
import 'xacthucotp_screen.dart';
import '../../widgets/phone_input.dart';
import '../../widgets/email_input.dart';
import '../../widgets/registration_tab.dart';

class DangKy extends StatefulWidget {
  const DangKy({Key? key}) : super(key: key);

  @override
  State<DangKy> createState() => _DangKyState();
}

class _DangKyState extends State<DangKy> {
  bool isPhoneSelected = true; // Mặc định chọn Số điện thoại

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFECDFCC),
      body: SafeArea(
        child: SingleChildScrollView(
          // constraints: const BoxConstraints(maxWidth: 360),
          child: Column(
            children: [
              Padding(
                padding:
                    // const EdgeInsets.only(left: 16.0, right: 16.0, top: 25.0),
                    const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        size: 26,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: const Text(
                          'Đăng ký',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.0,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(top: 30.0),
                padding: const EdgeInsets.only(top: 20.0),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      // width: 70,
                      // height: 70,
                      width: 60,
                      height: 60,
                    ),
                    const Text(
                      'MoneyMate',
                      style: TextStyle(
                        // fontSize: 25,
                        fontSize: 21,
                        fontWeight: FontWeight.w800,
                        letterSpacing: 2.52,
                        color: Color(0xFF1E201E),
                        fontFamily: 'Montserrat',
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                // margin: const EdgeInsets.only(top: 30.0),
                margin: const EdgeInsets.only(top: 20.0),
                // padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 178.0),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 160.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: RegistrationTab(
                            icon: isPhoneSelected
                                ? 'assets/images/verify_icon.png'
                                : 'assets/images/verify2_icon.png',
                            label: 'Số điện thoại',
                            isSelected: isPhoneSelected,
                            onTap: () {
                              setState(() {
                                isPhoneSelected = true;
                              });
                            },
                          ),
                        ),
                        const SizedBox(width: 17),
                        Expanded(
                          child: RegistrationTab(
                            icon: isPhoneSelected
                                ? 'assets/images/verify2_icon.png'
                                : 'assets/images/verify_icon.png',
                            label: 'Email',
                            isSelected: !isPhoneSelected,
                            onTap: () {
                              setState(() {
                                isPhoneSelected = false;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 45),
                    if (isPhoneSelected) ...[
                      const Text(
                        'Nhập số điện thoại',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 19),
                      const Text(
                        'Vui lòng nhập chính xác số điện thoại để nhận mã OTP và tiếp tục xác thực.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 30),
                      const PhoneInput(),
                      const SizedBox(height: 27),
                    ],
                    if (!isPhoneSelected) ...[
                      const Text(
                        'Nhập email',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 19),
                      const Text(
                        'Vui lòng nhập chính xác email để nhận mã OTP và tiếp tục xác thực.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                      const SizedBox(height: 30),
                      const EmailInput(),
                      const SizedBox(height: 27),
                    ],
                    ElevatedButton(
                      onPressed: () {
                        // Navigator.pushNamed(context, AppRoutes.otp);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const XacThucOTP(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF333333),
                        foregroundColor: Colors.white,
                        minimumSize: const Size(150, 0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 60,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: const Text(
                        'Gửi',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                        ),
                        children: [
                          const TextSpan(text: 'Đã có tài khoản? '),
                          TextSpan(
                            text: 'Đăng nhập',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                // Navigator.pushNamed(context, AppRoutes.login);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const DangNhap(),
                                  ),
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
