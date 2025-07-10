import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: TextField(
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          hintText: 'Search',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.black, // Couleur de la bordure
              width: 1.5, // Épaisseur de la bordure
            ),
          ),
          prefixIcon: Icon(Icons.search, color: Colors.black),
        ),
      ),
    );
  }
}
