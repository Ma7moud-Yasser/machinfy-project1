import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:to_do_app/core/styles/assets_manager.dart';
import 'package:to_do_app/core/utils/responsive_font.dart';
import 'package:to_do_app/features/note/presentation/component/custom_search_bar.dart';
import '../controller/note_screen_cubit.dart';
import '../controller/note_screen_states.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({super.key});
  static const route = '/noteScreen';

  @override
  State<NoteScreen> createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteScreenCubit(),
      child: BlocConsumer<NoteScreenCubit, NoteScreenStates>(
        listener: (context, state) {},
        builder: (context, state) {
          // final cubit = NoteScreenCubit.get(context);
          return Scaffold(
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.06,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.sizeOf(context).height * 0.1,
                      bottom: MediaQuery.sizeOf(context).height * 0.05,
                    ),
                    child: Text(
                      "Notes",
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                              color: Theme.of(context).colorScheme.primary,
                              fontSize: responsiveFont(
                                context,
                                fontSize: 40,
                              )),
                    ),
                  ),
                  CustomSearchBar(),
                  // SizedBox(
                  //   height: MediaQuery.sizeOf(context).height * .01,
                  // ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            horizontal: MediaQuery.sizeOf(context).width * .01,
                            vertical: MediaQuery.sizeOf(context).height * .01,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.sizeOf(context).height * 0.02),
                            color: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.2),
                          ),
                          child: ListTile(
                            title: Text(
                              "First Note",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.tertiary,
                                  ),
                            ),
                            subtitle: Text(
                              "their is note their is note their is note",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .tertiary
                                        .withOpacity(0.6),
                                  ),
                            ),
                            trailing: GestureDetector(
                              onTap: () async {
                                Lottie.asset(
                                  IconsAssets.trash,
                                  width:
                                      MediaQuery.sizeOf(context).width * 0.15,
                                  height:
                                      MediaQuery.sizeOf(context).height * 0.15,
                                  repeat: false,
                                  animate: true,
                                );

                                await Future.delayed(
                                    const Duration(seconds: 1));

                                setState(() {
                                  // notes.removeAt(index);
                                });
                              },
                              child: Lottie.asset(
                                IconsAssets.trash,
                                width: MediaQuery.sizeOf(context).width * 0.15,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.15,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// class NotesCard extends StatelessWidget {
//   const NotesCard({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
