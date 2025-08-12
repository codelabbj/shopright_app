import 'package:e_com_app/pages/mobile/acceuil/widgets/search_widget.dart';
import 'package:flutter/material.dart';

import 'filter_bottomshet_wiget.dart';

class FilterSearchWidget extends StatelessWidget {
  const FilterSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: const SearchWidget()),
        SizedBox(
          width: 12,
        ),
        InkWell(
          onTap: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              builder: (context) => const FilterBottomSheet(),
            );
          },
          child: Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(color: Colors.black54),
            ),
            child: Icon(Icons.tune),
          ),
        )
      ],
    );
  }
}
