// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_catering_service_app/components/cusom_colours.dart';
// import 'package:food_catering_service_app/components/reusable_container.dart';
// import 'package:food_catering_service_app/screens/catering_menu.dart';
// import 'package:food_catering_service_app/screens/myMealDeliveryScreen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../components/labels.dart';
//
// class MyMealScreen extends StatefulWidget {
//   const MyMealScreen({Key? key}) : super(key: key);
//
//   @override
//   MyMealScreenState createState() => MyMealScreenState();
// }
//
// class MyMealScreenState extends State<MyMealScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController tabController;
//
//   @override
//   void initState() {
//     super.initState();
//     tabController = TabController(length: 4, vsync: this);
//   }
//
//   @override
//   void dispose() {
//     tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     bool emailAccountActivity = false;
//     return SafeArea(
//       child: Scaffold(
//         bottomNavigationBar: ButtomNav(
//           ontap: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => CateringMenuScreen()));
//           },
//         ),
//         appBar: AppBar(
//           elevation: 0,
//           leading: const Icon(Icons.arrow_back),
//           title: Center(
//             child: Text(
//               Labels.myMeal,
//               style: GoogleFonts.inter(
//                 fontWeight: FontWeight.w500,
//                 fontSize: 22.sp,
//               ),
//             ),
//           ),
//           actions: [Container(width: 48.w)],
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(50.h),
//             child: SizedBox(
//               width: double.infinity,
//               child: TabBar(
//                 indicatorColor: AppColors.customGreen,
//                 labelColor: AppColors.customBlack,
//                 labelPadding: EdgeInsets.symmetric(horizontal: 4.0.w),
//                 dividerColor: AppColors.customGreen,
//                 //unselectedLabelColor: AppColors.customBlack,
//                 indicatorWeight: 4.0,
//                 controller: tabController,
//                 tabs: const [
//                   Tab(text: Labels.delivery),
//                   Tab(text: Labels.plans),
//                   Tab(text: Labels.favourite),
//                   Tab(text: Labels.cart),
//                 ],
//               ),
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(28.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   width: 800.w,
//                   child: TabBarView(
//                     controller: tabController,
//                     children: const [
//                       MyMealDelivery(),
//                       MyMealDelivery(),
//                       MyMealDelivery(),
//                       MyMealDelivery(),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
