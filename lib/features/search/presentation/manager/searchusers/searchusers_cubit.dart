import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';

part 'searchusers_state.dart';

class SearchusersCubit extends Cubit<SearchusersState> {
  SearchusersCubit() : super(SearchusersLoading());
  List<NoteModel>?  notes ;

  Future<void> filterNames({ String? name}) async {
    
var noteBox = Hive.box<NoteModel>(kNotesBox);

  notes = noteBox.values.toList() ;

    if ( name == null ||name.isEmpty) {
      emit(SearchusersInitial(names: notes!));
    } else {
      emit(SearchusersLoading());
      final filteredList =
          notes!
              .where(
                (filterName) => filterName.title.toString().toLowerCase().contains(
                  name.toLowerCase(),
                ),
              )
              .toList();
      if (filteredList.isNotEmpty) {
        emit(SearchusersFilter(filterNames: filteredList,
        q: name));
      } else {
        emit(SearchusersFailure(
         
          q: name
        ));
      }
    }
  }
}
