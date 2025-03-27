import 'package:flutter/material.dart';
import 'package:note_app/features/home/presentation/views/editNotes_page.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    
  });
  
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          horizontalTitleGap: 20,
          contentPadding: EdgeInsets.zero,
          onTap: () {
            Navigator.pushNamed(context, EditNotesPage.id, 
            // arguments: note
            );
          },
         
        ),
        const Divider(
          color: Colors.white,
          indent: 75,
          endIndent: 10,
        ),
      ],
    );
  }
}
