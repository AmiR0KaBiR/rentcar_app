import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "سلام بر شما حضار و داوران گرامی\n\n"
                "این پروژه با دست‌اندکاری و همکاری امیرحسین دانش‌پژوه، ابوالفضل غفوریان و حسین کاظم‌زاده ساخته شده است "
                "و به امید خدا در مراحل بعد کامل خواهد شد.",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
