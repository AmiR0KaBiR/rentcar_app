import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lms_appf/core/bottomnavbar.dart';
import 'package:lms_appf/pages/login_page/IntroPage2.dart';
import 'package:lms_appf/pages/login_page/IntroPage3.dart';
import 'package:get/get.dart';
import 'package:lms_appf/routes/routes.dart';

import '../all cars 2/view.dart';
import 'IntroPage1.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  "هموار",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                      color: Colors.lime),
                ),
              ),
              const SizedBox(height: 22),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "به هموار 👋 خوش آمدید ",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 26,
                        color: Colors.black),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                "با استفاده از ایمیل یا شبکه‌های اجتماعی وارد حساب خود شوید",
                style: TextStyle(color: Color(0xff9f9f9f)),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 30),
              const CustomTextField(
                hintText: 'آدرس ایمیل',
              ),
              const SizedBox(height: 24),
              const CustomTextField(
                hintText: 'رمز عبور',
                isPassword: true,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'فراموشی رمز عبور؟',
                      style: TextStyle(color: Color(0xffCAE465)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Center(
                child: LoginButton(
                  label: "ورود",
                  onPressed: () {},
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1.0,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "یا ورود با شبکه‌های اجتماعی",
                      style: TextStyle(color: Color(0xffCCCCC9)),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade400,
                      thickness: 1.0,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SocialButton(
                    icon: Icons.g_mobiledata,
                    color: Colors.red,
                    label: "گوگل",
                    onTap: () {},
                  ),
                  SocialButton(
                    icon: Icons.facebook,
                    color: Colors.blue,
                    label: "فیسبوک",
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "حساب کاربری ندارید؟ ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "ثبت‌نام",
                        style: const TextStyle(
                            color: Color(0xffCAE465),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()..onTap = () {},
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () => Get.to(CarSelectionApp()),
                  child: Text(
                    'رد شدن و ورود به صفحات اصلی',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.lime
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const LoginButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 50),
        backgroundColor: const Color(0xffCAE465),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.black, fontSize: 16),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String label;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.icon,
    required this.color,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(width: 6),
            Text(
              label,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isPassword && _obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffFAFAF7),
        hintText: widget.hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: Colors.grey.shade400,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(
            color: Colors.lightGreen,
            width: 1.5,
          ),
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
    );
  }
}
