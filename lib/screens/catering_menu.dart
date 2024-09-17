import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/components/custom_button.dart';
import 'package:food_catering_service_app/components/my_widgets/custom_rich_text.dart';
import 'package:food_catering_service_app/screens/plans.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/labels.dart'; // For responsive UI if needed

class FoodItem {
  final String image;
  final String title;
  final double rating;
  final int calories;

  FoodItem({
    required this.image,
    required this.title,
    required this.rating,
    required this.calories,
  });
}

class CateringMenuScreen extends StatelessWidget {
  CateringMenuScreen({super.key});

  final List<FoodItem> foodItems = [
    FoodItem(
      image: 'assets/img-2.png',
      title: 'Bhuna Khichuri and Thai Chicken',
      rating: 4.8,
      calories: 150,
    ),
    FoodItem(
      image: 'assets/img-3.png',
      title: 'Mexican Vegetables and Salad',
      rating: 4.3,
      calories: 168,
    ),
    FoodItem(
      image: 'assets/img-5.png',
      title: 'Grilled Chicken with Rice',
      rating: 4.5,
      calories: 180,
    ),
    FoodItem(
      image: 'assets/img-1.png',
      title: 'Paneer Butter Masala',
      rating: 4.7,
      calories: 200,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: Text(
          'Catering Menu',
          style: GoogleFonts.inter(
            fontSize: 22,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Choose a Dish',
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontSize: 22.sp,
                    ),
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Text(
                    "Filter",
                    style: GoogleFonts.inter(
                      fontWeight: FontWeight.w400,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 6.h,
                  ),
                  Image.asset(
                    'assets/Rectangle.png',
                    width: 20,
                    height: 20,
                  )
                ],
              ),
            ),
            // Category Chips
            Wrap(
              spacing: 8.0,
              children: [
                _buildCategoryChip('All', false),
                _buildCategoryChip('Regular food', false),
                _buildCategoryChip('Sea food', false),
                _buildCategoryChip('Salad', false),
              ],
            ),
            SizedBox(height: 16.h),
            // Popular Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle "See All"
                  },
                  child: const Text(
                    'See all',
                    style: TextStyle(color: Color(0xff888888)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            // Grid of Food Cards
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.75,
              ),
              itemCount: foodItems.length,
              itemBuilder: (context, index) {
                final foodItem = foodItems[index];
                return _buildFoodCard(
                  index: index,
                  image: foodItem.image,
                  title: foodItem.title,
                  rating: foodItem.rating,
                  calories: foodItem.calories,
                );
              },
            ),
            Center(
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  PlansScreen()));
                  },
                  text: Labels.checkOut,
                  textColor: const Color(0xFFFFFFFF),
                  color: const Color(0xFF9AD983),
                  width: 600,
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String label, bool isSelected) {
    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      onSelected: (bool selected) {},
      backgroundColor: AppColors.customWhite,
      selectedColor: AppColors.customGreen,
    );
  }

  Widget _buildFoodCard({
    required int index,
    required String image,
    required String title,
    required double rating,
    required int calories,
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100.h,
              width: double.infinity,
              child: FittedBox(
                fit: BoxFit.cover,
                child: Image.asset(image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (index < 2) ...[
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 1,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16.sp,
                          ),
                          Text(
                            rating.toString(),
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_fire_department,
                                color: Colors.redAccent,
                                size: 16.sp,
                              ),
                              Text(
                                '$calories Kcal',
                                style: TextStyle(fontSize: 12.sp),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                    ],
                    // Add button
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.customGreen,
                            padding: const EdgeInsets.all(10),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
