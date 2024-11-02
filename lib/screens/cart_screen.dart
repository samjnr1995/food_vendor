import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_catering_service_app/components/cusom_colours.dart';
import 'package:food_catering_service_app/components/custom_button.dart';
import 'package:food_catering_service_app/styles.dart';
import 'package:provider/provider.dart';
import 'package:badges/badges.dart' as badges;
import '../components/cart_list.dart';
import '../models/cart_model.dart';
import '../providers/cart_model_provider.dart';
import 'auth/signUp/sign_up_screen.dart';

class CartDetails extends StatefulWidget {
  const CartDetails({super.key});

  @override
  State<CartDetails> createState() => _CartDetailsState();
}

class _CartDetailsState extends State<CartDetails> {
  String currency = "₦";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 500,
                padding: const EdgeInsets.all(10),
                color: AppColors.customGreen,
                child: Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.white,
                            ),
                          ),
                           Expanded(
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "Cart",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.sp),
                              ),
                            ),
                          ),
                          Consumer<CartModelProvider>(
                            builder: (context, cartProvider, child) {
                              return badges.Badge(
                                position: badges.BadgePosition.bottomEnd(
                                    bottom: 1, end: 1),
                                badgeContent: Text(
                                  cartProvider.uniqueProductCount.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                child: IconButton(
                                  color: Colors.white,
                                  icon: const Icon(Icons.add_shopping_cart),
                                  iconSize: 25,
                                  onPressed: () {},
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.only(
                    left: 16, right: 16, bottom: 80, top: 20),
                margin: const EdgeInsets.only(top: 70),
                decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Column(
                  children: [
                    Expanded(
                      child: Consumer<CartModelProvider>(
                        builder: (context, cartProvider, child) {
                          final List<CartModel> cartItems =
                              cartProvider.cartItems;

                          if (cartItems.isEmpty) {
                            return Center(
                              child: Text(
                                'Your cart is empty.',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            );
                          }
                          return ListView.builder(
                            itemCount: cartItems.length,
                            itemBuilder: (context, index) {
                              final cartModel = cartItems[index];
                              return Dismissible(
                                key: Key(cartModel.product.id.toString()),
                                background: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                    borderRadius: BorderRadius.circular(12)
                                  ),

                                  alignment: Alignment.centerRight,
                                  padding: const EdgeInsets.only(right: 16.0),
                                  child: const Icon(
                                    Icons.delete,
                                    color: Colors.white,
                                  ),
                                ),
                                direction: DismissDirection.endToStart,
                                onDismissed: (direction) {
                                  Provider.of<CartModelProvider>(context,
                                          listen: false)
                                      .removeCartItem(index);
                                },
                                child: GestureDetector(
                                    onTap: () {},
                                    child: CartListItem(
                                        cartModel: cartModel, index: index)),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Consumer<CartModelProvider>(
                      builder: (context, cartProvider, child) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(child: Container()),
                                  GestureDetector(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: AppColors.customGreen),
                                      height: 50.h,
                                      width: 90.w,
                                      child: Center(
                                        child: Text(
                                          'clear cart',
                                          style: AppTextStyles.subTextStyle
                                              .copyWith(
                                                  fontSize: 17.sp,
                                                  color: Colors.white),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      Provider.of<CartModelProvider>(context,
                                              listen: false)
                                          .clearCart();
                                    },
                                  )
                                ],
                              ),
                              const Divider(
                                color: Colors.grey,
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Total Price:',
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  ),
                                  Expanded(child: Container()),
                                  Text(
                                    '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomButton(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignUp()));
                                },
                                textColor: Colors.white,
                                text: 'Checkout',
                                color: AppColors.customGreen,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
