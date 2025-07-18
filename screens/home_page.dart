import 'package:flutter/material.dart';
import '../widgets/country_card.dart';
import '../widgets/section_title.dart';
import '../widgets/country_list_view.dart';
import '../widgets/travel_header_card.dart';
import '../widgets/favorite_count_badge.dart';
import '../data/countries.dart';

class TravelHomePage extends StatefulWidget {
  const TravelHomePage({super.key});

  @override
  State<TravelHomePage> createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  final List<String> _selectedCountries = [];

  void _addCountry(String countryName) {
    if (!_selectedCountries.contains(countryName)) {
      setState(() {
        _selectedCountries.add(countryName);
      });
    }
  }

  void _showFavorites() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Favoriten: ${_selectedCountries.join(', ')}"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TravelHeaderCard(),
              const SizedBox(height: 24),
              const SectionTitle("Europa"),
              CountryListView(
                countries: europeCountries,
                onCountryTap: _addCountry,
              ),
              const SizedBox(height: 24),
              const SectionTitle("Südamerika"),
              CountryListView(
                countries: southAmericaCountries,
                onCountryTap: _addCountry,
              ),
              const SizedBox(height: 24),
              const SectionTitle("Favoriten"),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                children: _selectedCountries
                    .map((name) => Chip(label: Text(name)))
                    .toList(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
        FavoriteCountBadge(
          count: _selectedCountries.length,
          onTap: _showFavorites,
        ),
      ],
    );
  }
}