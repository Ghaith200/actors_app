import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySperater extends StatelessWidget {
  const MySperater({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).colorScheme.primary,
      height: 1,
      width: MediaQuery.of(context).size.width * 0.9,
    );
  }
}
