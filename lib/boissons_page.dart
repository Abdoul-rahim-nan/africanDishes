import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';

class BoissonsPage extends StatefulWidget {
  final String category;

  const BoissonsPage({Key? key, required this.category}) : super(key: key);

  @override
  _BoissonsPageState createState() => _BoissonsPageState();
}

class _BoissonsPageState extends State<BoissonsPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Map<String, dynamic>> boissons = [
    {
      'name': 'Bissap',
      'description': 'Une boisson rafraîchissante à base de fleurs d\'hibiscus.',
      'prepTime': '40',
      'image': 'assets/Boisson/Bissap.jpg',
    },
    {
      'name': 'Jus de mangue',
      'description': 'Un jus de fruits frais à base de mangues mûres.',
      'prepTime': '15',
      'image': 'assets/Boisson/mangue.jpg',
    },
    {
      'name': 'Jus de gingembre',
      'description': 'Une boisson épicée à base de gingembre frais.',
      'prepTime': '35',
      'image': 'assets/Dessert/i183186-jus-de-gingembre-au-thermomix.jpeg',
    },
    {
      'name': 'Jus d’ananas',
      'description': 'Un jus de fruits frais à base d\'ananas mûr.',
      'prepTime': '15',
      'image': 'assets/Boisson/ananas.jpg',
    },
    {
      'name': 'Jus d’orange',
      'description': 'Un jus de fruits frais à base d\'oranges.',
      'prepTime': '10',
      'image': 'assets/Boisson/orange.jpg',
    },
  ];

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
            'Boissons',
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
          itemCount: boissons.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Container(
                  width: 250,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.orange, width: 2),
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.orange, // Définir la couleur de fond du conteneur
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Couleur du texte en blanc
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RecipeDetailPage(recipe: boissons[index]),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            boissons[index]['image'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          boissons[index]['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          boissons[index]['description'],
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
