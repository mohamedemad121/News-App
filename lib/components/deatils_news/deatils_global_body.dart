import 'package:flutter/material.dart';
import 'package:newsapp/components/deatils_news/global_date.dart';
import 'package:newsapp/components/deatils_news/global_text.dart';
import 'package:newsapp/components/deatils_news/image_global.dart';
import 'package:newsapp/components/deatils_news/news_global_icon.dart';
import 'package:newsapp/data/model/news_model.dart';

class DeatilsNewsBody extends StatelessWidget {
  const DeatilsNewsBody({super.key, required this.articles});
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start ,
      children: [
        ImageNews(articles: articles),
        SizedBox(height: 10),
        NewsIcon(articles: articles),
        SizedBox(height: 10),
        NewsText(articles: articles),
        SizedBox(height: 10),
        NewsDate(articles: articles),
      ],
    );
  }
}
