import 'package:flutter/material.dart';
import 'package:nuevo_proyecto_final/views/home.dart';

class CargarImagenes extends StatelessWidget {
  const CargarImagenes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Clasificar Imágenes'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: SizedBox(
              width: 250, 
              height: 50, 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); //ir
                  Navigator.push( //volver
                    context, 
                    MaterialPageRoute(builder: (_) => const Home())
                  );
                },
                child: const Text(
                  'REGRESAR',
                  style: TextStyle(fontSize: 25),
                ),
              ),
            ),
          ),
        ]
      )
    );
  }
}