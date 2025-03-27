import 'package:flutter/material.dart';

class CustomIconbutton extends StatelessWidget {
  const CustomIconbutton({super.key, required this.icon,  this.onPressed});
final IconData icon;
final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.05),
        borderRadius: BorderRadius.circular(16),
      ),
      height: 50,
      width: 50,
      child: IconButton(
        onPressed: onPressed,
        icon:  Icon(
         icon,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
