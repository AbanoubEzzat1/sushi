import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/components/spacing.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shoop.dart';
import 'package:sushi/themes/colors.dart';

class FoodDetailsPage extends StatefulWidget {
  final Food food;
  const FoodDetailsPage({super.key, required this.food});

  @override
  State<FoodDetailsPage> createState() => _FoodDetailsPageState();
}

class _FoodDetailsPageState extends State<FoodDetailsPage> {
  //quantity
  int quantityCounter = 0;

  //increment quantity
  void incrementQuantity() {
    setState(() {
      quantityCounter++;
    });
  }

  //decrement quantity
  void decrementQuantity() {
    setState(() {
      if (quantityCounter > 0) {
        quantityCounter--;
      }
    });
  }

  void addToCart() {
    //add food to carts
    //get shop
    final shop = context.read<Shop>();
    //add to cart
    shop.addToCart(widget.food, quantityCounter);
    //let user know it was added
    showDialog(
      context: context,
      //block user from interacting with other widgets
      //pop anywhere to remove the dialog is false
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManger.primaryColor,
        content: const Text(
          "Added to cart successfully",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                //pop to remove the dialog
                Navigator.pop(context);
                //pop to remove the food details page from the stack
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: ListView(
                children: [
                  Image.asset(
                    widget.food.imagePath,
                    height: 200.h,
                  ),
                  virticalSpacing(height: 25),
                  Row(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        color: Colors.yellow[800],
                        size: 20.h,
                      ),
                      horizontalSpacing(width: 5),
                      Text(
                        "(${widget.food.rating})",
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  virticalSpacing(height: 10),
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28.sp,
                    ),
                  ),
                  virticalSpacing(height: 10),
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontWeight: FontWeight.bold,
                      fontSize: 18.sp,
                    ),
                  ),
                  virticalSpacing(height: 10),
                  Text(
                    "Delicately prepared with fresh ingredients. Japanese Wagyu. Served with rice and nori, sushi rice and miso soup, or fresh salmon. Delicately prepared with fresh ingredients. Japanese Wagyu. Served with rice and nori, sushi rice and miso soup, or  fresh salmon.",
                    style: TextStyle(
                      color: Colors.grey[700],
                      height: 2.h,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: ColorsManger.primaryColor,
            padding: EdgeInsets.all(25.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${widget.food.price}",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: ColorsManger.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: decrementQuantity,
                          ),
                        ),
                        SizedBox(
                          width: 40.w,
                          child: Center(
                            child: Text(
                              quantityCounter.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: ColorsManger.secondaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: incrementQuantity,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                virticalSpacing(height: 25),
                MyButton(text: "Add to cart", onTap: addToCart),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
