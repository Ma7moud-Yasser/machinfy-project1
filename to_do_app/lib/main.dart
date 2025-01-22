import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/styles/color_manager.dart';
import 'package:to_do_app/core/utils/bloc_observer.dart';
import 'package:to_do_app/core/utils/themes/dark_theme.dart';
import 'package:to_do_app/core/utils/themes/light_theme.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/view/note_screen.dart';
import 'package:to_do_app/features/welcome/presentation/view/welcome_screen.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
