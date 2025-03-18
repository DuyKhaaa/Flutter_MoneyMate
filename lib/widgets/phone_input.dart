import 'package:flutter/material.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({Key? key}) : super(key: key);

  @override
  _PhoneInputState createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.07),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: const Color(0xFF1E201E),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/images/vietnam_flag.png',
                width: 32,
                height: 32,
                fit: BoxFit.contain,
              ),
              const SizedBox(width: 13),
              Row(
                children: [
                  const Text(
                    '+84',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  const SizedBox(width: 5),
                  Image.asset(
                    'assets/images/dropdown_icon.png',
                    width: 13,
                    height: 13,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              const SizedBox(width: 14),
              Container(
                width: 1,
                height: 35,
                color: const Color.fromRGBO(30, 32, 30, 0.1),
              ),
              const SizedBox(width: 14),
            ],
          ),
          Expanded(
            child: TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                fontFamily: 'Montserrat',
                color: Colors.black,
              ),
              decoration: const InputDecoration(
                hintText: '0123 456 789',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Montserrat',
                ),
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.black,
              size: 22,
            ),
            onPressed: () {
              _phoneController.clear();
            },
          ),
        ],
      ),
    );
  }
}