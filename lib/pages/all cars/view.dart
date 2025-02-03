import 'package:flutter/material.dart';

class AllCarsPage extends StatelessWidget {
  const AllCarsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('تمام برندها', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'جستجو',
                  hintStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.search, color: Colors.black),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'تمام برندها',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  carBrandButton('مرسدس', '28 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('فراری', '12 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('لامبورگینی', '18 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('تسلا', '10 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),
                  SizedBox(height: 20), // فاصله بین دکمه‌ها
                  carBrandButton('بوگاتی', '7 ماشین موجود', 'assets/mercedes-benz-logo-png-2.webp'),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget carBrandButton(String brandName, String availability, String assetPath) {
    return ElevatedButton(
      onPressed: () {
        // Handle the button press action
      },
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black, backgroundColor: Colors.transparent, padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ), // Text and icon color
        elevation: 0, // Remove elevation for a flat appearance
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              assetPath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(brandName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              Text(availability, style: TextStyle(color: Colors.grey[600])),
            ],
          ),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios, color: Colors.black),
        ],
      ),
    );
  }
}
