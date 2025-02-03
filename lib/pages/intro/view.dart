import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



import '../login_page/IntroPage3.dart';


class PageViewExample extends StatefulWidget {
  @override
  _PageViewExampleState createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = [
    PageContent(
      title: "مقصد را تعیین کنید",
      description:
          "مقصد شما در دسترس شماست. برنامه را باز کنید و جایی را که می خواهید بروید وارد کنید",
      imagePath: "assets/wallpapertest.webp",
    ),
    PageContent(
      title: "مسیریابی ساده",
      description: "مسیرهای گام به گام را برای رسیدن به مقصد دریافت کنید.",
      imagePath: "assets/2024-Kia-EV9-004-2800p.webp",
    ),
    PageContent(
      title: "مسیرتان را انتخاب کنید",
      description: "تا در سریع ترین زمان شما را به مقصد برسانیم",
      imagePath: "assets/2025-Porsche-911-GT3-RS-with-Manthey-Kit-005-2800p.webp",
    ),
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _pages,
          ),
          Positioned(
            top: 180,
            left: 14,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: List.generate(
                    _pages.length,
                    (index) => AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: _currentPage == index ? 60 : 6,
                      height: _currentPage == index ? 6 : 6,
                      decoration: BoxDecoration(
                          color:
                              _currentPage == index ? Colors.lime : Colors.grey,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                CustomButton(
                  text:
                      _currentPage == _pages.length - 1 ? "شروع کنید" : "بعدی",
                  onPressed: () {
                   Get.to(() =>  LoginPage2(), transition: Transition.cupertino, duration: const Duration(milliseconds: 500));

                    if (_currentPage < _pages.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PageContent extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const PageContent({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            color: Colors.black.withOpacity(0.3),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 50),
              Text(
                title,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          width: 200,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        // بخش سبز رنگ
        Container(
          width: 120,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lime,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        Positioned(
          right: 15,
          child: Row(
            children: [
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black26,
                size: 16,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black54,
                size: 16,
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 16,
              ),
            ],
          ),
        ),
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(25),
              onTap: onPressed,
            ),
          ),
        ),
      ],
    );
  }
}
