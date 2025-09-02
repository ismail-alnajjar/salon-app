import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CostumAddImage extends StatefulWidget {
  final double radius; // نصف قطر الصورة
  final File? initialImage; // صورة ابتدائية إذا وجدت
  final Function(File?)? onImageChanged; // Callback عند تغير الصورة

  const CostumAddImage({
    super.key,
    this.radius = 50,
    this.initialImage,
    this.onImageChanged,
  });

  @override
  State<CostumAddImage> createState() => _CostumAddImageState();
}

class _CostumAddImageState extends State<CostumAddImage> {
  File? _imageFile;

  @override
  void initState() {
    super.initState();
    _imageFile = widget.initialImage;
  }

  Future<void> _pickImage() async {
    try {
      final ImagePicker picker = ImagePicker();
      final XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
        if (widget.onImageChanged != null) {
          widget.onImageChanged!(_imageFile);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('لا يمكن الوصول إلى الصور على الجهاز')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _pickImage,
      child: CircleAvatar(
        radius: widget.radius,
        backgroundImage: _imageFile != null
            ? FileImage(_imageFile!)
            : const AssetImage('assets/profile.png') as ImageProvider,
        child: _imageFile == null
            ? const Icon(Icons.camera_alt, size: 40, color: Colors.white70)
            : null,
      ),
    );
  }
}
