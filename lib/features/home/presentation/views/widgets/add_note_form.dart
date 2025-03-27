import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/features/home/presentation/manager/add_note_cubit/add_note_cubit.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/views/widgets/Colors_listView.dart';
import 'package:note_app/features/home/presentation/views/widgets/Custom_Button.dart';
import 'package:note_app/features/home/presentation/views/widgets/custom_textField.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 100,
            child: Divider(color: Colors.white, thickness: 4),
          ),
          const SizedBox(height: 10),
          CustomTextField(
            hintText: 'Title',
            onSaved: (data) {
              title = data;
            },
          ),
          const SizedBox(height: 20),
          CustomTextField(
            maxLines: 7,
            hintText: '\n\n\nContent',
            onSaved: (data) {
              subTitle = data;
            },
          ),
          const SizedBox(height: 10),
          const ColorsListView(),
          const SizedBox(height: 10),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    var note = NoteModel(
                      title: title!,
                      subTitle: subTitle!,
                      date:
                          DateFormat(
                            'MMMM d,yyyy',
                          ).format(DateTime.now()).toString(),
                      color: const Color(0xff28536b).value,
                    );

                    BlocProvider.of<AddNoteCubit>(context).addNote(note);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
