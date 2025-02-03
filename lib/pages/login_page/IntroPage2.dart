import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lms_appf/pages/about/view.dart';
import 'package:lms_appf/pages/all%20cars%202/view.dart';
import 'package:lms_appf/pages/all%20cars/view.dart';

///0xffCAE465 sabz
///#CCCCC9 khakestari

class CarRentalHomePage extends StatefulWidget {
  const CarRentalHomePage({super.key});

  @override
  _CarRentalHomePageState createState() => _CarRentalHomePageState();
}

class _CarRentalHomePageState extends State<CarRentalHomePage> {
  final List<Car> cars = [
    Car(
      image: 'assets/porche.webp',
      name: 'Mercedes SLK Class',
      horsepower: '1100 hp',
      price: '\$85,000',
      rating: '5.0',
      transmissionType: 'Automatic',
    ),
    Car(
      image: 'assets/e40d7b71e1bed86b6f72ac1009b36ecb.webp',
      name: 'Porches Panemera',
      horsepower: '1600 hp',
      price: '\$90,000',
      rating: '4.8',
      transmissionType: 'Manual',
    ),
    Car(
      image: 'assets/486-4862054_looking-for-an-exotic-car-exotic-car-transparent.webp',
      name: 'BMW i8',
      horsepower: '1200 hp',
      price: '\$75,000',
      rating: '4.9',
      transmissionType: 'Manual',
    ),
  ];

  final List<String> trendingBrands = [
    'Tesla',
    'Mercedes',
    'Ferrari',
    'Bugatti',
    'BMW',
    'MVM'
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff1f1f1),
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ایران, تهران',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Icon(Icons.place_outlined),
          ],
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.grid_view_rounded, color: Color(0xffCAE465)),
          onPressed: () {},
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18),
            child: InkWell(
              onTap : () =>  Get.to(() =>  AboutUs(), transition: Transition.cupertino, duration: const Duration(milliseconds: 500)),
              child: Container(
                child: Icon(Icons.person),
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.lightGreenAccent,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const Text(
              'سلام امیر 👋',
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "بیا ماشین مورد علاقتو پیدا کنیم",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 32,
                      ),
                      hintText: 'Search',
                      hintStyle: const TextStyle(
                        color: Color(0xffbdbdbd),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                      fillColor: const Color(0xffe6e6e6),
                      filled: true,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Colors.green, Color(0xffCAE465)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.tune,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'کارهای ترند',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),

                TextButton(
                    onPressed: () => Get.to(AllCarsPage()) ,
                    child: const Text(
                      'دیدن همه',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: trendingBrands
                    .map((brand) => buildBrandIcon(brand))
                    .toList(),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'ماشین های محبوب',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'دیدن همه',
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
            ...cars.map((car) => buildCarCard(car)).toList(),
          ],
        ),
      ),
    );
  }

  Widget buildBrandIcon(String brand) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            width: 62,
            height: 62,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                brand[0],
                style:
                const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            brand,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget buildCarCard(Car car) {
    return InkWell(
      onTap: () =>    Get.to(() => const AllCarsPage(), transition: Transition.cupertino, duration: const Duration(milliseconds: 500)),
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  car.image,
                  width: 150,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    car.name,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 24),
                      Text(car.rating),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(color: Colors.grey),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.speed, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    car.horsepower,
                    style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.settings, size: 16, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    car.transmissionType,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    car.price,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Car {
  final String image;
  final String name;
  final String horsepower;
  final String price;
  final String rating;
  final String transmissionType;

  Car({
    required this.image,
    required this.name,
    required this.horsepower,
    required this.price,
    required this.rating,
    required this.transmissionType,
  });
}
