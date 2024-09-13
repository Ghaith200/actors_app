import 'package:flutter/material.dart';
import 'package:gallery_app/Constants/my_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Home Page") , backgroundColor: MyColors.myYellow,),
        body: const Center(
          child: Text('Home Page'),
        ),
      ),
    );
  }
}