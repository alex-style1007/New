// ignore_for_file: unnecessary_string_escapes

import 'package:flutter/material.dart';
import 'package:nuevo_proyecto_final/views/home.dart';

class Historial extends StatelessWidget {
  const Historial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Historial'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 400, // Establece la altura máxima de la tabla
            width: 350,
            child: SingleChildScrollView(
              child: Table(// Establece el estilo de la tabla
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCell( // Celda 1, columna 1
                        child: SizedBox(
                          child: Center(child: Image(image: AssetImage('lib/imagenes_historial/jirafa.png'))),
                        ),
                      ),
                      TableCell( // Celda 1, columna 2
                        child: SizedBox(
                          child: Center(child: Text('Jirafa')),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell( // Celda 2, columna 1
                        child: SizedBox(
                          child: Center(child: Image(image: AssetImage('lib/imagenes_historial/leon.png'))),
                        ),
                      ),
                      TableCell(// Celda 2, columna 2
                        child: SizedBox(
                          child: Center(child: Text('León')),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell( // Celda 3, columna 1
                        child: SizedBox(
                          child: Center(child: Image(image: AssetImage('lib/imagenes_historial/perro.png'))),
                        ),
                      ),
                      TableCell( // Celda 3, columna 2
                        child: SizedBox(
                          child: Center(child: Text('Perro')),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [ 
                      TableCell(// Celda 4, columna 1
                        child: SizedBox(
                          child: Center(child: Image(image: AssetImage('lib/imagenes_historial/sapo.png'))),
                        ),
                      ),
                      TableCell(// Celda 4, columna 2
                        child: SizedBox(
                          child: Center(child: Text('Sapo')),
                        ),
                      ),
                    ],
                  ),
                ],
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