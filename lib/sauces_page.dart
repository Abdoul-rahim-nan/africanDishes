import 'package:flutter/material.dart';
import 'recipe_detail_page.dart';

class SaucePage extends StatefulWidget {
  final String category;
  const SaucePage({Key? key, required this.category}) : super(key: key);

  @override
  _SaucePageState createState() => _SaucePageState();
}

class _SaucePageState extends State<SaucePage> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> sauces = [
    {
      'name': 'Sauce graine',
      'description': 'Une sauce à base de graine de palme, souvent servie avec du riz ou du couscous.',
      'prepTime': '90',
      'image': 'assets/Sauce/sauce-graine-recette-ivoirenne.jpg'
    },
    {
      'name': 'Babenda',
      'description': 'Un plat à base de feuilles vertes et de riz mouillé et concassé, avec de l\'arachide.',
      'prepTime': '60',
      'image': 'assets/Sauce/babenda.jpeg'
    },
    {
      'name': 'Pâte d’arachide',
      'description': 'Une sauce savoureuse à base de pâte d\'arachide, souvent servie avec du riz.',
      'prepTime': '20',
      'image': 'assets/Sauce/pattedarride.jpeg'
    },
    {
      'name': 'Sauce feuille',
      'description': 'Une sauce à base de feuilles de manioc et de pâte d\'arachide.',
      'prepTime': '75',
      'image': 'assets/Sauce/saucefeuille.jpeg'
    },
    {
      'name': 'Sauce yassa',
      'description': 'Une sauce à base d\'oignons marinés et de poulet.',
      'prepTime': '120',
      'image': 'assets/Sauce/yassa.jpeg'
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
            'Sauces',
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
          itemCount: sauces.length,
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
                          builder: (context) => RecipeDetailPage(recipe: sauces[index]),
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ClipOval(
                          child: Image.asset(
                            sauces[index]['image'],
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          sauces[index]['name'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(
                          sauces[index]['description'],
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
