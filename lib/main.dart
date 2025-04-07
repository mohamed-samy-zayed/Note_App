import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note_app/constants.dart';
import 'package:note_app/features/home/presentation/manager/show_note_cubit/show_note_cubit.dart';
import 'package:note_app/features/home/data/models/Note_model.dart';
import 'package:note_app/features/home/presentation/views/editNotes_page.dart';
import 'package:note_app/features/home/presentation/views/home_view.dart';
import 'package:note_app/core/utils/simple_bloc_observer.dart';
import 'package:note_app/features/search/presentation/manager/searchusers/searchusers_cubit.dart';
import 'package:note_app/features/search/presentation/views/search_view.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(
    DevicePreview(
        enabled: !kReleaseMode, builder: (context) => const NoteApp()),
  );
}

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShowNoteCubit(),),
        BlocProvider(
           create: (context) => SearchusersCubit(
       
      )..filterNames(),
          
        ),

      ],
          
          child: MaterialApp(
            title: 'Note App',
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            locale: DevicePreview.locale(context),
            builder: DevicePreview.appBuilder,
            theme: ThemeData(
              brightness: Brightness.dark,
              useMaterial3: true,
              fontFamily: 'Poppins',
            ),
            initialRoute: HomePage.id,
            routes: {
              HomePage.id: (context) => const HomePage(),
              EditNotesPage.id: (context) => const EditNotesPage(),
              SearchView.id: (context) => const SearchView(),
            },
          ),
        
    );
  }
}
