import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/components/deatils_news/deatils_global_body.dart';
import 'package:newsapp/data/model/news_model.dart';

class DeatilsNews extends StatelessWidget {
  const DeatilsNews({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: isdark ? Colors.black : Colors.white,
        leading: GestureDetector(
          onTap: () {
            context.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: isdark ? Colors.orange : Colors.blue,
          ),
        ),
        centerTitle: true,
        title: Text(
          'Details',
          style: TextStyle(
            color: isdark ? Colors.orange : Colors.blue,
            fontSize: 28,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: DeatilsNewsBody(articles: articles),
      ),
    );
  }
}
