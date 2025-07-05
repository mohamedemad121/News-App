import 'package:flutter/material.dart';

class RecommendationText extends StatelessWidget {
  const RecommendationText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Recommendtion',
          style: TextStyle(
            fontSize: 24,
            color: isdark ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        Text(
          'viewall',
          style: TextStyle(
            fontSize: 14,
            color: isdark ? Colors.orange : Colors.blue,
          ),
        ),
      ],
    );
  }
}
