import 'package:flutter/material.dart';
import 'package:mave/paginas/negocios.dart';
import 'package:mave/widgets/item.dart';
import 'package:mave/paginas/principal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HospedajeScreen extends StatefulWidget {
  const HospedajeScreen({Key? key, required this.category}) : super(key: key);
  final Categoryy category;

  @override
  State<HospedajeScreen> createState() => _HospedajeScreenState();

 
}

class _HospedajeScreenState extends State<HospedajeScreen> {
  double screenWidth = 0;
  double screenHeight = 0;

  Future<List<dynamic>> getHospedaje()  async {

        final response = await http.get(Uri.parse('https://api.jaumaveonline.com:8463/api/post?section=Hospedaje'));

        if (response.statusCode == 200) {
            var data = jsonDecode(response.body) as List;
            return data;
        } else {
            // If the server did not return a 200 OK response,
            // then throw an exception.
            throw Exception('Failed to load album');
        }
  }

  @override
    void initState() {
        super.initState();
        getHospedaje();
    }



  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;


    final Future<List<dynamic>> restaurantes = getHospedaje();
    return Scaffold(
            appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title:  Text(
          'Hospedajes'.toUpperCase(),
          style: const TextStyle(
              fontSize: 15,
              fontFamily: 'Montserrat',
              color:  Colors.black,
              fontWeight: FontWeight.bold,
            ),
        ),
        
        backgroundColor:  Colors.white,
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
            body: FutureBuilder<List<dynamic>>(
                future: restaurantes,
                builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                    return const Center(child: Text('Error al cargar datos'));
                } else {
                        //SingleChildScrollView
                    return Scaffold(
                    body: SingleChildScrollView(
                    child: SafeArea(
                        child: Padding(
                        padding: EdgeInsets.symmetric( vertical: 10, horizontal: screenWidth / 25),
                        child: Column(
                        children: [
                            ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: snapshot.data?.length ?? 0,
                                itemBuilder: (context, index) {
                                    var restaurante = snapshot.data?[index];
                                    return ItemWidget(
                                        id: restaurante['_id'],
                                        asset: restaurante['image'],
                                        title: restaurante['title'],
                                        desc: restaurante['details'],
                                        fullDesc: restaurante['description'],
                                        ubicacion: restaurante['location'],
                                        contactos1: restaurante['contact'],
                                        map: restaurante['map'],
                                        onFavoritePressed: () {
                                          // Cuando el botón de favoritos es presionado en ItemWidget,
                                          // elimina el elemento de la lista y actualiza el estado
                                          setState(() {
                                            snapshot.data?.removeAt(index);
                                          });
                                        },
                                    );
                                },
                            ),
                        ],
                        ),
                    ),
                    ),

                    ),
                );
                }
                },
            ),
            );
        }
}
