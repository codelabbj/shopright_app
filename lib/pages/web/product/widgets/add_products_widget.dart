import 'package:flutter/material.dart';

class AddProductsWidget extends StatefulWidget {
  const AddProductsWidget({super.key});

  @override
  State<AddProductsWidget> createState() => _AddProductsWidgetState();
}

class _AddProductsWidgetState extends State<AddProductsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 10,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.blueAccent,
                ),
              ),
              child: Icon(
                Icons.add,
                color: Colors.blueAccent,
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.blueAccent,
                  ),
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
