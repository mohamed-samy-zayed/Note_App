import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/views/widgets/custom_containerTips.dart';

class CustomListview extends StatelessWidget {
  const CustomListview({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowNoteCubit, ShowNoteState>(
      builder: (context, state) {
        List<NoteModel> notes = BlocProvider.of<ShowNoteCubit>(context).note??[];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: notes.length,
            itemBuilder: (context, index) {
              return  CustomContainerTips(
                note: notes[index],
              );
            },
          ),
        );
      },
    );
  }
}
