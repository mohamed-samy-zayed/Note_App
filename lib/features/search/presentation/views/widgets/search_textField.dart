import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';

class SearchTextfield extends StatefulWidget {
  const SearchTextfield({super.key, required this.onChanged});
  final Function(String) onChanged;

  @override
  State<SearchTextfield> createState() => _SearchTextfieldState();
}

class _SearchTextfieldState extends State<SearchTextfield> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      textInputAction: TextInputAction.search,
      onChanged: widget.onChanged,
      showCursor: true,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(.05),
        suffix: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
            onPressed: () {
              controller.clear();
              BlocProvider.of<SearchusersCubit>(context).filterNames();
            },
            icon: const Icon(Icons.clear_all_rounded, color: Colors.white),
          ),
        ),
        prefixIcon: const Icon(Icons.search),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: kPrimaryColor),
        ),
        hintText: "Search...",
        hintStyle: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
      ),
    );
  }
}
