import 'package:flutter/material.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/views/widgets/custom_containerTips.dart';

class SearchItemListview extends StatelessWidget {
  const SearchItemListview({super.key, required this.names, });
 final  List<NoteModel> names ;
  @override
  Widget build(BuildContext context) {
   
    return SliverList.builder(

      itemCount: names.length,
      itemBuilder: (context, index) {
        return CustomContainerTips(
          isSearch: true,
          note: names[index]);
        
        
         
      },
    );
  }
}
