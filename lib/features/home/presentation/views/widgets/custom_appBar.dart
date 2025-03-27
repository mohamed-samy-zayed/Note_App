import 'package:flutter/material.dart';
import 'package:note_app/core/utils/widgets/custom_iconButton.dart';

class CustopmAppBar extends StatelessWidget {
  const CustopmAppBar({super.key, required this.name, required this.icon, this.onPressed });
 final String name;
 final IconData icon;
final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
         Text(
          name,
          style: const  TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
        ),
        CustomIconbutton(
          onPressed: onPressed,
          icon: icon,
        ),
      ],
    );
  }
}
