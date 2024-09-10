import 'package:image_picker/image_picker.dart';

class PickImageUtil {
  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> cameraCapture() async {
    final XFile? file = await imagePicker.pickImage(source: ImageSource.camera);

    return file;
  }

  Future<XFile?> galleryImage() async {
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);

    return file;
  }
}
