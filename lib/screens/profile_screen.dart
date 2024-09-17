import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/screens/catering_menu.dart';
import 'package:food_catering_service_app/screens/checkout.dart';
import 'package:food_catering_service_app/screens/plans.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/container.dart';
import '../components/custom_button.dart';
import '../components/labels.dart';
import '../components/my_widgets/custom_rich_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          Labels.profile,
          style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 22),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const ProfileContainer(),
              SizedBox(height: 25.h,),
               const ReusableRow(
                text: Labels.profileInfo,
              ),
              SizedBox(height: 25.h,),
              const ReusableRow(
                text: Labels.orderHistory,
              ),
              SizedBox(height: 25.h,),
              const ReusableRow(
                text: Labels.location,
              ),
              SizedBox(height: 25.h,),
               const ReusableRow(
                text: Labels.paymentMethod,
              ),
              SizedBox(height: 25.h,),
              const ReusableRow(
                text: Labels.gift,
              ),
              SizedBox(height: 25.h,),
              const ReusableRow(
                text: Labels.refer,
              ),
              SizedBox(height: 25.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    Labels.push,
                    style: GoogleFonts.inter(
                        fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                  Image.asset(Labels.noti)
                ],
              ),
              const SizedBox(height: 25,),
               const ReusableRow(
                text: Labels.contact,
              ),
              const SizedBox(height: 25,),
              const ReusableRow(
                text: Labels.logout,
              ),
              Center(
                  child: CustomButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>  CateringMenuScreen()));
                    },
                    text: Labels.checkOut,
                    textColor: const Color(0xFFFFFFFF),
                    color: const Color(0xFF9AD983),
                    width: 600,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}



