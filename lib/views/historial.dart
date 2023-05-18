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
            height: 200, // Establece la altura máxima de la tabla
            width: 350,
            child: SingleChildScrollView(
              child: Table(// Establece el estilo de la tabla
                border: TableBorder.all(),
                children: const [
                  TableRow(
                    children: [
                      TableCell( // Celda 1, columna 1
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('aqui va la foto')),
                        ),
                      ),
                      TableCell( // Celda 1, columna 2
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('animal 1')),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell( // Celda 2, columna 1
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('aqui va la foto')),
                        ),
                      ),
                      TableCell(// Celda 2, columna 2
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('animal 2')),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      TableCell( // Celda 3, columna 1
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('aqui va la foto')),
                        ),
                      ),
                      TableCell( // Celda 3, columna 2
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('animal 3')),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [ 
                      TableCell(// Celda 4, columna 1
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('aqui va la foto')),
                        ),
                      ),
                      TableCell(// Celda 4, columna 2
                        child: SizedBox(
                          height: 50,
                          child: Center(child: Text('animal 4')),
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