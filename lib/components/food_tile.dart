import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function() onTap;
  const FoodTile({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(20.r),
        ),
        margin: EdgeInsets.only(left: 25.0.w),
        padding: EdgeInsets.all(25.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              food.imagePath,
              height: 140.h,
              fit: BoxFit.cover,
            ),
            Text(
              food.name,
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 20.sp,
              ),
            ),
            SizedBox(
              width: 160.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${food.price}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[700],
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.star_rounded,
                          color: Colors.yellow[800], size: 20.h),
                      Text("(${food.rating})",
                          style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
