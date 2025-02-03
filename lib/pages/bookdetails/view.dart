import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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
          int selectedDate = 21; // تاریخ پیش‌فرض
          String selectedTime = "07:00 AM"; // زمان پیش‌فرض

          return Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "انتخاب تاریخ",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("۲۱ شهریور", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    IconButton(
                      icon: const Icon(Icons.calendar_today, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                // انتخاب روز
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [19, 20, 21, 22, 23].map((day) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = day;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            color: selectedDate == day ? Colors.lightGreen : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              Text(
                                day.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: selectedDate == day ? Colors.white : Colors.black,
                                ),
                              ),
                              Text(
                                ["پنج‌شنبه", "جمعه", "شنبه", "یک‌شنبه", "دوشنبه"][day - 19],
                                style: TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  "انتخاب زمان",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                // انتخاب زمان
                Wrap(
                  spacing: 8,
                  children: ["07:00 AM", "09:00 AM", "11:00 AM", "12:00 PM"].map((time) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTime = time;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color: selectedTime == time ? Colors.lightGreen : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          time,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: selectedTime == time ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    showSmartDateTimePicker(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text("تایید", style: TextStyle(color: Colors.white, fontSize: 16))
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


void showSmartDateTimePicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          int selectedDate = 13;
          String selectedTime = "07:00 صبح";

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("انتخاب تاریخ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_forward, color: Colors.green),
                        onPressed: () {},
                      ),
                      const Text("اکتبر، 2021", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.green),
                        onPressed: () {},
                      ),
                    ],
                  ),
                  GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 7,
                      childAspectRatio: 1.5,
                    ),
                    itemCount: 30,
                    itemBuilder: (context, index) {
                      int day = index + 1;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedDate = day;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: selectedDate == day ? Colors.lightGreen : Colors.grey[200],
                            shape: BoxShape.circle,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            day.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: selectedDate == day ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  const Text("انتخاب زمان", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: ["07:00 صبح", "09:00 صبح", "11:00 صبح", "12:00 ظهر"].map((time) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedTime == time ? Colors.lightGreen : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            time,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: selectedTime == time ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      showAddressPicker(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("تأیید", style: TextStyle(color: Colors.white, fontSize: 16)),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}

class SmartDateTimePickerButton extends StatelessWidget {
  const SmartDateTimePickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showSmartDateTimePicker(context);
        },
        child: const Text("انتخاب تاریخ و زمان"),
      ),
    );
  }
}


