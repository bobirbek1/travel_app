import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
 final Color color;

  const AppDivider(this.color,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 213,
          height: 1,
          color: color,
        ),
        Container(
          width: 44,
          height: 1,
          margin: const EdgeInsets.only(
            left: 12,
          ),
          color: color,
        ),
        Container(
          width: 25,
          height: 1,
          margin: const EdgeInsets.only(
            left: 12,
          ),
          color: color,
        ),
      ],
    );
  }
   
}
