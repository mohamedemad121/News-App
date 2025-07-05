import 'package:flutter/material.dart';

class RowText extends StatelessWidget {
  const RowText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Breaking News',
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
