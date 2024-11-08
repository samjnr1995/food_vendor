import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../screens/description_screen.dart';
import '../screens/home_screen.dart';
import '../screens/profile_screen.dart';
import 'labels.dart';
class ReusedContainer extends StatelessWidget {
  final String image;
  final Color color;
  const ReusedContainer({
    super.key,
    required this.image,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 90,
      decoration:
      BoxDecoration(color: color, borderRadius: BorderRadius.circular(15)),
      child: Center(
          child: Image.asset(
            image,
            height: 50,
            width: 50,
          )),
    );
  }
}
class ImageFlipContainer extends StatelessWidget {
  final String image;
  const ImageFlipContainer({
    super.key, required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 150.0,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0),
          ),
          child: Image.asset(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
class ButtomNav extends StatelessWidget {
  final Function() ontap;
  const ButtomNav({super.key, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return  BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
            label: '',
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Image.asset(
                Labels.frameThree,
                width: 50,
                height: 50,
              ),
            )),
        BottomNavigationBarItem(
            label: '',
            icon: GestureDetector(
              onTap: ontap,
              child: Image.asset(
                Labels.frameFour,
                width: 90,
                height: 90,
              ),
            )),
        BottomNavigationBarItem(
            label: '',
            icon: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfileScreen()));
              },
              child: Image.asset(
                Labels.frameFive,
                width: 50,
                height: 50,
              ),
            ))
      ],
    );
  }
}


class ClipWidget extends StatelessWidget {
  final String image;
  final double wid;
  final double hei;
  const ClipWidget({
    super.key,
    required this.image, required this.wid, required this.hei,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Image.asset(image, width: wid, height: hei));
  }
}
