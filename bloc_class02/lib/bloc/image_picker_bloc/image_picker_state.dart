part of 'image_picker_bloc.dart';

class ImagePickerState extends Equatable {
  const ImagePickerState({this.file, this.isLoading = false});

  final XFile? file;
  final bool isLoading;

  ImagePickerState copyWith({XFile? file, bool? isLoading}) {
    return ImagePickerState(
        file: file ?? this.file, isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object?> get props => [file, isLoading];
}
