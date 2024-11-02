import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/models/product_model.dart';
import 'package:food_catering_service_app/screens/description_screen.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/container.dart';
import '../components/labels.dart';
import '../components/my_widgets/custom_rich_text.dart';
import '../providers/product_provider.dart';
import 'food_Screens/breakfast_details_screen.dart';
import 'food_Screens/dinner_details_screen.dart';
import 'food_Screens/lunch_details_screen.dart';
import 'food_Screens/snacks_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late String formattedDate;
  late String dayOfWeek;
  int _selectedDateIndex = 0;
  final bool _selectedSnacksIndex = false;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
  }

  void _updateDateTime() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('EEE, dd MMM').format(now);
    dayOfWeek = DateFormat('EEEE').format(now);
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeScreenFirstRow(),
                SizedBox(height: 16.h),
                CustomRichText(
                  textStyle: AppTextStyles.headerStyle.copyWith(
                      fontSize: 28.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.customBlack),
                  text: Labels.good,
                  actionText: Labels.rehan,
                  actionStyle: AppTextStyles.headerStyle.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: AppColors.customGreen),
                ),
                SizedBox(height: 4.h),
                Text(
                  Labels.choose,
                  style: AppTextStyles.subTextStyle
                      .copyWith(color: const Color(0xff888888)),
                ),
                SizedBox(height: 10.h),
                const HomeTextField(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Labels.serving,
                        style: AppTextStyles.subTextStyle
                            .copyWith(color: AppColors.customBlack)),
                    Text(
                      Labels.days,
                      style: GoogleFonts.inter(
                        fontWeight: FontWeight.w600,
                        fontSize: 12.sp,
                        color: const Color(0xff9AD983),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(7, (index) {
                      DateTime date = DateTime.now().add(Duration(days: index));
                      bool isSelected = _selectedDateIndex == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedDateIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 6),
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isSelected
                                ? const Color(0xff9AD983)
                                : const Color(0xffF5F5F5),
                          ),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('EEE').format(date),
                                style: AppTextStyles.subTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: const Color(0xff323434)),
                              ), // Day
                              Text(
                                DateFormat('dd').format(date),
                                style: AppTextStyles.subTextStyle.copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                    color: const Color(0xff323434)), // Date
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(height: 16.h),
                Text(
                  Labels.todayMealDate,
                  style: GoogleFonts.inter(
                    fontSize: 16.sp,
                    color: const Color(0xff323434),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FoodCategories(
                      selectedSnacksIndex: _selectedSnacksIndex,
                      text: 'Snacks',
                      image: 'assets/snacks.png',
                      onTap: () {
                        final snacks = product.getSnacks();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SnacksDetailsScreen(
                              snacks: snacks,
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 30.h,),
                    FoodCategories(
                      selectedSnacksIndex: _selectedSnacksIndex,
                      text: 'Breakfast',
                      image: 'assets/breakfast.png',
                      onTap: () {
                        final breakfast = product.getBreakfast();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BreakfastDetailsScreen(breakfast: breakfast),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 30.h,),
                    FoodCategories(
                      selectedSnacksIndex: _selectedSnacksIndex,
                      text: 'Lunch',
                      image: 'assets/lunch.png',
                      onTap: () {
                        final lunch = product.getLunch();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                LunchDetailsScreen(lunch: lunch),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 30.h,),
                    FoodCategories(
                      selectedSnacksIndex: _selectedSnacksIndex,
                      text: 'Dinner',
                      image: 'assets/dinner.png',
                      onTap: () {
                        final dinner = product.getDinner();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DinnerDetailsScreen(dinner: dinner),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const PopularWidget(),
                SizedBox(height: 16.h),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.80,
                  ),
                  itemCount: product.product.length,
                  itemBuilder: (context, index) {
                    final products = product.product[index];
                    return _buildFoodCard(
                        index: index, product: products, context: context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FoodCategories extends StatelessWidget {
  final Function() onTap;
  final String image;
  final String text;
  const FoodCategories({
    super.key,
    required this.onTap,
    required this.text,
    required this.image,
    required bool selectedSnacksIndex,
  }) : _selectedSnacksIndex = selectedSnacksIndex;

  final bool _selectedSnacksIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                  color: _selectedSnacksIndex
                      ? const Color(0xff9AD983)
                      : const Color(0xffF5F5F5),
                  borderRadius: BorderRadius.circular(100)),
              child: Image.asset(
                image,
                height: 50.h,
                width: 50.h,
              ),
            )),
        Text(
          text,
          style: AppTextStyles.subTextStyle
              .copyWith(fontSize: 14, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}

Widget _buildFoodCard({
  required int index,
  required Product product,
  required BuildContext context,
}) {
  return GestureDetector(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DescriptionScreen(
                  product: product,
                )),
      );
    },
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 130.h,
              width: double.infinity,
              child: Image.asset(product.imagePath),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
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
                        product.rating.toString(),
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
                            product.calories.toString(),
                            style: TextStyle(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    ],
                  ),

                  // Add button
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
