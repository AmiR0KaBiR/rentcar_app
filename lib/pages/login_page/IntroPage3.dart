import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lms_appf/pages/login_page/IntroPage4.dart';


class LoginPage2 extends StatelessWidget {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(height: 60),
              const Center(
                child: Text(
                  "هموار",
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 32,
                      color: Color(0xffCAE465)),
                ),
              ),
              const SizedBox(height: 22),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 60),
                  const Center(
                  ),
                  const SizedBox(height: 22),
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
              const CustomTextField(hintText: 'نام'),
              const SizedBox(height: 24),
              const CustomTextField(hintText: 'آدرس ایمیل'),
              const SizedBox(height: 24),
              const CustomTextField(hintText: 'رمز عبور', isPassword: true),
              const SizedBox(height: 24),
              const CustomTextField(hintText: 'تأیید رمز عبور', isPassword: true),
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
                  onPressed: () {

                  },
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: Colors.grey.shade400, thickness: 1.0),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "یا ادامه دهید با شبکه‌های اجتماعی",
                      style: TextStyle(color: Color(0xffCCCCC9)),
                    ),
                  ),
                  Expanded(
                    child: Divider(color: Colors.grey.shade400, thickness: 1.0),
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
                    text: "قبلاً حساب دارید؟ ",
                    style: const TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "ورود",
                        style: const TextStyle(
                            color: Color(0xffCAE465),
                            fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                           Get.to(() =>  LoginPage(), transition: Transition.cupertinoDialog, duration: const Duration(milliseconds: 500));


                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
