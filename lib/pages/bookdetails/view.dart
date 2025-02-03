import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../search/view.dart';
import 'address.dart';

class CarDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('پورشه پانامرا', style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Image.asset(
                'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.png',
                height: 200,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                infoCard('قدرت موتور', '1600 اسب بخار', Icons.speed),
                infoCard('گیربکس', 'اتوماتیک', Icons.settings),
                infoCard('نوع سوخت', 'بنزینی', Icons.local_gas_station),
              ],
            ),
            SizedBox(height: 16),
            Text(
              'توضیحات',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 8),
            Text(
              'این خودرو دارای ویژگی‌های پیشرفته‌ای است که تجربه رانندگی لذت‌بخشی را برای شما فراهم می‌کند.',
              textAlign: TextAlign.right,
            ),
            SizedBox(height: 16),
            Text(
              'بهترین ویژگی‌ها',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.right,
            ),
            featureRow('اتصال بلوتوث', 'بله'),
            featureRow('کنترل خودکار دما', 'بله'),
            Spacer(),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$90,000',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
                ),
                ElevatedButton(
                  onPressed: ()  => showDateTimePicker(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    child: Text(
                      'رزرو کنید',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infoCard(String title, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, size: 30, color: Colors.grey),
        SizedBox(height: 4),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        SizedBox(height: 4),
        Text(value, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget featureRow(String feature, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(value, style: TextStyle(fontWeight: FontWeight.bold)),
          Text(feature, style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}


void showDateTimePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          DateTime selectedDate = DateTime.now();// تاریخ پیش‌فرض
          TimeOfDay selectedTime = TimeOfDay.now();

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // انتخاب تاریخ
                const Text(
                  "انتخاب تاریخ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${selectedDate.year}/${selectedDate.month}/${selectedDate.day}",
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(Icons.calendar_today, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // انتخاب زمان
                const Text(
                  "انتخاب زمان",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                GestureDetector(
                  onTap: () async {
                    TimeOfDay? pickedTime = await showTimePicker(
                      context: context,
                      initialTime: selectedTime,
                    );
                    if (pickedTime != null) {
                      setState(() {
                        selectedTime = pickedTime;
                      });
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          selectedTime.format(context),
                          style: const TextStyle(fontSize: 16),
                        ),
                        const Icon(Icons.access_time, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),


                ElevatedButton(
                  onPressed: () {
                    Get.to(() => const SearchPage(), transition: Transition.downToUp, duration: const Duration(milliseconds: 500));
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("تاریخ: ${selectedDate.year}/${selectedDate.month}/${selectedDate.day} - ساعت: ${selectedTime.format(context)}"),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(

                    backgroundColor: Colors.lightGreen,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(

                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("تایید", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),

              ],
            ),
          );
        },
      );
    },
  );
}


class DateTimePickerButton extends StatelessWidget {
  const DateTimePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showDateTimePicker(context);
        },
        child: const Text("انتخاب تاریخ و زمان"),
      ),
    );
  }
}




