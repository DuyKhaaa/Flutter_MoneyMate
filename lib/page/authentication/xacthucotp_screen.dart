import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dangkyfinal_screen.dart';
import '../../widgets/otp_input.dart';

class XacThucOTP extends StatefulWidget {
  const XacThucOTP({Key? key}) : super(key: key);

  @override
  State<XacThucOTP> createState() => _XacThucOTPState();
}

class _XacThucOTPState extends State<XacThucOTP> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(
      text: ['3', '0', '0', '6'][index],
    ),
  );

  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    final otp = _otpControllers.map((controller) => controller.text).join();
    print('Verifying OTP: $otp');
  }

  void _resendOtp() {
    print('Resending OTP code');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFECDFCC),
      body: SafeArea(
        child: SingleChildScrollView(
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
                // padding: const EdgeInsets.only(top: 30),
                padding: const EdgeInsets.only(top: 20),
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
                // padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 160.0),
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 140.0),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/lock.png',
                      width: 82,
                      height: 82,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text(
                        'Nhập mã OTP',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 14.0),
                      child: Text(
                        'Vui lòng nhập mã OTP bao gồm 4 số vừa được gửi về số điện thoại +84',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(
                          4,
                          (index) => OtpInputField(
                            controller: _otpControllers[index],
                            focusNode: _focusNodes[index],
                            onChanged: (value) {
                              if (value.length == 1 && index < 3) {
                                _focusNodes[index + 1].requestFocus();
                              }
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 30.0), // Giữ khoảng cách trên
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigator.pushNamed(context, AppRoutes.registerFinal);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DangKyFinal(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1E201E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 62.0),
                        ),
                        child: const Text(
                          'Xác thực',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontFamily: 'Montserrat',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Montserrat',
                          ),
                          children: [
                            const TextSpan(text: 'Chưa nhận được mã? '),
                            WidgetSpan(
                              child: GestureDetector(
                                onTap: _resendOtp,
                                child: const Text(
                                  'Gửi lại',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
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
            ],
          ),
        ),
      ),
    );
  }
}
