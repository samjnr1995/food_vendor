import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/models/product_model.dart';
import 'package:food_catering_service_app/providers/cart_model_provider.dart';
import 'package:food_catering_service_app/screens/description_text.dart';
import 'package:food_catering_service_app/screens/ingredient_screen.dart';
import 'package:food_catering_service_app/screens/registration_successful.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../components/labels.dart';


class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen(
      {Key? key, this.product,})
      : super(key: key);
  final Product? product;
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
    final cartProvider = Provider.of<CartModelProvider>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Image.asset(
                      Labels.frame1,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 210.w),
                    Image.asset(
                      'assets/heart.png',
                      height: 30,
                      width: 30,
                    ),
                  ],
                ),
                Image.asset(widget.product!.imagePath),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(height: 20.h),
                TabBar(
                  padding: EdgeInsets.zero,
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
                  height: 150,
                  width: 500.w,
                  child: TabBarView(controller: tabController, children: [
                    DescriptionText(
                      description: widget.product!.about.toString(),
                    ),
                    IngredientScreen(
                        ingredient: widget.product!.ingredients.toString()),
                    DescriptionText(
                      description: widget.product!.about.toString(),
                    ),
                  ]),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 600,
                  decoration: BoxDecoration(
                    color: const Color(0xFF9AD983),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    onTap: () {
                      var product = Product(
                        price: widget.product!.price,
                        calories: widget.product!.calories,
                        rating: widget.product!.rating,
                        id: widget.product!.id,
                        name: widget.product!.name,
                        imagePath: widget.product!.imagePath,
                        ingredients: '',
                        about: '', category: '',
                      );
                      cartProvider.addToCart(product, 1);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const RegistrationSuccessDialog()));
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Center(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    Labels.addToMyMeal,
                                    style: GoogleFonts.inter(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  SizedBox(width: 4.w),
                                  const Icon(Icons.add,
                                      color: Colors.white, size: 24),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
