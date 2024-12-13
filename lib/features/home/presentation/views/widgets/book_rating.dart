import 'package:bookly/core/utils/style.dart';
import 'package:flutter/material.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    required this.count,
    required this.rate,
  });

  final String count;
  final String rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.star,
          color: Colors.amber,
          size: 18,
        ),
        Text(rate, style: Styles.textStyle16),
        const SizedBox(width: 10),
        Text("($count) ", style: Styles.textStyle16),
      ],
    );
  }
}
