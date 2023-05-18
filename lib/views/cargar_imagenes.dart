//ignore_for_file: deprecated_member_use

import 'dart:async';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nuevo_proyecto_final/views/home.dart';

class Picker extends StatefulWidget {
  const Picker({Key? key}) : super(key: key);

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  final ImagePicker _picker = ImagePicker();
  List<XFile>? _imageFileList;
  dynamic _pickImageError;

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
      _imageFileList = pickedFile == null ? null : <XFile>[pickedFile];
    });
  }

  Widget _previewImages() {
    if (_imageFileList != null) {
      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return kIsWeb
              ? Image.network(
                  _imageFileList![index].path,
                  height: 300,
                  width: 400,
                )
              : Image.file(
                  File(_imageFileList![index].path),
                  height: 300,
                  width: 400,
                );
        },
        itemCount: _imageFileList!.length,
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
              child: _previewImages(),
            ),
          ),
          const SizedBox(height: 20,),
          Center(
            child: ElevatedButton(
              onPressed: _onFileButtonPressed,
              style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 169, 173, 175)),
              child: const Text('Seleccionar imagen'),
            ),
          ),
          const SizedBox(height: 40,),
          Center(
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context); //ir
                Navigator.push( //volver
                  context, 
                  MaterialPageRoute(builder: (_) => const Home())
                );
              },
              style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 169, 173, 175)),
              child: const Text('Clasificar'),
            ),
          ),
          const SizedBox(height: 40,),
          const Center(
            child: Text('Clase: _______________')
          ),
          const SizedBox(height: 40,),
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
