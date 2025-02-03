import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  final List<ChatModel> chats = [
    ChatModel("پرورشی ایران", "#قاب_ماندگار 📸 عکس یادگاری", "۱۷:۱۰", "۱۱۹",
        "assets/lambo.jpg"),
    ChatModel("شبکه آموزشی دانش‌آموز (شاد)", "برنامه حضرت ابوالفضل العباس سلام", "۱۵:۱۵", "۴۴",
        "assets/Profile.webp"),
    ChatModel("نوجوان", "#قاب_ماندگار 📸 عکس یادگاری", "۱۳:۴۳", "۱۵۶",
        "assets/DODGE.jpg"),
    ChatModel("آهوتما", "امام حسین (ع) فرمودند: سخن نقره‌ست", "۱۲:۳۰", "۲۵",
        "assets/Profile.webp"),
    ChatModel("مدرسه شاد - بازدهی‌ها", "پویش جهاد علمی البرز - فیزیک پایه", "۱۰:۲۹", "۳۸۱",
        "assets/lambo.jpg"),
    ChatModel("آهوتما", "امام حسین (ع) فرمودند: سخن نقره‌ست", "۱۲:۳۰", "۲۵",
        "assets/fordgt.jpg"),
    ChatModel("شبکه آموزشی دانش‌آموز (شاد)", "برنامه حضرت ابوالفضل العباس سلام", "۱۵:۱۵", "۴۴",
        "assets/Profile.webp"),
    ChatModel("مدرسه شاد - بازدهی‌ها", "پویش جهاد علمی البرز - فیزیک پایه", "۱۰:۲۹", "۳۸۱",
        "assets/rollsroys.jpg"),
    ChatModel("مدرسه شاد - بازدهی‌ها", "پویش جهاد علمی البرز - فیزیک پایه", "۱۰:۲۹", "۳۸۱",
        "assets/DODGE.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("پیام‌ها", style: TextStyle(fontSize: 18)),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child:  TextField(
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: "جستجو",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                ),
              ),

            ),
          ),


          Expanded(
            child: ListView.builder(
              itemCount: chats.length,
              itemBuilder: (context, index) {
                return ChatItem(chat: chats[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final ChatModel chat;
  ChatItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                chat.time,
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
              if (chat.unreadCount.isNotEmpty)
                Container(
                  margin: EdgeInsets.only(top: 5),
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    chat.unreadCount,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  chat.name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.right,
                ),
                SizedBox(height: 4),
                Text(
                  chat.lastMessage,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            backgroundImage: AssetImage(chat.imagePath),
            radius: 22,
          ),
        ],
      ),
    );
  }
}

class ChatModel {
  final String name;
  final String lastMessage;
  final String time;
  final String unreadCount;
  final String imagePath;

  ChatModel(this.name, this.lastMessage, this.time, this.unreadCount, this.imagePath);
}
