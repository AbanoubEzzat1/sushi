import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/components/food_tile.dart';
import 'package:sushi/components/spacing.dart';
import 'package:sushi/models/shoop.dart';
import 'package:sushi/pages/food_details_page.dart';
import 'package:sushi/themes/colors.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  void Reedme(BuildContext context) {
    showDialog(
      context: context,
      //block user from interacting with other widgets
      //pop anywhere to remove the dialog is false
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsManger.primaryColor,
        content: const Text(
          "Not implemented yet, only for demo purpose",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
              onPressed: () {
                //pop to remove the dialog
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

  void navigateToFoodPage(int index) {
    //get shop and food menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    //navigate to food details page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FoodDetailsPage(
          food: foodMenu[index],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //get shop and food menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.grey[800],
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(8.0.w),
            child: Image.asset("assets/images/app_icon.png"),
          ),
          centerTitle: true,
          title: const Text(
            'Tokyo',
            style: TextStyle(),
          ),
          actions: [
            IconButton(
              onPressed: () {
                //navigate to cart page
                Navigator.pushNamed(context, '/cartPage');
              },
              icon: const Icon(
                Icons.shopping_cart,
              ),
            )
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ColorsManger.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                ),
                margin: EdgeInsets.symmetric(horizontal: 25.0.w),
                padding:
                    EdgeInsets.symmetric(horizontal: 25.0.w, vertical: 25.0.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get 40% promo',
                          style: GoogleFonts.dmSerifDisplay(
                            fontSize: 20.sp,
                            color: Colors.white,
                          ),
                        ),
                        virticalSpacing(height: 20),
                        MyButton(text: "Redeem", onTap: () => Reedme(context)),
                      ],
                    ),
                    Image.asset("assets/images/many_sushi.png", height: 100.h)
                  ],
                ),
              ),
              virticalSpacing(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderSide: const BorderSide(color: Colors.white),
                    //   borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    // ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                    ),
                    hintText: "What do you want.",
                  ),
                ),
              ),
              virticalSpacing(height: 25),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.0.w),
                child: Text(
                  "Food Menu",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                    fontSize: 18.sp,
                  ),
                ),
              ),
              virticalSpacing(height: 10),
              SizedBox(
                height: 245.0.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => FoodTile(
                    food: foodMenu[index],
                    onTap: () => navigateToFoodPage(index),
                  ),
                  itemCount: foodMenu.length,
                ),
              ),
              virticalSpacing(height: 25),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.all(Radius.circular(20.r)),
                ),
                margin: EdgeInsets.only(
                    left: 25.0.w, right: 25.0.w, bottom: 25.0.h),
                padding: EdgeInsets.all(20.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset("assets/images/sushi.png", height: 60.h),
                        horizontalSpacing(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Salamon Sushi",
                              style: GoogleFonts.dmSerifDisplay(
                                fontSize: 18.sp,
                              ),
                            ),
                            virticalSpacing(height: 10),
                            Text(
                              '\$21.00',
                              style: TextStyle(
                                color: Colors.grey[700],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.grey,
                      size: 28.w,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
