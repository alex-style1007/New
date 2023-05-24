// ignore_for_file: deprecated_member_use, avoid_print, non_constant_identifier_names

import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuevo_proyecto_final/views/home.dart';
import 'package:http/http.dart' as http;

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  File? _imageFile;
  dynamic _pickImageError;
  String _classLabel = '';
  XFile? file;
  Uint8List imageForSendToAPI = Uint8List(8);

  _imgFromGallery() async {
   final temp = (await ImagePicker().getImage(source:ImageSource.gallery));
   imageForSendToAPI = await temp!.readAsBytes();
   setState(() {_imageFile = File(temp.path);});
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

    var request = http.MultipartRequest('POST', Uri.parse('http://localhost:5000/upload'));
    request.files.add(http.MultipartFile.fromBytes('image', imageForSendToAPI,filename: 'imageForSendToAPI'));
    var response = await request.send();
    var temporal_label = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      print('Image uploaded successfully');
    } else {
      print('Image upload failed with status ${response.statusCode}');
    }

    setState(() {
      _classLabel = temporal_label;
    });
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
              onPressed: _imgFromGallery,
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

