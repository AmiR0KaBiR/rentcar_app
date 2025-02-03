import 'package:flutter/material.dart';

void showAddressPicker(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (BuildContext context) {
      return StatefulBuilder(
        builder: (context, setState) {
          String selectedAddress = "خانه";

          List<Map<String, String>> addresses = [
            {"title": "خانه", "details": "خیابان پارکر ۴۱۴۰، آلنتاون، نیومکزیکو ۳۱۱۳۴"},
            {"title": "محل کار", "details": "خیابان پرستون ۸۵۰۲، اینگلوود، مین ۹۸۳۸۰"},
            {"title": "دفتر", "details": "خیابان الجین ۶۳۹۱، سلینا، دلاور ۱۰۲۹۹"},
          ];

          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("انتخاب آدرس", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "جستجو",
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: addresses.map((address) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedAddress = address["title"]!;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: selectedAddress == address["title"]! ? Colors.lightGreen : Colors.grey[200],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    address["title"]!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: selectedAddress == address["title"]! ? Colors.white : Colors.black,
                                    ),
                                  ),
                                  Text(
                                    address["details"]!,
                                    style: TextStyle(color: Colors.black54),
                                  ),
                                ],
                              ),
                              Icon(
                                selectedAddress == address["title"]! ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                                color: selectedAddress == address["title"]! ? Colors.white : Colors.black,
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("تایید آدرس", style: TextStyle(color: Colors.white, fontSize: 16)),
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

class AddressPickerButton extends StatelessWidget {
  const AddressPickerButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          showAddressPicker(context);
        },
        child: const Text("انتخاب آدرس"),
      ),
    );
  }
}
