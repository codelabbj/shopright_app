import 'package:e_com_app/widgets/custom_drop_menu.dart';
import 'package:e_com_app/widgets/customs_text_form_field.dart';
import 'package:flutter/material.dart';

class ProductDetailCard extends StatefulWidget {
  final String imageUrl;
  final String productId;
  final String productName;
  final String description;
  final String category;
  final double price;
  final String status;
  final int totalSales;
  final double revenue;
  final double conversion;
  final String performance;

  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onClose;

  const ProductDetailCard({
    Key? key,
    required this.imageUrl,
    required this.productId,
    required this.productName,
    required this.description,
    required this.category,
    required this.price,
    required this.status,
    required this.totalSales,
    required this.revenue,
    required this.conversion,
    required this.performance,
    this.onEdit,
    this.onDelete,
    this.onClose,
  }) : super(key: key);

  @override
  _ProductDetailCardState createState() => _ProductDetailCardState();
}

class _ProductDetailCardState extends State<ProductDetailCard> {
  late TextEditingController _idController;
  late TextEditingController _nameController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;

  late String _selectedCategory;
  late String _selectedStatus;

  @override
  void initState() {
    super.initState();

    _idController = TextEditingController(text: widget.productId);
    _nameController = TextEditingController(text: widget.productName);
    _descriptionController = TextEditingController(text: widget.description);
    _priceController = TextEditingController(text: widget.price.toString());

    _selectedCategory = widget.category;
    _selectedStatus = widget.status;
  }

  @override
  void dispose() {
    _idController.dispose();
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 10,
        child: Container(
          width: 800,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Title + Actions
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title + description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Product Detail",
                          style:
                              Theme.of(context).textTheme.labelSmall!.copyWith(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "This is all product information.",
                          style: Theme.of(context)
                              .textTheme
                              .labelSmall!
                              .copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),
                  // Buttons
                  Row(
                    children: [
                      // IconButton(
                      //   onPressed: widget.onEdit,
                      //   icon: Row(
                      //     children: [
                      //       Image.asset("assets/images/editer.png", width: 15, height: 15),
                      //       SizedBox(width: 5),
                      //       Text("Edit", style: Theme.of(context).textTheme.displaySmall),
                      //     ],
                      //   ),
                      // ),
                      // const SizedBox(width: 10),
                      IconButton(
                        onPressed: widget.onDelete,
                        icon: Row(
                          children: [
                            Image.asset("assets/images/supprimer.png",
                                width: 15, height: 15, color: Colors.red),
                            SizedBox(width: 5),
                            Text(
                              "Delete",
                              style: Theme.of(context)
                                  .textTheme
                                  .displaySmall!
                                  .copyWith(color: Colors.red),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 12),
                  IconButton(
                    onPressed: widget.onClose,
                    icon: Icon(
                      Icons.close,
                      size: 20,
                    ),
                  )
                ],
              ),
              Divider(
                color: Colors.grey[300],
              ),

              const SizedBox(height: 20),

              // Image + Stats + Info
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image + Stats
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 3,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child:
                                Image.asset(widget.imageUrl, fit: BoxFit.cover),
                          ),
                        ),
                        const SizedBox(height: 16),
                        _buildStats(context),
                      ],
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Info Fields
                  Expanded(
                    flex: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                          label: "Product ID",
                          hintText: "Enter product ID",
                          controller: _idController,
                        ),
                        CustomTextFormField(
                          label: "Product Name",
                          hintText: "Enter product name",
                          controller: _nameController,
                        ),
                        CustomTextFormField(
                          label: "Description",
                          hintText: "Enter description",
                          controller: _descriptionController,
                          isMultiline: true,
                        ),
                        CustomDropdownField(
                          label: "Category",
                          value: _selectedCategory,
                          items: ["Accessories", "Laptops", "Phones"],
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _selectedCategory = val;
                              });
                            }
                          },
                        ),
                        CustomTextFormField(
                          label: "Price",
                          hintText: "Enter price",
                          controller: _priceController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                        ),
                        CustomDropdownField(
                          label: "Status",
                          value: _selectedStatus,
                          items: ["Published", "Draft", "Archived"],
                          onChanged: (val) {
                            if (val != null) {
                              setState(() {
                                _selectedStatus = val;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStats(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Product Insight",
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const Spacer(),
              Icon(Icons.cloud_download_outlined, size: 18),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              _statCard("Total Sales", "${widget.totalSales} Unit", context),
              _statCard("Total Revenue",
                  "\$${widget.revenue.toStringAsFixed(0)}", context),
              _statCard("Conversion",
                  "${widget.conversion.toStringAsFixed(0)}%", context),
              _statCard("Performance", widget.performance, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _statCard(String title, String value, BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: Colors.grey,
                  fontSize: 12,
                ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
