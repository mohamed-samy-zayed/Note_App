import 'package:flutter/material.dart';
import 'package:note_app/features/search/presentation/views/widgets/search_item.dart';

class SearchItemListview extends StatelessWidget {
  const SearchItemListview({super.key, });
//  final  List<BookModel> names ;
  @override
  Widget build(BuildContext context) {
   
    return SliverList.builder(

      itemCount: 5,
      itemBuilder: (context, index) {
        return SearchItem(
        //  bookModel: names[index],
        );
      },
    );
  }
}
