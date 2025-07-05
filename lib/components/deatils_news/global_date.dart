import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/data/model/news_model.dart';

class NewsDate extends StatelessWidget {
  const NewsDate({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    DateTime dateTime = DateTime.parse(articles.publishedAt ?? '');
    String formatted = DateFormat.yMMMd().format(dateTime);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Opacity(
          opacity: 0.4,
          child: Text(
            formatted,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
