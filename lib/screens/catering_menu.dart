// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:food_catering_service_app/components/cusom_colours.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
//
// import '../models/product_model.dart';
// import '../providers/cart_model_provider.dart';
// import '../providers/product_provider.dart';
// import '../providers/snacks_provider.dart';
// import 'description_screen.dart';
//
// class FoodItem {
//   final String image;
//   final String title;
//   final double rating;
//   final int calories;
//
//   FoodItem({
//     required this.image,
//     required this.title,
//     required this.rating,
//     required this.calories,
//   });
// }
//
// class CateringMenuScreen extends StatelessWidget {
//   CateringMenuScreen({super.key});
//
//   final List<FoodItem> foodItems = [
//     FoodItem(
//       image: 'assets/img-2.png',
//       title: 'Bhuna Khichuri and Thai Chicken',
//       rating: 4.8,
//       calories: 150,
//     ),
//     FoodItem(
//       image: 'assets/img-3.png',
//       title: 'Mexican Vegetables and Salad',
//       rating: 4.3,
//       calories: 168,
//     ),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);
//     return Scaffold(
//         appBar: AppBar(
//           leading: GestureDetector(
//             onTap: (){
//               Navigator.pop(context);
//             },
//               child: const Icon(Icons.arrow_back)),
//           title: Text(
//             'Catering Menu',
//             style: GoogleFonts.inter(
//               fontSize: 22,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//           centerTitle: true,
//         ),
//         body: SingleChildScrollView(
//             child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: 17.w, vertical: 10.h),
//           child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 // Title
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Choose a Dish',
//                       style: GoogleFonts.inter(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 22.sp,
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 80,
//                     ),
//                     Text(
//                       "Filter",
//                       style: GoogleFonts.inter(
//                         fontWeight: FontWeight.w400,
//                         fontSize: 12.sp,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 6.h,
//                     ),
//                     Image.asset(
//                       'assets/Rectangle.png',
//                       width: 20,
//                       height: 20,
//                     )
//                   ],
//                 ),
//                 // Category Chips
//                 const Row(
//                   children: [
//                     CateringContainer(text: 'All', height: 50, width: 50),
//                     SizedBox(
//                       width: 14,
//                     ),
//                     CateringContainer(
//                       text: 'Regular food',
//                       height: 50,
//                       width: 100,
//                     ),
//                     SizedBox(
//                       width: 14,
//                     ),
//                     CateringContainer(
//                         text: 'Sea food', height: 50, width: 90),
//                     SizedBox(
//                       width: 14,
//                     ),
//                     CateringContainer(
//                         text: 'Salad', height: 50, width: 80)
//                   ],
//                 ),
//                 SizedBox(height: 16.h),
//                 // Popular Section
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       'Popular',
//                       style: TextStyle(
//                         fontSize: 18.sp,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         // Handle "See All"
//                       },
//                       child: const Text(
//                         'See all',
//                         style: TextStyle(color: Color(0xff888888)),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(
//                   height: 15,
//                 ),
//                 GridView.builder(
//                   physics: const NeverScrollableScrollPhysics(),
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 2,
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 10,
//                     childAspectRatio: 0.50,
//                   ),
//                   itemCount: productProvider.product.length,
//                   itemBuilder: (context, index) {
//                     final product = productProvider.product[index];
//                     return _buildFoodCard(
//                         index: index,
//                         productProvider: product,
//                         context: context);
//                   },
//                 ),
//
//               ]),
//         )));
//   }
// }
//
// Widget _buildFoodCard({
//   required int index,
//   required ProductProvider productProvider,
//   required BuildContext context,
// }) {
//   return GestureDetector(
//     onTap: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) =>  DescriptionScreen(product: prod,)),
//       );
//     },
//     child: ClipRRect(
//       borderRadius: BorderRadius.circular(15),
//       child: Container(
//         color: Colors.white,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 130.h,
//               width: double.infinity,
//               child: Image.asset(productProvider.),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     productProvider.,
//                     style: TextStyle(
//                       fontSize: 14.sp,
//                       fontWeight: FontWeight.w600,
//                     ),
//                     maxLines: 1,
//                   ),
//                   const SizedBox(height: 4),
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.star,
//                         color: Colors.amber,
//                         size: 16.sp,
//                       ),
//                       Text(
//                         productProvider.toString(),
//                         style: TextStyle(fontSize: 12.sp),
//                       ),
//                       const SizedBox(
//                         width: 40,
//                       ),
//                       Row(
//                         children: [
//                           Icon(
//                             Icons.local_fire_department,
//                             color: Colors.redAccent,
//                             size: 16.sp,
//                           ),
//                           Text(
//                             productProvider.toString(),
//                             style: TextStyle(fontSize: 12.sp),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   // Add button
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
//
// class CateringContainer extends StatelessWidget {
//   final String text;
//   final double height;
//   final double width;
//
//   const CateringContainer({
//     super.key,
//     required this.text,
//     required this.height,
//     required this.width,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color: AppColors.customWhite,
//       ),
//       height: height,
//       width: width,
//       child: Center(
//           child: Text(
//         text,
//         style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
//       )),
//     );
//   }
// }
