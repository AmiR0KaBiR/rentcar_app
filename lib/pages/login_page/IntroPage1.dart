import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lms_appf/core/bottomnavbar.dart';
import 'IntroPage2.dart';
import 'IntroPage3.dart';
import 'IntroPage4.dart';

class CarSelectionApp extends StatelessWidget {
  const CarSelectionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CarSelectionScreen(),
    );
  }
}

class CarBrand {
  final String name;
  final String imagePath;

  CarBrand({required this.name, required this.imagePath});
}

class CarSelectionScreen extends StatefulWidget {
  const CarSelectionScreen({super.key});

  @override
  _CarSelectionScreenState createState() => _CarSelectionScreenState();
}

class _CarSelectionScreenState extends State<CarSelectionScreen> {
  final List<CarBrand> carBrands = [
    CarBrand(name: 'تسلا', imagePath: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png'),
    CarBrand(name: 'مرسدس', imagePath: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png'),
    CarBrand(name: 'فراری', imagePath: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png'),
    CarBrand(name: 'بوگاتی', imagePath: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png'),
    CarBrand(name: 'بی‌ام‌و', imagePath: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png'),
    CarBrand(name: 'لامبورگینی', imagePath: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png'),
  ];

  final List<int> selectedIndices = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              height: 46,
              decoration: const BoxDecoration(
                color: Color(0xffCAE465),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: TextButton(
                onPressed: () => Get.to(MainPage()),
                child: const Text(
                  'Skip',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              'کدام برند خودرو را ترجیح می‌دهید؟',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 8),
            const Text(
              'با استفاده از ایمیل یا شبکه‌های اجتماعی وارد شوید',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: carBrands.length,
                itemBuilder: (context, index) {
                  final carBrand = carBrands[index];
                  final isSelected = selectedIndices.contains(index);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (isSelected) {
                          selectedIndices.remove(index);
                        } else {
                          selectedIndices.add(index);
                        }
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: isSelected
                            ? const Color(0xfffaffeb)
                            : const Color(0xfff3f3f3),
                        border: Border.all(
                          color: isSelected
                              ? const Color(0xffadc365)
                              : const Color(0xffd5d5d5),
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            carBrand.imagePath,
                            height: 50,
                            width: 50,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            carBrand.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: LoginButton(
                label: "اتمام",
                onPressed: () => Get.to(MainPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
