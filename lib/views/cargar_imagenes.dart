// ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'package:nuevo_proyecto_final/views/home.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  final ImagePicker _picker = ImagePicker();
  File? _imageFile;
  dynamic _pickImageError;
  String _classLabel = '';

  Future<void> _onFileButtonPressed() async {
    XFile? pickedFile;
    try {
      pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    } catch (e) {
      setState(() {
        _pickImageError = e;
      });
    }
    setState(() {
      _imageFile = pickedFile == null ? null : File(pickedFile.path);
    });
  }

  Widget _previewImage() {
    if (_imageFile != null) {
      return kIsWeb
          ? Image.network(
              _imageFile!.path,
              height: 300,
              width: 400,
            )
          : Image.file(
              _imageFile!,
              height: 300,
              width: 400,
            );
    } else if (_pickImageError != null) {
      return Text(
        'Pick image error: $_pickImageError',
        textAlign: TextAlign.center,
      );
    } else {
      return const Text(
        'No has cargado ninguna imagen.',
        textAlign: TextAlign.center,
      );
    }
  }

  classifyImage() async {
    if (_imageFile == null) return;
    var recognitions = await Tflite.runModelOnImage(
      path: _imageFile!.path,
      numResults: 5,
      threshold: 0.1,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    if (recognitions != null && recognitions.isNotEmpty) {
      setState(() {
        final prediction = recognitions[0]['label'];
        _classLabel = prediction;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }

  Future<void> loadModel() async {
    await Tflite.loadModel(
      model: 'assets/mobilenet_v2_1.0_224.tflite',
      labels: 'assets/imagenet_labels.txt',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cargar Imágenes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 300,
              width: 400,
              alignment: Alignment.center,
              child: _previewImage(),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: _onFileButtonPressed,
              style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 169, 173, 175)),
              child: const Text('Seleccionar imagen'),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: classifyImage,
              style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 169, 173, 175)),
              child: const Text('Clasificar'),
            ),
          ),
          const SizedBox(height: 10,),
          const Center(
            child: Text('Clase:'),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              _classLabel,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); //ir
                Navigator.push( //volver
                  context, 
                  MaterialPageRoute(builder: (_) => const Home())
                );
              },
              child: const Text('Regresar'),
            ),
          ),
        ],
      ),
    );
  }
}

