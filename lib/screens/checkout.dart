import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/container.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/custom_field.dart';
import '../components/labels.dart';
import '../components/reusable_container.dart';

class CheckOutScreen extends StatelessWidget {
  const CheckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: Text(
            Labels.checkOut,
            style: GoogleFonts.inter(
              fontWeight: FontWeight.w500,
              fontSize: 22,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Labels.yourPlans,
                  style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500, fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: const PlansContainer(),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Labels.paymentMethod,
                  style: GoogleFonts.nunitoSans(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: AppColors.customBlack),
                ),
                const SizedBox(
                  height: 15,
                ),
                  const Row(
                  children: [
                    ReusedContainer(
                        image: Labels.png, color: AppColors.customGreen),
                    SizedBox(
                      width: 15,
                    ),
                    ReusedContainer(
                        image: Labels.pngImage,
                        color: AppColors.customWhite),
                    SizedBox(
                      width: 15,
                    ),
                    ReusedContainer(
                      image: Labels.checkImage,
                      color: AppColors.customWhite,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  Labels.cardNumber,
                  style: AppTextStyles.subTextStyle
                ),
                SizedBox(
                  height: 10.h,
                ),
                const CustomField(
                  hint: Labels.stars,
                  isMap: true,
                  type: TextInputType.emailAddress,
                ),
                Text(
                  Labels.name,
                  style: AppTextStyles.subTextStyle
                ),
                 const CustomField(
                  hint: Labels.hai,
                  type: TextInputType.text,
                  color: Color(0xFFA9A9A9),
                ),
                  const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(Labels.expiry),
                    SizedBox(
                      width: 120,
                    ),
                    Text(Labels.ccv),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const DateSectionCheckOut(),
                const LastContainerCheckout(),
              ],
            ),
          ),
        ));
  }
}

