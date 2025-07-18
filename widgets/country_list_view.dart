import 'package:flutter/material.dart';
import 'country_card.dart';

class CountryListView extends StatelessWidget {
  final List<Map<String, String>> countries;
  final Function(String) onCountryTap;

  const CountryListView({
    super.key,
    required this.countries,
    required this.onCountryTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: countries
            .map(
              (country) => CountryCard(
                emoji: country["emoji"]!,
                name: country["name"]!,
                onTap: () => onCountryTap(country["name"]!),
              ),
            )
            .toList(),
      ),
    );
  }
}