import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';

import 'package:note_app/features/home/presentation/views/widgets/add_note_form.dart';

class AddNote extends StatelessWidget {
  const AddNote({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {}
          if (state is AddNoteSuccess) {
            BlocProvider.of<ShowNoteCubit>(context).showNote();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          return AbsorbPointer(
            absorbing: state is AddNoteLoading ? true : false,
            child: Padding(
              padding: EdgeInsets.only(
                top: 5,
                right: 20,
                left: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom
                
              ),
              child: const AddNoteForm(),
            ),
          );
        },
      ),
    );
  }
}
