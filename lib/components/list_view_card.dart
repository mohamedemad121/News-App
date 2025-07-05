import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/components/loading_indicator.dart';
import 'package:newsapp/data/model/news_model.dart';

class ListViewCard extends StatelessWidget {
  const ListViewCard({super.key, required this.articles});
  final Articles articles;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;

    DateTime dateTime = DateTime.parse(articles.publishedAt?? '');
    String formatted = DateFormat.yMMMd().format(dateTime);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              height: 130,
              width: 150,
              child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: articles.urlToImage ?? '',
                placeholder:
                    (context, url) => Center(child: BrogressIndicatorLoaded()),
                errorWidget:
                    (context, url, error) => Image.asset(
                      'assets/image/221604-P1NK7S-248.jpg',
                      fit: BoxFit.fill,
                    ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Opacity(
                    opacity: 0.7,
                    child: Text(
                      articles.source!.name ?? '',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    articles.description?? '',

                    style: TextStyle(
                      fontSize: 16,
                      color: isdark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        FontAwesomeIcons.circleUser,
                        color: isdark ? Colors.orange : Colors.blue,
                      ),
                      Opacity(
                        opacity: 0.7,
                        child: Text(
                          formatted,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
