import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/container.dart';
import 'package:food_catering_service_app/screens/description_text.dart';
import 'package:food_catering_service_app/styles.dart';
import '../components/labels.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({Key? key}) : super(key: key);

  @override
  DescriptionScreenState createState() => DescriptionScreenState();
}

class DescriptionScreenState extends State<DescriptionScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Image.asset(Labels.frame1),
          actions: [
            Image.asset(Labels.frame),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(Labels.img1),
                SizedBox(
                  height: 10.h,
                ),
                const PlusMinusContainer(),
                Text(Labels.bhuna,
                    style: AppTextStyles.headerStyle.copyWith(fontSize: 28)),
                const ContainerWidget(text: Labels.five,),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(height: 20.h),
                TabBar(
                  labelColor: const Color(0xff323434),
                  labelStyle: AppTextStyles.subTextStyle.copyWith(
                      color: const Color(0xff323434),
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                  indicatorColor: const Color(0xFF9AD983),
                  unselectedLabelColor: const Color(0xff323434),
                  indicatorWeight: 4.0,
                  controller: tabController,
                  tabs: const [
                    Tab(
                      text: Labels.description,
                    ),
                    Tab(
                      text: Labels.ingredients,
                    ),
                    Tab(
                      text: Labels.review,
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  width: 500.w,
                  child: TabBarView(controller: tabController, children: const [
                    DescriptionText(),
                    DescriptionText(),
                    DescriptionText()
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
