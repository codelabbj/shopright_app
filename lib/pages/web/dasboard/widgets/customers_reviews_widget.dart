import 'package:e_com_app/pages/web/dasboard/widgets/reviews_item.dart';
import 'package:flutter/material.dart';

import '../../../../models/reviews_model.dart';

class CustomerReviewsWidget extends StatelessWidget {
  final List<ReviewsModel> reviews = [
    ReviewsModel(
      name: "Shea Batz",
      rating: 3,
      comment: "Great E-commerce system. And much more : Wonderful Customer...",
      timeAgo: "2 weeks ago",
      product: "Samsung Galaxy...",
      avatarUrl: "https://img.freepik.com/vecteurs-premium/garcon-capuche-qui-dit-il-est-garcon_1230457-43316.jpg",
    ),
    ReviewsModel(
      name: "Dr. Gonzalo Kertzmann",
      rating: 4,
      comment: "Second or third time that I buy a Botble product, happy with...",
      timeAgo: "2 weeks ago",
      product: "Samsung Galaxy...",
      avatarUrl: "https://img.freepik.com/vecteurs-premium/garcon-capuche-qui-dit-il-est-garcon_1230457-43316.jpg",
    ),
    ReviewsModel(
      name: "Miss Euna Cronin",
      rating: 3,
      comment: "Clean & perfect source code",
      timeAgo: "2 weeks ago",
      product: "Samsung Galaxy...",
      avatarUrl: "https://img.freepik.com/vecteurs-premium/garcon-capuche-qui-dit-il-est-garcon_1230457-43316.jpg",
    ),
    ReviewsModel(
      name: "Mr. Dane Tromp",
      rating: 4,
      comment: "Second or third time that I buy a Botble product, happy with...",
      timeAgo: "2 weeks ago",
      product: "Samsung Galaxy...",
      avatarUrl: "https://img.freepik.com/vecteurs-libre/illustration-du-jeune-homme-souriant_1308-174669.jpg",
    ),
    ReviewsModel(
      name: "Ms. Marisa Block Jr.",
      rating: 4,
      comment: "Cool template. Excellent code quality. The support responds...",
      timeAgo: "2 weeks ago",
      product: "Samsung Galaxy...",
      avatarUrl: "https://img.freepik.com/vecteurs-libre/illustration-du-jeune-homme-souriant_1308-174669.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 15),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.star, color: Colors.orange),
            title: Text("Customer Reviews", style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold)),
          ),
          Divider(),
          ...reviews.map((review) => ReviewItem(review: review)).toList(),
          Divider(),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {},
              child: Text(
                "View All Products",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ),
          )
        ],
      ),
    );
  }
}
