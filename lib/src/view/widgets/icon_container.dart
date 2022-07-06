import 'package:flutter/material.dart';



class IconContainer extends StatelessWidget {
  final Widget icon;

  const IconContainer({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(child: icon),
    );
  }
}