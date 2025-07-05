import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:newsapp/components/loading_indicator.dart';
import 'package:newsapp/data/model/news_model.dart';

class ImageNews extends StatelessWidget {
  const ImageNews({super.key, required this.articles});
  final Articles articles;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        height: 250,
        width: double.infinity,
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
    );
  }
}
