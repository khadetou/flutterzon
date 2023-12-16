import "dart:io";
import "package:bloc/bloc.dart";
import "package:file_picker/file_picker.dart";
import "package:equatable/equatable.dart";

part "single_image_carousel_state.dart";

class SingleImageCubic extends Cubit<SingleImageState> {
  SingleImageCubic() : super(SingleImageInitial());

  void singleImage() async {
    try {
      File? image;
      FilePickerResult? imagePicked = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image,
      );

      if (imagePicked != null) {
        image = File(imagePicked.files[0].path!);
      }

      emit(
        SingleImageSelected(image: image!),
      );
    } catch (e) {
      emit(
        SingleImageError(errorString: e.toString()),
      );
    }
  }
}
