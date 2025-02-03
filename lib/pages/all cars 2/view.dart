import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../bookdetails/view.dart';

class AllCars2Page extends StatefulWidget {
  const AllCars2Page({Key? key}) : super(key: key);

  @override
  State<AllCars2Page> createState() => _AllCars2PageState();
}

class _AllCars2PageState extends State<AllCars2Page> {
  // متغیرهای حالت
  String selectedSort = 'جدیدترین'; // گزینه پیش‌فرض
  double minPrice = 700;
  double maxPrice = 2000;
  List<String> selectedCarTypes = [];
  List<String> selectedFeatures = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('لیست خودروها', style: TextStyle(fontWeight: FontWeight.bold,fontFamily: AutofillHints.birthday)),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // بازگشت به صفحه قبلی
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // بخش جستجو
            TextField(
              decoration: InputDecoration(
                hintText: 'جستجو کنید',
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
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      showFilterBottomSheet(context);
                    },
                    icon: const Icon(Icons.filter_alt, color: Colors.white),
                    label: const Text(
                      'فیلترها',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  filterButton('پر بازدیدترین'),
                  filterButton('گران‌ترین'),
                  filterButton('ارزان‌ترین'),
                  filterButton('جدیدترین'),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // لیست ماشین‌ها
            Expanded(
              child: ListView(
                children: [
                  carCard(
                    'لامبورگینی هوراکان',
                    '1600 اسب بخار',
                    'اتوماتیک',
                    '۱,۱۰,۰۰۰\$',
                    'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.webp',
                    5.0,
                  ),
                  carCard(
                    'تسلا مدل X',
                    '1200 اسب بخار',
                    'اتوماتیک',
                    '۵۰,۰۰۰\$',
                    'assets/porche.webp',
                    4.9,
                  ),
                  carCard(
                    'مرسدس SLK کلاس',
                    '1100 اسب بخار',
                    'اتوماتیک',
                    '۸۵,۰۰۰\$',
                    'assets/e40d7b71e1bed86b6f72ac1009b36ecb.webp',
                    5.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // نمایش BottomSheet
  void showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'محدوده قیمت',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // محدوده قیمت
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${minPrice.toInt()}\$', style: const TextStyle(color: Colors.lightGreen, fontSize: 16)),
                      Text('${maxPrice.toInt()}\$', style: const TextStyle(color: Colors.lightGreen, fontSize: 16)),
                    ],
                  ),
                  RangeSlider(
                    values: RangeValues(minPrice, maxPrice),
                    min: 500,
                    max: 3000,
                    divisions: 25,
                    labels: RangeLabels('${minPrice.toInt()}\$', '${maxPrice.toInt()}\$'),
                    onChanged: (RangeValues values) {
                      setModalState(() {
                        minPrice = values.start;
                        maxPrice = values.end;
                      });
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'نوع خودرو',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      filterChip('اقتصادی', selectedCarTypes, setModalState),
                      filterChip('لوکس', selectedCarTypes, setModalState),
                      filterChip('سدان', selectedCarTypes, setModalState),
                      filterChip('هاچ‌بک', selectedCarTypes, setModalState),
                      filterChip('شاسی‌بلند', selectedCarTypes, setModalState),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'ویژگی‌های خودرو',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Wrap(
                    spacing: 8,
                    children: [
                      filterChip('تهویه هوا', selectedFeatures, setModalState),
                      filterChip('اتوماتیک', selectedFeatures, setModalState),
                      filterChip('دستی', selectedFeatures, setModalState),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context); // بستن BottomSheet
                        },
                        style: TextButton.styleFrom(backgroundColor: Colors.grey[200]),
                        child: const Text('لغو', style: TextStyle(color: Colors.black)),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context); // اعمال فیلترها
                          setState(() {});
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
                        child: const Text('اعمال', style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget filterButton(String title) {
    final isSelected = selectedSort == title;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            selectedSort = title; // به‌روزرسانی گزینه انتخاب شده
          });
        },
        style: TextButton.styleFrom(
          backgroundColor: isSelected ? Colors.lightGreen : Colors.grey[200],
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget filterChip(String label, List<String> selectedList, StateSetter setModalState) {
    final isSelected = selectedList.contains(label);
    return FilterChip(
      label: Text(label),
      onSelected: (bool value) {
        setModalState(() {
          if (value) {
            selectedList.add(label);
          } else {
            selectedList.remove(label);
          }
        });
      },
      selected: isSelected,
      selectedColor: Colors.lightGreen.withOpacity(0.3),
      backgroundColor: Colors.grey[200],
      labelStyle: const TextStyle(color: Colors.black),
    );
  }

  Widget carCard(String name, String power, String transmission, String price, String imagePath, double rating) {
    return InkWell(
      onTap: () =>    Get.to(() =>  CarDetailsPage(), transition: Transition.fadeIn, duration: const Duration(milliseconds: 500)),
      child: Card(
        
        margin: const EdgeInsets.only(bottom: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // تصویر ماشین
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            // توضیحات ماشین
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // نام ماشین
                  Text(
                    name,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  // مشخصات ماشین (قدرت و گیربکس)
                  Row(
                    children: [
                      const Icon(Icons.directions_car, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(power, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(width: 16),
                      const Icon(Icons.settings, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(transmission, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // قیمت و امتیاز ماشین
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        price,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: Colors.yellow, size: 16),
                          Text(rating.toString(), style: const TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
