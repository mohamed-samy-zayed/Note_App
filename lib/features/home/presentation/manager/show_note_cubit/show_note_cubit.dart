import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';

import '../../../data/models/Note_model.dart';

part 'show_note_state.dart';

class ShowNoteCubit extends Cubit<ShowNoteState> {
  ShowNoteCubit() : super(ShowNoteInitial());

List<NoteModel>? note;

  showNote() async{
 
 
  var noteBox = Hive.box<NoteModel>(kNotesBox);
 note = noteBox.values.toList();
  emit(ShowNoteSuccess());
   
 
  }
}
