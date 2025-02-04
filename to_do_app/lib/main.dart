import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/core/models/note_model.dart';
import 'package:to_do_app/core/resources/app_stings.dart';
import 'package:to_do_app/core/utils/bloc_observer.dart';
import 'package:to_do_app/core/utils/themes/dark_theme.dart';
import 'package:to_do_app/core/utils/themes/light_theme.dart';
import 'package:to_do_app/features/note/presentation/view/note_screen.dart';
import 'package:to_do_app/features/welcome/presentation/view/welcome_screen.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(AppString.notesBox);
  Hive.registerAdapter(NoteModelAdapter());
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To-Do',
      theme: lightTheme(context),
      darkTheme: darkTheme(context),
      themeMode: ThemeMode.system,
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route: (context) => WelcomeScreen(),
        NoteScreen.route: (context) => NoteScreen(),
      },
    );
  }
}
