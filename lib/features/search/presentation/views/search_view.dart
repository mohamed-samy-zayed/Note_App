import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:note_app/features/search/presentation/views/widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  static String id = 'SearchView';

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => SearchusersCubit(
       
      ),
      child: const Scaffold(
        
        body: SearchViewBody(),
      ),
    );
  }
}
