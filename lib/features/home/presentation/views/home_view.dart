import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/views/widgets/add_note.dart';
import 'package:note_app/features/home/presentation/views/widgets/home_page_body.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: const HomePageBody(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[300],
        onPressed: () {
          showModalBottomSheet(
            // isScrollControlled: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            context: context,
            builder: (context) {
              return const AddNote();
            },
          );
        },
        child: const Icon(FontAwesomeIcons.plus, size: 18, color: Colors.black),
      ),
    );
  }
}
