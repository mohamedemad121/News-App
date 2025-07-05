import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsapp/data/model/news_model.dart';

class NewsIcon extends StatelessWidget {
  const NewsIcon({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final isdark = Theme.of(context).brightness == Brightness.dark;
    return Row(
      children: [
        Icon(
          FontAwesomeIcons.circleUser,
          color: isdark ? Colors.orange : Colors.blue,
        ),
        SizedBox(width: 10),
        Opacity(
          opacity: 0.4,
          child: Text(
            articles.source!.name??'',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
      ],
    );
  }
}
