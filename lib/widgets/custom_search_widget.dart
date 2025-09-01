import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomSearchWidget extends StatelessWidget {
  const CustomSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 7),
      width: 210,
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white, // Fond gris clair
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[200]!)),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        style: Theme.of(context).textTheme.labelSmall,
        decoration: InputDecoration(
          isDense: true,

          prefixIcon: Icon(
            Icons.search,
            size: 18,
          ),
          border: InputBorder.none, // Pas de bordure
          hintText: 'Search Anything...', // Texte d'exemple
        ),
      ),
    );
  }
}
