import 'package:flutter/material.dart';
import 'package:note_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
   
    this.onSaved,  this.maxLines = 1, this.onChanged, this.intialText ,
  });

  final String hintText;
  final Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final String? intialText;
  final int maxLines ;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: TextInputAction.done,
      keyboardType:TextInputType.text,
      maxLines:maxLines ,
      onSaved: onSaved,
      onChanged: onChanged ,
      validator: (value) {
        if ( value?.trim().isEmpty ?? true ) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      initialValue: intialText,
      style: const TextStyle(fontSize: 18),
      decoration: InputDecoration(
        enabledBorder: getBorder(),
        focusedBorder: getBorder(kPrimaryColor),
        border: getBorder(),
        hintText: hintText,
        
        errorBorder: getBorder(Colors.red),
        errorStyle: const TextStyle(color: Colors.red),
        
       
      ),
    );
  }

  OutlineInputBorder getBorder([color]) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide(
          color: color ?? Colors.white,
          width: 2,
        ));
  }
}
