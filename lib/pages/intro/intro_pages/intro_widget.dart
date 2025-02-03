import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../generated/assets.dart';

class IntroPage extends StatelessWidget {
  final int index;

  const IntroPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    late IntroParam introParam;
    switch (index) {
      case 0:
        {
          introParam = IntroParam(
              title: "Online Learning",
              image: Assets.assetsWallpapertest,
              subTitle: "We Provide Classes Online Classes and Pre Recorded Leactures.!");
          break;
        }

      case 1:
        {
          introParam = IntroParam(
              title: "Learn from Anytime",
              image: Assets.assetsCar2,
              subTitle: "Booked or Same the Lectures for Future");
          break;
        }

      case 2:
        {
          introParam = IntroParam(
              title: "Get Online Certificate",
              image: Assets.assetsCar3,
              subTitle: "Analyse your scores and Track your results");
          break;
        }

      default:
        {
          introParam = IntroParam(
              title: "title3",
              image: Assets.assetsCar1,
              subTitle: "subTitle3");
          break;
        }
    }

    return IntoWidget(
      param: introParam,
    );
  }
}

class IntoWidget extends StatelessWidget {
  final IntroParam param;

  const IntoWidget({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: SizedBox(
        width: Get.width / 2,
          child: Image.asset(
            param.image,
            fit: BoxFit.cover,
          )),
    );
  }
}

class IntroParam {
  String image;
  String title;
  String subTitle;

  IntroParam(
      {required this.title, required this.image, required this.subTitle});
}
class TitleWidget extends StatelessWidget {
  final IntroParam param;

  const TitleWidget({super.key, required this.param});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('data',style: TextStyle(color: Colors.white,fontSize: 40),),
        Text('data',style: TextStyle(color: Colors.white,fontSize: 40),),
      ],
      
    );
  }
}

class TitleParam {
  String title;
  String subTitle;

  TitleParam(
      {required this.title, required this.subTitle});
}
