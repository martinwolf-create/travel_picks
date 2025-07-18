import 'package:flutter/material.dart';
import '../countries.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final List<String> favorites = [];

  void toggleFavorite(String country) {
    setState(() {
      if (favorites.contains(country)) {
        favorites.remove(country);
      } else {
        favorites.add(country);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Travel Picks')),
      body: ListView(
        children: [
          for (var continent in countriesByContinent.keys) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                continent,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (var country in countriesByContinent[continent]!)
                    GestureDetector(
                      onTap: () => toggleFavorite(country),
                      child: Card(
                        margin: const EdgeInsets.all(8),
                        elevation: 4,
                        child: Container(
                          width: 120,
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                country,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Icon(
                                favorites.contains(country)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: favorites.contains(country)
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              'Deine Favoriten:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          if (favorites.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text('Noch keine Favoriten ausgewählt.'),
            )
          else
            Wrap(
              spacing: 8,
              children: favorites
                  .map(
                    (country) => Chip(
                      label: Text(country),
                      deleteIcon: const Icon(Icons.close),
                      onDeleted: () => toggleFavorite(country),
                    ),
                  )
                  .toList(),
            ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Reisen'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoriten',
          ),
        ],
      ),
    );
  }
}
