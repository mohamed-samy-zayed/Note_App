part of 'searchusers_cubit.dart';





@immutable
abstract class SearchusersState {}

class SearchusersInitial extends SearchusersState {
  final List<NoteModel> names;
  

  SearchusersInitial({required this.names});
}
class SearchusersFilter extends SearchusersState {
  final List<NoteModel> filterNames;
  final String q;

  SearchusersFilter({ required this.q,required this.filterNames});
}
class SearchusersFailure extends SearchusersState {
  final String q;

 SearchusersFailure( { required this.q});
  
}
class SearchusersLoading extends SearchusersState {
  
  
}


