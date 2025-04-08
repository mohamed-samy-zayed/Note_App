
import 'package:flutter/material.dart';
import 'package:note_app/core/utils/widgets/custom_iconButton.dart';
import 'package:note_app/features/search/presentation/views/widgets/search_textField.dart';

class CustomAppBarSearch extends StatelessWidget {
 const  CustomAppBarSearch({
    super.key, required this.onChanged,
  });
  
  final dynamic Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        spacing: 10,
        children: [
          CustomIconbutton(
            icon: Icons.arrow_back_ios_new_rounded,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: SearchTextfield(
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
