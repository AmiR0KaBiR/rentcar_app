import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartBtn extends StatelessWidget {
  StartBtn({super.key});

  Offset myOffset = Offset(50, 100);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            // بخش سبز رنگ
            Container(
              width: 120,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.lime,
                borderRadius: BorderRadius.circular(25),
              ),
              alignment: Alignment.center,
              child: Text(
                'شروع کنید',
                style: TextStyle(),
              ),
            ),
            Positioned(
              right: 15,
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black26,
                    size: 16,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black54,
                    size: 16,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.black,
                    size: 16,
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
