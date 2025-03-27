import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:note_app/features/home/presentation/views/widgets/custom_textField.dart';
import 'package:note_app/features/home/presentation/views/widgets/editNote_colorsListView.dart';

class EditNotesPage extends StatefulWidget {
  const EditNotesPage({
    super.key,
  });
  static String id = 'EditNotesPage';

  @override
  State<EditNotesPage> createState() => _EditNotesPageState();
}

class _EditNotesPageState extends State<EditNotesPage> {
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    NoteModel note = ModalRoute.of(context)!.settings.arguments as NoteModel;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50,
          left: 16,
          right: 16,
        ),
        child: Column(
          children: [
            CustopmAppBar(
                name: 'Edit Note',
                icon: Icons.check,
                onPressed: () {
                  note.title = title ?? note.title;
                  note.subTitle = subTitle ?? note.subTitle;
                  note.save();
                  debugPrint("${note.title} is Edited");
                  BlocProvider.of<ShowNoteCubit>(context).showNote();
                  Navigator.pop(context);
                }),
            const SizedBox(
              height: 50,
            ),
            CustomTextField(
              hintText: note.title,
              intialText: note.title,
              onChanged: (data) {
                
                
  title =  data;

              },
            ),
            const SizedBox(
              height: 15,
            ),
            CustomTextField(
              hintText: '\n\n\n${note.subTitle}',
              intialText: note.subTitle ,
              onChanged: (data) {
              
                
  title = data;
              },
              maxLines: 7,
            ),
            const SizedBox(
              height: 15,
            ),
           EditNoteColorListView(
            note: note,
          ),
          ],
        ),
      ),
    );
  }
}
