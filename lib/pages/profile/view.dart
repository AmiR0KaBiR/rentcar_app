import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lms_appf/generated/assets.dart';

import '../../core/const.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          SizedBox(
            height: AppSpacing.xxLarge,
          ),
          Text('پروفایل'),
          SizedBox(
            height: 20,
          ),

          Container(
            width: 70,
            height: 70,
            child: Icon(Icons.person,size: 40,),
            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(8),
              color: Colors.lime,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text('امیرجسین دانش پژوه'),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildClickableItem(
                      context,
                      'لایسنس',
                      Icons.credit_card,
                      () => _navigateTo(context, 'صفحه لایسنس'),
                    ),
                    _buildClickableItem(
                      context,
                      'پاسپورت',
                      Icons.paste_sharp,
                      () => _navigateTo(context, 'صفحه پاسپورت'),
                    ),
                    _buildClickableItem(
                      context,
                      'قرارداد',
                      Icons.description,
                      () => _navigateTo(context, 'صفحه قرارداد'),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.black),
                  title: Text('پروفایل من', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateTo(context, 'صفحه پروفایل'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.calendar_today, color: Colors.black),
                  title: Text('رزروهای من', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateTo(context, 'صفحه رزروهای من'),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.settings, color: Colors.black),
                  title: Text('تنظیمات', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateTo(context, 'صفحه تنظیمات'),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.black),
                  title: Text('درباره ما', style: TextStyle(fontSize: 16)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _navigateTo(context, 'درباره ما '),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget _buildClickableItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.lime, size: 30),
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  void _navigateTo(BuildContext context, String pageName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(pageName: pageName),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final String pageName;

  DetailPage({required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageName),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'این $pageName است',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
