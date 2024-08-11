import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obhijuk/src/features/profile/profile_update/presentation/riverpod/image_picker_provider.dart';

class ImagePickerNotifier extends StateNotifier<File?> {
  ImagePickerNotifier({required this.ref}) : super(null);
  Ref ref;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemporary = File(image.path);
      ref.read(imageLinkProvider.notifier).update((state) => imageTemporary);
      ref.read(isShowImageDailogProvider.notifier).update((state) => true);
      //this.image = imageTemporary;
    } on PlatformException catch (e) {
      debugPrint('Failed to pick image: $e');
    }
  }
}
