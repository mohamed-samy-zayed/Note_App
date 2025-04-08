import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';
import 'package:note_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:note_app/features/search/presentation/views/widgets/custom_appbar_search.dart';
import 'package:note_app/features/search/presentation/views/widgets/search_item_listview.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    
    return CustomScrollView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.only(
             top: 50,
        left: 16,
        right: 16,
          ),
          sliver: SliverToBoxAdapter(
           
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBarSearch(
                  onChanged: (p0) {
                    BlocProvider.of<SearchusersCubit>(
                      context,
                    ).filterNames(name: p0);
                  },
                ),
                BlocBuilder<SearchusersCubit, SearchusersState>(
                  builder: (context, state) {
                    if (state is SearchusersFilter) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 14, top: 20, bottom: 20),
                        child: Text(
                          'Result of " ${state.q} "',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      );
                    } else if(state is SearchusersInitial ){

                      return Padding(
                        padding: const EdgeInsets.only(
                            left: 16, top: 20, bottom: 20),
                        child: Text(
                          'All Notes',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                      );

                    } else{
                      return const SizedBox(
                        height: 40,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        BlocBuilder<SearchusersCubit, SearchusersState>(
          builder: (context, state) {
            if (state is SearchusersFilter) {
              return SliverPadding(
                padding: const EdgeInsets.only(left: 16, bottom: 60, right: 16),
                sliver: SearchItemListview(
                  names: state.filterNames,
                ),
              );
            } else if (state is SearchusersLoading) {
              return const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(left: 16, bottom: 60, right: 16),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.grey,
                    ),
                  )
                ),
              );
            } else if (state is SearchusersFailure) {
              return SliverToBoxAdapter(
                  child: Text(
                'No Results of " ${state.q} "',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                textAlign: TextAlign.center,
              ));
            } else {
              List<NoteModel> notes = BlocProvider.of<ShowNoteCubit>(context).note??[];
             return SliverPadding(
                padding: const EdgeInsets.only(left: 16, bottom: 60, right: 16),
                sliver: SearchItemListview(
                  names: notes,
                ),
              );
            }
          },
        )
      ],
    );
  }
}
