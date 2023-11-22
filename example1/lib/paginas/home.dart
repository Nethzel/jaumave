import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:mave/paginas/contactos.dart';
import 'package:mave/paginas/favoritos.dart';
import 'package:mave/paginas/negocios.dart';
import 'package:mave/paginas/principal.dart';
import 'package:mave/paginas/eventos.dart';
import 'package:mave/widgets/navigation_drawer_widget.dart';
//import 'package:mave/widgets/shared/theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;


  final List<Widget> _pages = [
    Userprincipal(),
    const Usereventos(),
    const Userfavorites(),
    const Usercontactos(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_selectedIndex],
      
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        elevation: 0.0,
        title:  Text(
          'Jaumave Tamaulipas'.toUpperCase(),
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
      // ignore: prefer_const_constructors
      drawer:  NavigationDrawerWidget(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: GNav(
            backgroundColor: const Color.fromARGB(255, 255, 255, 255),
            color: Colors.black,
            activeColor: const Color.fromARGB(255, 255, 255, 255),
            tabBackgroundColor: Colors.black,
            gap: 0,
            onTabChange: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            padding: const EdgeInsets.all(16),

            tabs: const [
              GButton(
                icon: Icons.home,
                text: ' Principal',
              ),
              GButton(
                icon: Icons.event,
                text: ' Eventos',
              ),
              GButton(
                icon: Icons.favorite_outline,
                text: ' Favoritos',
              ),
              GButton(
                icon: Icons.phone_callback_sharp,
                text: ' Contactos',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => const Drawer(
        child: Icon(Icons.menu_book_rounded),
      );
}
