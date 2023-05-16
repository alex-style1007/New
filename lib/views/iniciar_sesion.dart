import 'package:flutter/material.dart';
import 'package:nuevo_proyecto_final/views/home.dart';

class IniciarSesion extends StatefulWidget {
  const IniciarSesion({super.key});

  @override
  State<IniciarSesion> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<IniciarSesion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
                'Clasificador de Imágenes',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
          const SizedBox(height: 40,),
          const Center(
            child: Text(
                'USUARIO',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nombre de Usuario',
              ),
              onSaved: (String? value) {},
              validator: (String? value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },
            ),
          ),
          const SizedBox(height: 30,),
          const Center(
            child: Text(
                'CONTRASEÑA',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
          ),
          const SizedBox(height: 10,),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: const InputDecoration(
                labelText: 'Contraseña',
              ),
              onSaved: (String? value) {},
              validator: (String? value) {
                return (value != null && value.contains('@')) ? 'Do not use the @ char.' : null;
              },
              obscureText: true
            ),
          ),
          const SizedBox(height: 40,),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); //ir
              Navigator.push( //volver
                context, 
                MaterialPageRoute(builder: (_) => const Home())
              );
            },
            child: const Text(
              'INGRESAR', 
              style: TextStyle(fontSize: 25),
            ),
          )
        ],
      ),
    );
  }
}