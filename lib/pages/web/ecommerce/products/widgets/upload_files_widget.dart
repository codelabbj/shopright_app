import 'dart:io';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../../theme/app_colors.dart';
import '../../../../../widgets/customs_text_form_field.dart';

class MediaUploader extends StatefulWidget {
  @override
  _MediaUploaderState createState() => _MediaUploaderState();
}

class _MediaUploaderState extends State<MediaUploader> {
  bool showVideoForm = false;
  final TextEditingController _videoUrlController = TextEditingController();
  Uint8List? thumbnailFile;
  Future<void> pickFile(BuildContext context) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any, // tu peux mettre FileType.image / video / custom
      allowMultiple: false, // true si tu veux plusieurs fichiers
    );

    if (result != null) {
      final file = result.files.single;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Fichier sélectionné: ${file.name}")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Aucun fichier sélectionné.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.2),
              spreadRadius: 10,
              blurRadius: 10,
              offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Images
            Text("Images", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            InkWell(
              onTap: () => pickFile(context),
              child: Container(
                height: 120,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blueAccent,
                    style: BorderStyle.solid,
                  ),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[100],
                ),
                child: Center(
                  child: Text(
                    "Drop files here or click to upload.",
                    style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.black54),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            if (showVideoForm) ...[
              Text("Video", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(hintText: "Enter YouTube or Vimeo video URL", controller: _videoUrlController),

                    const SizedBox(height: 16),

                    // Thumbnail
                    Text("Video thumbnail", style: Theme.of(context).textTheme.displaySmall),
                    const SizedBox(height: 8),
                    Column(
                      children: [
                        Container(
                          height: 60,
                          width: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                          ),
                          child: thumbnailFile == null
                              ? Container(
                                  width: 200,
                                  height: 120,
                                  color: Colors.white,
                                  child: const Center(child: Icon(Icons.image, color: Colors.grey)),
                                )
                              : Image.memory(
                                  thumbnailFile!,
                                  width: 200,
                                  height: 120,
                                  fit: BoxFit.cover,
                                ),
                        ),
                        const SizedBox(width: 12),
                        TextButton(
                          style: TextButton.styleFrom(foregroundColor: Colors.white),
                          onPressed: () => pickFile(context),
                          child: Text(
                            "Choose image",
                            style: Theme.of(context).textTheme.displaySmall,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Bouton Add new
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.PRIMARY_BLUE_COLOR, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                setState(() {
                  showVideoForm = !showVideoForm;
                });
              },
              child: Text(
                showVideoForm ? "Remove" : "Add new",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
