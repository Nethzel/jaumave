/* import 'dart:io'; */
import 'package:flutter/material.dart';
/* import 'package:mave/main.dart'; */

import 'package:url_launcher/link.dart';

class Usercontactos extends StatelessWidget {
  const Usercontactos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        
        
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0), 
          child: Scaffold(
          body: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const ListTile(
                  title: Text('R. Ayuntamiento de Jaumave Tamaulipas'),
                  subtitle: Text('Teléfono: (832) 336 0119'),
                  leading: Icon(
                    Icons.add_to_home_screen,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const ListTile(
                  title: Text('Numero De Emergencias'),
                  subtitle: Text('Teléfono: 911'),
                  leading: Icon(
                    Icons.add_to_home_screen,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const ListTile(
                  title: Text('Denuncia Anonima'),
                  subtitle: Text('Teléfono: 089'),
                  leading: Icon(
                    Icons.add_to_home_screen,
                    color: Colors.black,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: const ListTile(
                  title: Text('Atención Ciudadana'),
                  subtitle: Text('Teléfono: (800) 6333 3333'),
                  leading: Icon(
                    Icons.add_to_home_screen,
                    color: Colors.black,
                  ),
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  Padding(
                    padding: EdgeInsets.all(20.0),

                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    ElevatedButton(
                      onPressed: () {
                          
                      }, 
                      style: ElevatedButton.styleFrom(
                        shape: const CircleBorder(),
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Colors.black, // <-- Button color
                        foregroundColor: Colors.red, // <-- Splash color
                      ),
                      child: Link(
                        target: LinkTarget.self,
                        uri: Uri.parse("http://www.jaumave.gob.mx/"),
                        builder: (context, followLink) => GestureDetector(
                        onTap: followLink,
                        child: const Icon(Icons.link_sharp , color: Colors.white),
                      )
                        //const Icon(Icons.link_sharp , color: Colors.white)
                      ),
                    )
                ],
              )
            ],
          ),
        )
        )
      );
  }
}

