import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';
import 'package:note_app/features/home/presentation/views/widgets/custom_appBar.dart';
import 'package:note_app/features/home/presentation/views/widgets/listview_body.dart';
import 'package:note_app/features/search/presentation/views/search_view.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  @override
  void initState() {
    BlocProvider.of<ShowNoteCubit>(context).showNote();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(
        top: 50,
        left: 16,
        right: 16,
      ),
      child: Column(
        children: [
          CustopmAppBar(
            name: 'Notes',
            icon: Icons.search,
            onPressed:  (){
Navigator.of(context).pushNamed(SearchView.id);
          },
          ),
          Expanded(child: CustomListview()),
        ],
      ),
    );
  }
}
