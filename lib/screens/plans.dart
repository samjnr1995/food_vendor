import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/screens/checkout.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/container.dart';
import '../components/custom_button.dart';
import '../components/labels.dart';

class PlansScreen extends StatelessWidget {
  const PlansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: Text(
            Labels.plans,
            style: GoogleFonts.inter(fontWeight: FontWeight.w500, fontSize: 22),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Labels.yourPlans,
                style: GoogleFonts.inter(
                    fontWeight: FontWeight.w500, fontSize: 22),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: const PlansContainer(),
              ),
              const SizedBox(
                height: 30,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: 140,
                  color: const Color(0xffFFFFFF),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            Labels.monthlyPlan,
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff323434),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            Labels.thirtyDays,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      // Price and Icon Column
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            Labels.linkImage,
                            color: Colors.black,
                            height: 40,
                            width: 40,
                          ),
                          Text(
                            Labels.perMonth,
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color(0xff323434),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            Labels.sixK,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xff323434),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Arrow Icon
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 180,
              ),
              Center(
                  child: CustomButton(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOutScreen()));
                },
                text: Labels.select,
                textColor: const Color(0xFFFFFFFF),
                color: const Color(0xFF9AD983),
                width: 600,
              )),
            ],
          ),
        ));
  }
}
