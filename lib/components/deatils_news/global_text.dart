import 'package:flutter/material.dart';
import 'package:newsapp/data/model/news_model.dart';

class NewsText extends StatelessWidget {
  const NewsText({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Text(
      articles.description??'',
      style: TextStyle(color: isdark ? Colors.white : Colors.black),
    );
  }
}
