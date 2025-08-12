import 'package:flutter/material.dart';

class FilterBarWidget extends StatelessWidget {
  const FilterBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Ligne supérieure des filtres
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildFilterButton(context, Icons.filter_list, "Filter"),
              // _buildFilterButton(context, Icons.star_border, "Ratings"),
              _buildFilterButton(context, null, "Size"),
              _buildFilterButton(context, Icons.color_lens_outlined, "Color"),
              _buildFilterButton(context, null, "Price"),
            ],
          ),
        ),
        const SizedBox(height: 20),

        // Ligne des catégories (avec icônes)
        SizedBox(
          height: 90,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryItem(
                  context, "assets/images/school_bag.jpg", "Bags"),
              _buildCategoryItem(
                  context, "assets/images/winter_cap.webp", "hats"),
              _buildCategoryItem(
                  context, "assets/images/wallets.webp", "Wallets"),
              _buildCategoryItem(
                  context, "assets/images/footwear.jpg", "Footwear"),
              _buildCategoryItem(
                  context, "assets/images/winter_hooby.webp", "Clothes"),
              _buildCategoryItem(
                  context, "assets/images/footwear.jpg", "Watches"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFilterButton(
      BuildContext context, IconData? icon, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          side: const BorderSide(color: Colors.grey),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        icon: icon == null
            ? SizedBox()
            : Icon(
                icon,
                size: 20,
                color: Colors.black,
              ),
        label: Text(label, style: Theme.of(context).textTheme.labelSmall),
      ),
    );
  }

  Widget _buildCategoryItem(
      BuildContext context, String iconPath, String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: AssetImage(iconPath),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style:
                Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
