import 'package:flutter/material.dart';

import '../../../../../models/reviews_model.dart';

class ReviewItem extends StatelessWidget {
  final ReviewsModel review;

  const ReviewItem({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(backgroundImage: NetworkImage(review.avatarUrl)),
      title: Row(
        children: [
          Expanded(child: Text(review.name, style: Theme.of(context).textTheme.labelSmall!.copyWith(fontWeight: FontWeight.bold))),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < review.rating ? Icons.star : Icons.star_border,
                color: Colors.orange,
                size: 18,
              ),
            ),
          )
        ],
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            review.comment,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(height: 4),
          Row(
            children: [
              Text(review.timeAgo, style: Theme.of(context).textTheme.labelSmall!.copyWith(color: Colors.grey, fontSize: 12)),
              SizedBox(width: 8),
              InkWell(
                onTap: () {},
                child: Text(
                  review.product,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(color: Colors.blue),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
