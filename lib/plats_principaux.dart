import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';

class PlatsPrincipalesPage extends StatefulWidget {
  final String category;
  const PlatsPrincipalesPage({Key? key, required this.category}) : super(key: key);

  @override
  _PlatsPrincipalesPageState createState() => _PlatsPrincipalesPageState();
}

class _PlatsPrincipalesPageState extends State<PlatsPrincipalesPage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> plats = [
    {
      'name': 'Attiéké poisson braisé',
      'description': 'Poisson braisé servi avec de l\'attiéké, une semoule de manioc.',
      'prepTime': '60',
      'image': 'assets/Plat-principaux/atieke.jpg'
    },
    {
      'name': 'Placali',
      'description': 'Un plat à base de farine de manioc servi avec une sauce de votre choix.',
      'prepTime': '30',
      'image': 'assets/Plat-principaux/placali.jpeg'
    },
    {
      'name': 'Garba',
      'description': 'Attiéké servi avec du thon grillé et une sauce tomate-oignon.',
      'prepTime': '45',
      'image': 'assets/Plat-principaux/garba.jpeg'
    },
    {
      'name': 'Riz gras',
      'description': 'Un plat de riz cuit dans une sauce tomate avec de la viande et des épices.',
      'prepTime': '40',
      'image': 'assets/Plat-principaux/rizgras.jpeg'
    },
    {
      'name': 'To',
      'description': 'Une pâte de farine de maïs souvent servie avec une sauce.',
      'prepTime': '30',
      'image': 'assets/Plat-principaux/to.jpeg'
    },
    {
      'name': 'Riz sauce graine',
      'description': 'Riz servi avec une sauce à base de graine de palme.',
      'prepTime': '120',
      'image': 'assets/Plat-principaux/rizsaucegraine.jpeg'
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.orange, Colors.deepOrangeAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          title: const Text(
            'Plats principaux',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: plats.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 250,
                  height: 225,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange,
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: plats[index]),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            plats[index]['image'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          plats[index]['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          plats[index]['description'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 14.0),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home, color: Colors.white),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, color: Colors.white),
              label: 'Favoris',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.white),
              label: 'Profil',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white54,
          backgroundColor: Colors.orange,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
