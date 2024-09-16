import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';

class CustomCircleProgressIndecator extends StatelessWidget {
  const CustomCircleProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myYellow,
        backgroundColor: MyColors.myGrey,
      ),
    );
  }
}
