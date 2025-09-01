import 'package:flutter/material.dart';

import '../../../../theme/app_colors.dart';
import '../../../../widgets/custom_drop_menu.dart';

class FilterPanelWidget extends StatelessWidget {
  final String selectedStatus;
  final String selectedCondition;
  final String selectedValue;

  final ValueChanged<String?> onStatusChanged;
  final ValueChanged<String?> onConditionChanged;
  final ValueChanged<String?> onValueChanged;
  final VoidCallback onApply;
  final VoidCallback onClose;

  final List<Widget> additionalFilters;
  final VoidCallback onAddFilter;

  const FilterPanelWidget({
    super.key,
    required this.selectedStatus,
    required this.selectedCondition,
    required this.selectedValue,
    required this.onStatusChanged,
    required this.onConditionChanged,
    required this.onValueChanged,
    required this.onApply,
    required this.onClose,
    required this.additionalFilters,
    required this.onAddFilter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 330 + (additionalFilters.length * 80),
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text("Filters", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const Spacer(),
              InkWell(onTap: onClose, child: const Icon(Icons.close)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: CustomDropdownField(
                  label: "Status",
                  value: selectedStatus,
                  items: ["Status", "Date", "Amount"],
                  onChanged: onStatusChanged,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: CustomDropdownField(
                  label: "Condition",
                  value: selectedCondition,
                  items: ["Less than", "Equal", "Greater than"],
                  onChanged: onConditionChanged,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          CustomDropdownField(
            label: "Value",
            value: selectedValue,
            items: ["Draft", "Pending", "Approved"],
            onChanged: onValueChanged,
          ),
          const SizedBox(height: 12),
          ...additionalFilters,
          const SizedBox(height: 10),
          Row(
            children: [
              ElevatedButton(
                onPressed: onAddFilter,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.PRIMARY_BLUE_COLOR,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Add Additional Filter",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: onApply,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.PRIMARY_BLUE_COLOR,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Apply",
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),

              // Container(
              //   padding: EdgeInsets.all(5),
              //   decoration: BoxDecoration(border: Border.all(color: Colors.grey[200]!), borderRadius: BorderRadius.circular(5)),
              //   child: Row(
              //     children: [
              //       Image.asset(
              //         "assets/images/reload.png",
              //         width: 18,
              //         height: 18,
              //         color: Colors.black,
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
