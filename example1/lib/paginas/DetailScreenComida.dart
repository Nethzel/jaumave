import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class DetailScreenComida extends StatefulWidget {

  final String asset;
  final String tag;
  final String fullDesc;
  final String descoment;
  final String contacto1;
  final String contacto2;
  final String contacto3;
  final String map;

  const DetailScreenComida(
      {Key? key,
      required this.asset,
      required this.tag,
      required this.fullDesc,
      required this.descoment,
      required this.contacto1,
      this.contacto2 = '',
      this.contacto3 = '',
      this.map = ""
      })
      : super(key: key);
  

  @override
  State<DetailScreenComida> createState() => _DetailScreenComidaState();
}

class _DetailScreenComidaState extends State<DetailScreenComida> {
  double screenWidth = 0;
  double screenHeight = 0;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: widget.tag,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(40),
                  bottomLeft: Radius.circular(40),
                ),
                child: SizedBox(
                  height: screenHeight / 2.2,
                  width: screenWidth,
                  child: Image.network(
                    //"lib/images/${widget.asset}",
                    "https://api.jaumaveonline.com:8463/optimize/${widget.asset}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 20,
              ),
              child: Text(
                widget.tag,
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  fontSize: 30,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
              ),
              child: Text(
                'Descripción ${widget.fullDesc}',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 20,
              ),
              child: const Text(
                "Ubicación",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 10,
              ),
              child: Text(
                widget.descoment,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 20,
              ),
              child: const Text(
                "Contactos",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Colors.black87,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth / 20,
                vertical: 0,
              ),
              child: Text(
                widget.contacto1,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                  fontSize: 16,
                ),
              ),
            ),
            // create a button for launch google maps
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth / 20,
                  vertical: 20,
                ),
                child: ElevatedButton(
                  
                  onPressed: () async {

                  },
                  child: Link(
                      target: LinkTarget.self,
                      uri: Uri.parse(widget.map),
                      builder: (context, followLink) => GestureDetector(
                      onTap: followLink,
                      child: const Text('Ver en mapa'),
                      ))
                ),
              ),
          ],
        ),
      ),
    );
  }
}

//
