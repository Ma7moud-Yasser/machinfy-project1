import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/styles/assets_manager.dart';
import 'package:to_do_app/features/note/presentation/view/note_screen.dart';
import '../controller/welcome_screen_cubit.dart';
import '../controller/welcome_screen_states.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  static const route = '/welcomeScreen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WelcomeScreenCubit(),
      child: BlocConsumer<WelcomeScreenCubit, WelcomeScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = WelcomeScreenCubit.get(context);
          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: Center(
                      child: Image.asset(
                    ImagesAssets.note,
                    width: MediaQuery.sizeOf(context).width * 0.8,
                  )),
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.1,
                      vertical: MediaQuery.sizeOf(context).height * 0.03,
                    ),
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      ),
                    ),
                    child: Column(
                      children: [
                        Text(
                          textAlign: TextAlign.center,
                          "Easiest Way to Note Your Tasks",
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        SizedBox(
                          height: MediaQuery.sizeOf(context).height * 0.03,
                        ),
                        Text(
                          textAlign: TextAlign.justify,
                          "organized all your tasks in one place Designed to be simple and easy to use",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .secondary
                                        .withOpacity(0.6),
                                  ),
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 10,
                          children: [
                            FloatingActionButton(
                                backgroundColor:
                                    Theme.of(context).colorScheme.secondary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                onPressed: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    NoteScreen.route,
                                    (route) => false,
                                  );
                                },
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Theme.of(context).colorScheme.primary,
                                  size: 50,
                                )),
                            Text(
                              textAlign: TextAlign.center,
                              "Let\'s Go",
                              style: Theme.of(context).textTheme.bodyLarge,
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
