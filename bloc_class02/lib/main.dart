import 'package:bloc_class02/bg_changer.dart';
import 'package:bloc_class02/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:bloc_class02/bloc/switch_bloc/switch_bloc.dart';
import 'package:bloc_class02/image_pick.dart';
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
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const ImagePick(),
        ));
  }
}
