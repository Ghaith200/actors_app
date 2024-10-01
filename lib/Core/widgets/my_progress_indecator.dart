import 'package:flutter/material.dart';
import 'package:gallery_app/Core/helpers/my_colors.dart';

class MyCircleProgressIndecator extends StatelessWidget {
  const MyCircleProgressIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: MyColors.myBlue,
        backgroundColor: MyColors.myGrey,
      ),
    );
  }
}
