// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:nuevo_proyecto_final/views/cargar_imagenes.dart';
import 'package:nuevo_proyecto_final/views/historial.dart';
import 'iniciar_sesion.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150),
            Center(
              child: SizedBox(
                width: 250, 
                height: 50, 
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); //ir
                    Navigator.push( //volver
                      context, 
                      MaterialPageRoute(builder: (_) => const CargarImagenes())
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 169, 173, 175)),
                  child: const Text(
                    'CLASIFICAR',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 250, 
                height: 50, 
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); //ir
                    Navigator.push( //volver
                      context, 
                      MaterialPageRoute(builder: (_) => const Historial())
                    );
                  },
                  style: ElevatedButton.styleFrom(primary: const Color.fromARGB(255, 169, 173, 175)),
                  child: const Text(
                    'HISTORIAL',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 200),
            Center(
              child: SizedBox(
                width: 250, 
                height: 50, 
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); //ir
                    Navigator.push( //volver
                      context, 
                      MaterialPageRoute(builder: (_) => const IniciarSesion())
                    );
                  },
                  child: const Text(
                    'CERRAR SESIÓN',
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}