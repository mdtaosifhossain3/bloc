import 'package:bloc/bloc.dart';
import 'package:bloc_class02/utils/pick_image_util.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';

part 'image_picker_event.dart';
part 'image_picker_state.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  PickImageUtil pickImageUtil;
  ImagePickerBloc(this.pickImageUtil) : super(const ImagePickerState()) {
    on<CameraImagePicker>((event, emit) async {
      final XFile? file = await pickImageUtil.cameraCapture();

      emit(state.copyWith(file: file));
    });

    on<GalleryImagePicker>((event, emit) async {
      final XFile? file = await pickImageUtil.galleryImage();
      emit(state.copyWith(file: file, isLoading: true));
      emit(state.copyWith(isLoading: false));
    });
  }
}
