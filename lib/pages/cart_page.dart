import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi/components/button.dart';
import 'package:sushi/models/food.dart';
import 'package:sushi/models/shoop.dart';
import 'package:sushi/themes/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  //remove from cart
  void removeFromCart(BuildContext context, Food food) {
    //get shop
    final shop = context.read<Shop>();
    //remove from cart
    shop.removeFromCart(food);
  }

  void payNow(BuildContext context) {
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
    return Consumer<Shop>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: ColorsManger.primaryColor,
        appBar: AppBar(
          title: const Text('My Cart'),
          centerTitle: true,
          backgroundColor: ColorsManger.primaryColor,
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        body: value.cart.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_rounded,
                    size: 200.h,
                    color: Colors.white,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Cart is empty',
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ))
            : Column(
                children: [
                  //customer cart
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          //get food from cart
                          final food = value.cart[index];

                          //get food name
                          final String foodName = food.name;

                          //get food price
                          final String foodPrice = food.price;

                          //return food list tile
                          return Container(
                            decoration: BoxDecoration(
                              color: ColorsManger.secondaryColor,
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            margin: EdgeInsets.only(
                                top: 20.h, left: 20.w, right: 20.w),
                            child: ListTile(
                                title: Text(
                                  foodName,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(
                                  '\$$foodPrice',
                                  style: TextStyle(
                                    color: Colors.grey[200],
                                  ),
                                ),
                                trailing: IconButton(
                                  onPressed: () =>
                                      removeFromCart(context, food),
                                  icon: Icon(Icons.delete,
                                      color: Colors.grey[300]),
                                )),
                          );
                        }),
                  ),

                  //pay button
                  Padding(
                    padding: EdgeInsets.all(25.0.h),
                    child:
                        MyButton(text: "Pay Now", onTap: () => payNow(context)),
                  )
                ],
              ),
      ),
    );
  }
}
