import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickView extends StatefulWidget {
  const ImagePickView({super.key});

  @override
  State<ImagePickView> createState() => _ImagePickViewState();
}

class _ImagePickViewState extends State<ImagePickView> {
  File? imageFile;
  bool isFromGallery = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Image picker")),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Camera"),
              const SizedBox(
                width: 15,
              ),
              Switch(
                value: isFromGallery,
                onChanged: (value) {
                  setState(() {
                    isFromGallery = value;
                  });
                },
              ),
              const SizedBox(width: 15),
              const Text("Gallery"),
            ],
          ),
          if(imageFile!=null)
          const SizedBox(
            width: 20,
          ) else const SizedBox(),
          TextButton(
            onPressed: () async {
              pickMediaFun(
                  cropImage: (file) async {
                    cropImage(file);
                  },
                  isGallery: isFromGallery);
            },
            child: const Text(
              "Pick Image",
              style: TextStyle(fontSize: 18, color: Colors.pink),
            ),
          ),
          if (imageFile != null)
            AspectRatio(aspectRatio: 1.2, child: Image.file(imageFile!))
          else
            const SizedBox(),
        ],
      ),
    );
  }

  Future<File?> pickMediaFun({
    Future<File?> Function(File file)? cropImage,
    bool? isGallery,
  }) async {
    final source = isGallery == true ? ImageSource.gallery : ImageSource.camera;
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile == null) return null;
    if (cropImage == null) {
      return File(pickedFile.path);
    } else {
      final file = File(pickedFile.path);

      return cropImage(file);
    }
  }

  Future<File?> cropImage(File file) async {
    var croppedFile = await ImageCropper().cropImage(
        sourcePath: file.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: 'Edit Image',
            toolbarColor: Colors.green[100],
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false,
          ),
          IOSUiSettings(
            title: 'Edit Image',
            rotateClockwiseButtonHidden: true,
            aspectRatioPickerButtonHidden: true,
            aspectRatioLockEnabled: false,
            rotateButtonsHidden: true,
          ),
        ]);

    if (croppedFile == null) return null;
    setState(() {
      imageFile = File(croppedFile.path);
    });

    return imageFile;
  }
}
