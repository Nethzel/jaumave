import 'package:flutter/material.dart';
import 'package:mave/paginas/negocios.dart';
import 'package:url_launcher/link.dart';

class SugerenciasPage extends StatelessWidget {
  const SugerenciasPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 236, 236),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title: Text(
          'Sugerencias'.toUpperCase(),
          style: const TextStyle(
            fontSize: 15,
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              showSearch(context: context, delegate: NegociosSearchDelegate());
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: const ListTile(
              title: Text(
                  'Para mayores sugerencias ingrese a nuestra pagina oficial, donde podras ver más contenido de Jaumave Tamaulipas:'),
            ),
          ),
        ],
      ));
}

Widget _boton(String nombre, String acronimo) {
  return InkWell(
    child: Container(
      width: 100,
      height: 100,
      child: Card(
          margin: const EdgeInsets.all(10.0),
          color: Colors.lightBlue,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(05.0)),
          elevation: 10.0,
          child: Link(
              target: LinkTarget.self,
              uri: Uri.parse('http://www.jaumave.gob.mx/'),
              builder: (context, followLink) => GestureDetector(
                    onTap: followLink,
                    child: Text(
                      '"Haz click aqui"',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ))),
    ),
  );
}
