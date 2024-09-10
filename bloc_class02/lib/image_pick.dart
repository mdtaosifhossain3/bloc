import 'dart:io';

import 'package:bloc_class02/bloc/image_picker_bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({super.key});

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<ImagePickerBloc, ImagePickerState>(
            builder: (contex, state) {
          print("Is loading: ${state.isLoading}");
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  child: state.file != null
                      ? Image.file(File(state.file!.path.toString()))
                      : null),
              TextButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(CameraImagePicker());
                  },
                  child: const Text("Capture Image")),
              TextButton(
                  onPressed: () {
                    context.read<ImagePickerBloc>().add(GalleryImagePicker());
                  },
                  child: const Text("Pick Image from Gallery")),
            ],
          );
        }),
      ),
    );
  }
}
