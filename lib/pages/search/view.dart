import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../all cars 2/view.dart';
import '../all cars/view.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('مکان‌یابی'),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
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
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  categoryButton(Icons.local_cafe, 'کافی‌شاپ', '150 مکان', Colors.lightGreen, context),
                  const SizedBox(height: 8),
                  categoryButton(Icons.movie, 'سینما', '8 مکان', Colors.redAccent, context),
                  const SizedBox(height: 8),
                  // دکمه خانه
                  ElevatedButton(
                    onPressed: () {

                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.home, color: Colors.white),
                        SizedBox(width: 16),
                        Text(
                          'خانه',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Text(
                'مکان‌های موردعلاقه',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              favoriteLocation('خانه', 'شیلوه، خیابان ثورنریج 1901', '۵.۱ کیلومتر'),
              favoriteLocation('دفتر', 'دلاور، سلینا، خیابان الجین 6391', '۲.۵ کیلومتر'),
              favoriteLocation('مرکز یوگا', 'اینگلوود، خیابان پرستون 8502', '۱.۰ کیلومتر'),
            ]),
          ),
        ],
      ),
    );
  }

  Widget categoryButton(IconData icon, String title, String subtitle, Color color, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 3,
      ),
      onPressed: () {
        // عملکرد دکمه
      },
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget favoriteLocation(String title, String subtitle, String distance) {
    return ListTile(
      leading: const Icon(Icons.location_on_outlined, color: Colors.black),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
      trailing: Text(distance),
      onTap: () {
        if (title == 'مرکز یوگا') {
          // انتقال به صفحه AllCars2Page با ترنزیشن اسلاید
          Get.to(() => const AllCarsPage(), transition: Transition.rightToLeft, duration: const Duration(milliseconds: 500));
        } else {
          // عملکرد برای دیگر موارد
        }
      },
    );
  }
}
