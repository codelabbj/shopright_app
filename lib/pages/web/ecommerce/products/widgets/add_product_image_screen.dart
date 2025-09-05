import 'package:flutter/material.dart';

class AddProductImageScreen extends StatefulWidget {
  const AddProductImageScreen({super.key});

  @override
  State<AddProductImageScreen> createState() => _AddProductImageScreenState();
}

class _AddProductImageScreenState extends State<AddProductImageScreen> {
  // Liste simulée d'images (dans ton vrai projet, remplace avec des assets ou des URLs)
  final List<String> _images = [
    'assets/images/winter_cap.webp',
    'assets/images/winter_hooby.webp',
    'assets/images/wallets.webp',
    'assets/images/footwear.jpg',
    'assets/images/winter_hooby.webp',
    'assets/images/footwear.jpg',
  ];

  // L’image principale sélectionnée (par défaut la première)
  late String _selectedImage;

  @override
  void initState() {
    super.initState();
    _selectedImage = _images[0];
  }

  void _onAddImage() {
    // Tu peux intégrer image_picker ici
    print('Ajouter une image');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      padding: const EdgeInsets.all(20),
      height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 3), // Décalage horizontal et vertical de l'ombre
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Product Image",
            style: Theme.of(context).textTheme.labelSmall!.copyWith(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text("Set your thumbnail product.", style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey)),
          const SizedBox(height: 16),

          // Image principale affichée
          Expanded(
            flex: 3,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade100,
                image: DecorationImage(
                  image: AssetImage(_selectedImage),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Miniatures + Ajouter
          Expanded(
            flex: 2,
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                ..._images.map((img) => GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = img;
                        });
                      },
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: _selectedImage == img ? Colors.blue : Colors.transparent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.shade100,
                          image: DecorationImage(
                            image: AssetImage(img),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )),

                // Bouton +
                GestureDetector(
                  onTap: _onAddImage,
                  child: DottedBorderBox(
                    child: const Icon(Icons.add, color: Colors.blue, size: 30),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget personnalisé pour bordure en pointillés (tu peux installer dotted_border)
class DottedBorderBox extends StatelessWidget {
  final Widget child;
  const DottedBorderBox({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue.shade200,
          width: 2,
          style: BorderStyle.solid, // Change pour un vrai effet "dotted" si nécessaire
        ),
        borderRadius: BorderRadius.circular(8),
        color: Colors.blue.shade50.withOpacity(0.3),
      ),
      child: Center(child: child),
    );
  }
}
