import 'package:flutter/material.dart';
import '../../../../../theme/app_colors.dart';

class ValidationWidget extends StatelessWidget {
  const ValidationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isDark ? Color(0xFF1A2532) : Colors.white, // ✅ fond adaptatif
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: isDark ? Colors.black.withOpacity(0.2) : Colors.grey.withOpacity(0.1), // ✅ ombre plus sombre en dark mode
            spreadRadius: 5,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Publish",
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.black, // ✅ titre visible
                ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 5,
            runSpacing: 10,
            children: [
              // Bouton principal (bleu)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.PRIMARY_BLUE_COLOR,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),

              // Bouton secondaire (fond clair/foncé)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isDark
                        ? Colors.grey[700] // ✅ fond gris foncé en dark
                        : AppColors.PRIMARY_WHITE_LIGHT,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Save & Exit",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          color: isDark ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
