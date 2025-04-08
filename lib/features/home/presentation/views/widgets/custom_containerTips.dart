import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/views/editNotes_page.dart';

class CustomContainerTips extends StatelessWidget {
  const CustomContainerTips({
    super.key,
    required this.note,
    required this.isSearch,
  });

  final NoteModel note;
  final bool isSearch;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, EditNotesPage.id, arguments: note);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Container(
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 2),
                  title: Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(
                      note.subTitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  trailing:
                      isSearch
                          ? SizedBox()
                          : IconButton(
                            onPressed: () {
                              note.delete();
                              debugPrint('${note.title} is deleted');
                              BlocProvider.of<ShowNoteCubit>(
                                context,
                              ).showNote();
                            },
                            icon: const Icon(
                              FontAwesomeIcons.trash,
                              color: Colors.black,
                            ),
                          ),
                ),
                Text(
                  note.date,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
