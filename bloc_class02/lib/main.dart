import 'package:bloc_class02/bloc/favourite_app/favourite_app_bloc.dart';
import 'package:bloc_class02/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_class02/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_class02/bloc/todo/todo_bloc.dart';
import 'package:bloc_class02/favourite_app.dart';
import 'package:bloc_class02/repo/favourite_app_repo.dart';
import 'package:bloc_class02/utils/pick_image_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          BlocProvider(
            create: (context) => ImagePickerBloc(PickImageUtil()),
          ),
          BlocProvider(
            create: (context) => TodoBloc(),
          ),
          BlocProvider(
            create: (context) => FavouriteAppBloc(FavouriteAppRepo()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FavouriteApp(),
        ));
  }
}
