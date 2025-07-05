import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:newsapp/components/loading_indicator.dart';
import 'package:newsapp/core/utils/app_router.dart';
import 'package:newsapp/data/model/news_model.dart';

class MyCarouselSlider extends StatefulWidget {
  const MyCarouselSlider({super.key, required this.articles});
  final List<Articles> articles;
  @override
  State<MyCarouselSlider> createState() => _MyCarouselSliderState();
}

class _MyCarouselSliderState extends State<MyCarouselSlider> {
  int activeindex = 0;
  CarouselSliderController? carouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isdark = theme.brightness == Brightness.dark;
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: carouselController,
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.75,
            autoPlayInterval: Duration(seconds: 1),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
            onPageChanged:
                (index, reason) => setState(() {
                  activeindex = index;
                }),
          ),
          itemCount: widget.articles.length,
          itemBuilder: (context, index, realIndex) {
            final data = widget.articles[index];
            DateTime dateTime = DateTime.parse(data.publishedAt ?? '');
            String formatted = DateFormat.yMMMd().format(dateTime);
            return GestureDetector(
              onTap: () {
                context.push(AppRouter.knewdeatils, extra: data);
              },
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(18),
                    child: SizedBox(
                      height: 200,
                      width: 400,
                      child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: data.urlToImage ?? '',
                        placeholder:
                            (context, url) =>
                                Center(child: BrogressIndicatorLoaded()),
                        errorWidget:
                            (context, url, error) => Image.asset(
                              'assets/image/221604-P1NK7S-248.jpg',
                              fit: BoxFit.fill,
                            ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 40,
                    left: 10,
                    right: 20,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                data.source!.name ?? '',
                                style: TextStyle(
                                  color: isdark ? Colors.white : Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),

                            Text(
                              formatted,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,

                          data.description ?? '',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(
              widget.articles.length > 5 ? 5 : widget.articles.length,
              (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 10,
                  ),
                  height: 6,
                  width: activeindex == index ? 20 : 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color:
                        activeindex == index ? theme.primaryColor : Colors.grey,
                  ),
                );
              },
            ),
          ],
        ),
        // AnimatedSmoothIndicator(
        //   activeIndex: activeindex,
        //   count: widget.articles.length,
        //   effect: ScrollingDotsEffect(
        //     dotHeight: 8,
        //     dotWidth: 8,
        //     activeDotColor: isdark ? Colors.orange : Colors.blue,
        //     dotColor: Colors.grey,
        //   ),
        // ),
      ],
    );
  }
}
